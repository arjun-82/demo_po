import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileTitleText extends StatelessWidget {
  final String title;
  final Key? scrollKey;
  final bool isUnderLine;

  const MobileTitleText({
    super.key,
    required this.title,
    this.scrollKey,
    required this.isUnderLine,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      key: scrollKey,
      crossAxisAlignment: CrossAxisAlignment.center, // Ensures alignment
      children: [
        Spacing.heightPx16,
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: darkMode
                  ? ColorPlattes.textDarkLabel
                  : ColorPlattes.textLightLabel,
              fontWeight: FontWeight.bold,
              // fontFamily: FontClass.outfit,
              fontSize: TextSize.px24,
            ),
          ),
        ),
        const SizedBox(height: 2),
        isUnderLine
            ? Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: darkMode
                      ? ColorPlattes.darkPrimary
                      : ColorPlattes.lightPrimary,
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            : const SizedBox.shrink(),
        Spacing.heightPx16,
      ],
    );
  }
}
