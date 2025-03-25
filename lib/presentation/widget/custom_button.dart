import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String? iconUrl, text;
  final bool isTextButton, isSelected;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.iconUrl,
    required this.isTextButton,
    this.text = "",
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ColorController controller = Get.put(
      ColorController(
        context: context,
        endColor: Theme.of(context).brightness == Brightness.dark
            ? ColorPlattes.darkSecondary
            : ColorPlattes.lightPrimary,
        startColor: Theme.of(context).brightness == Brightness.dark
            ? ColorPlattes.light
            : ColorPlattes.dark,
      ),
      tag: UniqueKey().toString(),
    );

    return InkWell(
      borderRadius: BorderRadius.circular(23),
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      customBorder: const LinearBorder(),
      focusColor: Colors.transparent,
      radius: 15,
      splashColor: Theme.of(context).brightness == Brightness.dark
          ? ColorPlattes.darkSecondary
          : ColorPlattes.lightSecondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: isTextButton ? _buildTextButton(controller) : _buildIconButton(),
      ),
    );
  }

  Widget _buildTextButton(ColorController controller) {
    return MouseRegion(
      onEnter: (_) => controller.changeColor(true),
      onExit: (_) => controller.changeColor(false),
      child: AnimatedBuilder(
        animation: controller.colorAnimation,
        builder: (context, child) => Text(
          text!,
          style: TextStyle(
            fontSize: TextSize.px18,
            color: isSelected
                ? (Theme.of(context).brightness == Brightness.dark
                    ? ColorPlattes.darkSecondary
                    : ColorPlattes.lightSecondary)
                : controller.colorAnimation.value,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton() {
    return iconUrl != null
        ? SvgPicture.asset(height: 35, width: 35, iconUrl!)
        : const SizedBox();
  }
}
