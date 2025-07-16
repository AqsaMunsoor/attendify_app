part of '../home_bin.dart';

class _AttendanceListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeCon con = Get.put(HomeCon());

    return Obx(
      () => ListView.builder(
        padding: Space.p.all.t16,
        itemCount: con.filteredRecords.length,
        itemBuilder: (context, index) {
          final record = con.filteredRecords[index];
          return Card(
            color: AppColors.white100,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: CircleAvatar(
                backgroundColor: record.status.color.withValues(alpha: 0.15),
                child: Icon(
                  HugeIcons.strokeRoundedUser,
                  color: record.status.color,
                ),
              ),
              title: Text(
                DateFormat.yMMMEd().format(record.date),
                style: AppText.bodyMedium.copyWith(
                  color: AppColors.neutral800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                record.status.displayName,
                style: AppText.bodyMedium.copyWith(
                  color: record.status.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
