import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:employee_app/configs/configs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:employee_app/configs/configs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:employee_app/configs/configs.dart';

class AppHeader extends StatelessWidget {
  /// Optional leading widget
  final Widget? leading;

  /// Optional trailing widget
  final Widget? trailing;

  /// Widget to show in the middle (optional). If not provided, defaults to Social logo + text.
  final Widget? centerWidget;

  /// Whether the `centerWidget` should be centered. Defaults to false (i.e., aligned left).
  final bool centerAlign;

  /// Callback for tapping the default social area
  final VoidCallback? onSocialTap;

  /// Callback for leading
  final VoidCallback? onLeadingTap;

  /// Callback for trailing
  final VoidCallback? onTrailingTap;

  const AppHeader({
    super.key,
    this.leading,
    this.trailing,
    this.centerWidget,
    this.centerAlign = false,
    this.onSocialTap,
    this.onLeadingTap,
    this.onTrailingTap,
  });

  Widget _buildTappableArea({
    required Widget? child,
    required VoidCallback? onTap,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
  }) {
    if (child == null) return const SizedBox.shrink();
    if (onTap == null) return child;
    return GestureDetector(
      onTap: onTap,
      behavior: hitTestBehavior,
      child: child,
    );
  }

  Widget _defaultSocialWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/app_icon.png', width: 24, height: 24),
        const SizedBox(width: 12),
        Text(
          'Social',
          style: AppText.h3.copyWith(fontWeight: AppText.extraBold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget middle =
        centerWidget ??
        _buildTappableArea(child: _defaultSocialWidget(), onTap: onSocialTap);

    return Padding(
      padding: Space.p.horizontal.t24.add(Space.p.vertical.t16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!centerAlign)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTappableArea(child: leading, onTap: onLeadingTap),
                middle,
                _buildTappableArea(child: trailing, onTap: onTrailingTap),
              ],
            )
          else
            SizedBox(
              height: 48, // or any height that fits your header content
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTappableArea(child: leading, onTap: onLeadingTap),
                  const Spacer(),
                  _buildTappableArea(child: trailing, onTap: onTrailingTap),
                ],
              ),
            ),
          if (centerAlign) middle,
        ],
      ),
    );
  }
}
