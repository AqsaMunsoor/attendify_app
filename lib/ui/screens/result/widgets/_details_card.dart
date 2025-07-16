part of '../result_bin.dart';

class _DetailsCard extends StatelessWidget {
  final PayslipData data;
  const _DetailsCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: Space.p.all.t16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Extracted Information",
              style: AppText.h5.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.neutral,
              ),
            ),
            const Divider(height: 24, color: AppColors.white300),
            _DetailRow(label: "Employee Name", value: data.employeeName),
            _DetailRow(label: "Month & Year", value: data.monthYear),
            _DetailRow(label: "Total Salary", value: data.totalSalary),
            _DetailRow(label: "Net Salary", value: data.netSalary),
          ],
        ),
      ),
    );
  }
}
