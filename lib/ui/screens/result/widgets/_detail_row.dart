part of '../result_bin.dart';

class _DetailRow extends StatelessWidget {
  final String label;
  final String? value;

  const _DetailRow({required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.p.vertical.t08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppText.bodyRegular.copyWith(color: AppColors.neutral500),
          ),
          Text(
            value ?? 'Not found',
            style: AppText.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.neutral,
            ),
          ),
        ],
      ),
    );
  }
}
