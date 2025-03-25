import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ColorController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ColorController({this.startColor, this.endColor, required this.context});

  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  final BuildContext context;
  final Color? startColor, endColor;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    final darkMode = Theme.of(context).brightness == Brightness.dark;

    colorAnimation = ColorTween(
      begin: startColor ?? (darkMode ? ColorPlattes.dark : ColorPlattes.light),
      end: endColor ??
          (darkMode
              ? ColorPlattes.cardColorLight.withOpacity(0.6)
              : ColorPlattes.cardColorDark),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
  }

  void changeColor(bool isHovering) {
    if (isHovering && animationController.status != AnimationStatus.forward) {
      animationController.forward();
    } else if (!isHovering &&
        animationController.status != AnimationStatus.reverse) {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
