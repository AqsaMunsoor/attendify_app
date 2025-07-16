part of '../result_bin.dart';

class _ProcessingView extends StatelessWidget {
  const _ProcessingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(color: AppColors.neutral),
          Space.y.t12,
          Text(
            "Extracting data from payslip...",
            style: AppText.bodyMedium.copyWith(color: AppColors.neutral500),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Space.p.all.t32,
        child: Text(
          "Failed to extract data.\nPlease ensure the image is clear and try again.",
          textAlign: TextAlign.center,
          style: AppText.bodyMedium.copyWith(color: AppColors.error),
        ),
      ),
    );
  }
}
