part of '../configs.dart';

extension SuperTextStyles on TextStyle {
  TextStyle promptFamily() {
    return merge(const TextStyle(fontFamily: 'Prompt'));
  }
}

extension AppTextStyleExtensions on AppTextStyle {
  AppTextStyle get thin => copyWith(fontWeight: AppText.thin);
  AppTextStyle get extraLight => copyWith(fontWeight: AppText.extraLight);
  AppTextStyle get light => copyWith(fontWeight: AppText.light);
  AppTextStyle get regular => copyWith(fontWeight: AppText.regular);
  AppTextStyle get medium => copyWith(fontWeight: AppText.medium);
  AppTextStyle get semiBold => copyWith(fontWeight: AppText.semiBold);
  AppTextStyle get bold => copyWith(fontWeight: AppText.bold);
  AppTextStyle get extraBold => copyWith(fontWeight: AppText.extraBold);
  AppTextStyle get black => copyWith(fontWeight: AppText.black);

  AppTextStyle get blackColor => copyWith(color: Colors.black);
  AppTextStyle get whiteColor => copyWith(color: Colors.white);

}
