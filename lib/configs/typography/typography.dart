part of '../configs.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    double super.fontSize = 12,
    FontWeight super.fontWeight = FontWeight.normal,
    super.color,
    super.letterSpacing,
    super.decoration,
    super.decorationColor,
  }) : super(fontFamily: 'Inter');

  @override
  AppTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return AppTextStyle(
      fontSize: fontSize ?? this.fontSize ?? 12,
      fontWeight: fontWeight ?? this.fontWeight ?? FontWeight.normal,
      color: color ?? this.color,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
    );
  }

  // Operator overloading for +
  AppTextStyle operator +(dynamic other) {
    if (other is FontWeight) {
      return copyWith(fontWeight: other);
    } else if (other is Color) {
      return copyWith(color: other);
    } else if (other is TextStyle) {
      return _mergeWithTextStyle(other);
    }
    return this;
  }

  AppTextStyle _mergeWithTextStyle(TextStyle other) {
    return copyWith(
      fontSize: other.fontSize,
      fontWeight: other.fontWeight,
      color: other.color,
      letterSpacing: other.letterSpacing,
      decoration: other.decoration,
      decorationColor: other.decorationColor,
    );
  }
}
