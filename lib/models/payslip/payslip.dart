class PayslipData {
  final String? employeeName;
  final String? totalSalary;
  final String? netSalary;
  final String? monthYear;

  PayslipData({
    this.employeeName,
    this.totalSalary,
    this.netSalary,
    this.monthYear,
  });

  // An empty constructor for initial state
  factory PayslipData.empty() => PayslipData();
}
