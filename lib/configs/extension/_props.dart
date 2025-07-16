part of '../configs.dart';

class AppProps {
  static final categoryCard = _card(color: Colors.black54, borderRadius: 6);

  static final productCard = _card(
    borderColor: Colors.black54,
    borderRadius: 6,
  );

  static final favoriteCard = _card(
    borderColor: Colors.black.withOpacity(0.1),
    borderRadius: 12,
  );

  static final review = _card(
    color: const Color(0xFFF9F9F9),
    borderColor: Colors.grey[200],
    borderRadius: 12,
  );

  static final comment = _card(
    color: Colors.white,
    borderColor: Colors.grey[200],
    borderRadius: 8,
  );

  static BoxDecoration _card({
    Color? color,
    Color? borderColor,
    double borderWidth = 1,
    double borderRadius = 8,
  }) {
    return BoxDecoration(
      color: color,
      border:
          borderColor != null
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
