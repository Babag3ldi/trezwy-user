import 'dart:math';
import 'package:flutter/material.dart';

class ShakeWidget extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final double shakeOffset;

  const ShakeWidget({
    super.key,
    required this.child,
    required this.controller,
    this.shakeOffset = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Sinus tolkuny (Sine wave) arkaly titreme döredýäris
        // Animasiýa 0-dan 1-e gidýär, biz ony saga-çepe yrgyldadýarys
        final double sineValue = sin(4 * pi * controller.value);
        
        return Transform.translate(
          offset: Offset(sineValue * shakeOffset, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}