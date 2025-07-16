part of '../configs.dart';

class AppColors {
  // Primary (Blue)
  static const Color primary = Color(0xFF3B4DDB); // B900
  static const Color primary800 = Color(0xFF4B5BE2);
  static const Color primary700 = Color(0xFF5B6AE8);
  static const Color primary600 = Color(0xFF6C78ED);
  static const Color primary500 = Color(0xFF7D87F2);
  static const Color primary400 = Color(0xFF8E95F7);
  static const Color primary300 = Color(0xFF9FA3FA);
  static const Color primary200 = Color(0xFFB0B1FB);
  static const Color primary100 = Color(0xFFC2C7FD);

  // Neutral (Dark greys)
  static const Color neutral = Color(0xFF0C1024); // B900
  static const Color neutral800 = Color(0xFF27364B);
  static const Color neutral700 = Color(0xFF39465A);
  static const Color neutral600 = Color(0xFF4B5669);
  static const Color neutral500 = Color(0xFF5D6778);
  static const Color neutral400 = Color(0xFF707988);
  static const Color neutral300 = Color(0xFF838B98);
  static const Color neutral200 = Color(0xFF979DA9);
  static const Color neutral100 = Color(0xFFABB0B9);

  // Neutral (Light greys/whites)
  static const Color white400 = Color(0xFFE2E8F0); // W400
  static const Color white300 = Color(0xFFECF0F5);
  static const Color white200 = Color(0xFFF1F4F9);
  static const Color white100 = Color(0xFFFAFBFF);
  static const Color white900 = Color(0xFFFFFFFF);

  // Semantic Green
  static const Color green800 = Color(0xFF026C3D); // G800
  static const Color green700 = Color(0xFF117A44);
  static const Color green600 = Color(0xFF24874C);
  static const Color green500 = Color(0xFF399453);
  static const Color green400 = Color(0xFF4EA15B);
  static const Color green300 = Color(0xFF64AE63);
  static const Color green200 = Color(0xFF7AB96B);
  static const Color green100 = Color(0xFF92C475);

  // Semantic Red
  static const Color red800 = Color(0xFFB9151B); // R800
  static const Color error = Color(0xFFC82D2A);
  static const Color errorBorder = Color(0xFFD5443F);
  static const Color red500 = Color(0xFFE15B53);
  static const Color red400 = Color(0xFFEB7167);
  static const Color red300 = Color(0xFFF3877C);
  static const Color red200 = Color(0xFFF89B91);
  static const Color red100 = Color(0xFFFBAFA6);

  // Semantic Yellow
  static const Color yellow800 = Color(0xFFE4A400); // Y800
  static const Color yellow700 = Color(0xFFE9B12A);
  static const Color yellow600 = Color(0xFFEDBF4D);
  static const Color yellow500 = Color(0xFFF0CC6F);
  static const Color yellow400 = Color(0xFFF3D891);
  static const Color yellow300 = Color(0xFFF6E5B3);
  static const Color yellow200 = Color(0xFFF8F1D5);
  static const Color yellow100 = Color(0xFFFBFCEE);

  // Default system colors
  static const black = Colors.black;
  static const lightBlack = Colors.black54;
  static const veryLightBlack = Colors.black26;

  static const white = Colors.white;
  static const whiteTransparent = Colors.white12;

  static const grey = Colors.grey;
  static final greyLight = Colors.grey[300]!;
  static final greyLighter = Colors.grey[100]!;

  static const transparent = Colors.transparent;

  // Defaults
  static final cardBorder = greyLight;
  static const inActive = grey;
  static const highlight = yellow600;
}
