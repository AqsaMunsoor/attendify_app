part of 'result_bin.dart';

class ResultScr extends StatelessWidget {
  const ResultScr({super.key});

  @override
  Widget build(BuildContext context) {
    final ResultCon con = Get.find<ResultCon>();

    return Scaffold(
      backgroundColor: AppColors.white900,
      appBar: AppBar(
        title: const Text("Payslip Details"),
        centerTitle: true,
        backgroundColor: AppColors.white900,
        foregroundColor: AppColors.neutral,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Space.p.all.t24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.file(File(con.imagePath), fit: BoxFit.contain),
              ),
              Space.y.t24,
              Obx(() {
                switch (con.status.value) {
                  case OCRStatus.processing:
                    return const _ProcessingView();
                  case OCRStatus.success:
                    return _DetailsCard(data: con.payslipData.value);
                  case OCRStatus.error:
                    return const _ErrorView();
                  default:
                    return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
