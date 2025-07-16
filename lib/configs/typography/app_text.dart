part of '../configs.dart';

class AppText {
  // Headings
  static AppTextStyle get h1 =>
      const AppTextStyle(fontSize: 40, fontWeight: AppText.semiBold);
  static AppTextStyle get h2 =>
      const AppTextStyle(fontSize: 32, fontWeight: AppText.bold);
  static AppTextStyle get h3 =>
      const AppTextStyle(fontSize: 24, fontWeight: AppText.bold);
  static AppTextStyle get h4 =>
      const AppTextStyle(fontSize: 18, fontWeight: AppText.semiBold);
  static AppTextStyle get h5 =>
      const AppTextStyle(fontSize: 16, fontWeight: AppText.medium);
  static AppTextStyle get h6 =>
      const AppTextStyle(fontSize: 14, fontWeight: AppText.medium);

  // Body
  static AppTextStyle get bodyRegular => const AppTextStyle(
    fontSize: 14,
    fontWeight: AppText.regular,
  ).copyWith(height: 1.75);
  static AppTextStyle get bodyMedium => const AppTextStyle(
    fontSize: 14,
    fontWeight: AppText.medium,
  ).copyWith(height: 1.75);

  // Labels
  static AppTextStyle get labelRegular =>
      const AppTextStyle(fontSize: 12, fontWeight: AppText.regular);
  static AppTextStyle get labelMedium =>
      const AppTextStyle(fontSize: 12, fontWeight: AppText.medium);

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
