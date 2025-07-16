part of '../home_bin.dart';

class _FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeCon con = Get.put(HomeCon());

    final filters = [
      AttendanceStatus.all,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.late,
    ];

    return Padding(
      padding: Space.p.all.t16,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children:
            filters.map((filter) {
              return Obx(
                () => ChoiceChip(
                  label: Text(
                    filter.displayName,
                    style: AppText.bodyRegular.copyWith(
                      color:
                          con.activeFilter.value == filter
                              ? filter.color
                              : AppColors.neutral500,
                    ),
                  ),
                  backgroundColor: AppColors.white300,
                  selectedColor: filter.color.withOpacity(0.2),
                  selected: con.activeFilter.value == filter,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSelected: (_) => con.filterChanged(filter),
                ),
              );
            }).toList(),
      ),
    );
  }
}
