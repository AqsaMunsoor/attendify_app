import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final Color? color;
  const FullScreenLoader({super.key, this.loading = false, this.color});

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return const SizedBox();
    }
    return AbsorbPointer(
      absorbing: loading,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: CircularProgressIndicator(color: color)),
        ),
      ),
    );
  }
}

class AppIconLoader extends StatelessWidget {
  final double radius;
  final Color? overlayColor;
  const AppIconLoader({super.key, this.radius = 60.0, this.overlayColor});

  @override
  Widget build(BuildContext context) {
    final stroke = radius * 0.078;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image(image: AssetImage('assets/app_icon.png')),
        SizedBox(
          height: radius - stroke,
          width: radius - stroke,
          child: CircularProgressIndicator(
            color: overlayColor ,
            strokeWidth: stroke,
          ),
        ),
      ],
    );
  }
}
