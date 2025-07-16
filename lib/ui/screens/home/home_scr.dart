part of 'home_bin.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCon con = Get.put(HomeCon());

    return Scaffold(
      backgroundColor: AppColors.white900,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: con.showImageSourceDialog,
        child: const Icon(
          HugeIcons.strokeRoundedCamera01,
          color: AppColors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FilterChips(),
              Expanded(
                child: Obx(() {
                  if (con.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.neutral,
                      ),
                    );
                  }
                  if (con.hasError) {
                    return const Center(
                      child: Text(
                        'Could not load data.',
                        style: TextStyle(color: AppColors.error),
                      ),
                    );
                  }
                  if (con.filteredRecords.isEmpty) {
                    return const Center(
                      child: Text(
                        'No attendance records found.',
                        style: TextStyle(color: AppColors.neutral600),
                      ),
                    );
                  }

                  return _AttendanceListView();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
