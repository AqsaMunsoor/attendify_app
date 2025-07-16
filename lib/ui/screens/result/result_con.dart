part of 'result_bin.dart';

enum OCRStatus { initial, processing, success, error }

class ResultCon extends GetxController {
  final String imagePath;

  final status = OCRStatus.initial.obs;
  final payslipData = PayslipData.empty().obs;

  ResultCon({required this.imagePath});

  @override
  void onInit() {
    super.onInit();
    if (imagePath.isNotEmpty) {
      processPayslip();
    } else {
      status.value = OCRStatus.error;
    }
  }

  Future<void> processPayslip() async {
    try {
      status.value = OCRStatus.processing;
      final inputImage = InputImage.fromFilePath(imagePath);
      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );
      textRecognizer.close();

      debugPrint("--- RAW OCR TEXT ---");
      debugPrint(recognizedText.text);
      debugPrint("--------------------");

      final parsedData = _parseRecognizedText(recognizedText.text);
      payslipData.value = parsedData;
      status.value = OCRStatus.success;
    } catch (e) {
      status.value = OCRStatus.error;
      Get.snackbar(
        'OCR Error',
        'Could not process the image. Please try again. Error: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  PayslipData _parseRecognizedText(String text) {
    final currencyRegex = RegExp(r'[₹ZT\s]*([\d,]+\.\d{2})\b');

    final dateRegex = RegExp(
      r"Payslip For the Month\s+([a-zA-Z]+\s+\d{4})",
      caseSensitive: false,
    );
    final monthYear = dateRegex.firstMatch(text)?.group(1)?.trim();

    final netPayableRegex = RegExp(
      r"TOTAL NET PAYABLE[\s\S]*?([₹\s\d,]+\.\d{2})",
      caseSensitive: false,
    );
    String? netSalary = netPayableRegex.firstMatch(text)?.group(1)?.trim();
    if (netSalary == null) {
      final netPayBoxRegex = RegExp(
        r"([₹\s\d,]+\.\d{2})\s+Employee Net Pay",
        caseSensitive: false,
      );
      netSalary = netPayBoxRegex.firstMatch(text)?.group(1)?.trim();
    }

    final lines = text.split('\n');

    final summaryLabels = [
      'Employee Name',
      'Designation',
      'Employee ID',
      'Date of Joining',
      'Pay Period',
      'Pay Date',
    ];
    final earningsLabels = [
      'Basic',
      'House Rent Allowance',
      'Conveyance Allowance',
      'Children Education',
      'Fixed Allowance',
      'Gross Earnings',
    ];

    final summaryHeaderIndex = lines.indexWhere(
      (line) => line.contains('EMPLOYEE SUMMARY'),
    );
    final earningsHeaderIndex = lines.indexWhere(
      (line) => line.contains('EARNINGS'),
    );

    final summaryValues =
        summaryHeaderIndex == -1
            ? <String>[]
            : lines
                .skip(summaryHeaderIndex)
                .where((line) => line.trim().startsWith(':'))
                .map((line) => line.replaceAll(':', '').trim())
                .toList();

    final earningsValues =
        earningsHeaderIndex == -1
            ? <String>[]
            : lines
                .skip(earningsHeaderIndex)
                .map((line) => currencyRegex.firstMatch(line)?.group(1))
                .where((v) => v != null)
                .cast<String>()
                .toList();

    final summaryCount = min(summaryLabels.length, summaryValues.length);
    final summaryMap = Map.fromIterables(
      summaryLabels.take(summaryCount),
      summaryValues.take(summaryCount),
    );

    final earningsCount = min(earningsLabels.length, earningsValues.length);
    final earningsMap = Map.fromIterables(
      earningsLabels.take(earningsCount),
      earningsValues.take(earningsCount),
    );

    final employeeName = summaryMap['Employee Name'];
    final totalSalary = earningsMap['Gross Earnings'];

    return PayslipData(
      employeeName: employeeName,
      monthYear: monthYear,
      totalSalary: totalSalary?.replaceAll(RegExp(r'[ZT\s]'), ''),
      netSalary: netSalary?.replaceAll(RegExp(r'[₹ZT\s]'), ''),
    );
  }
}
