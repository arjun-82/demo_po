import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Key? scrollKey;
  final bool isUnderLine;
  final double? size;
  
  const TitleText(
      {super.key,
      required this.title,
      this.scrollKey,
      required this.isUnderLine, this.size});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      key: scrollKey,
      crossAxisAlignment: CrossAxisAlignment.center, // Ensures alignment
      children: [
        Spacing.heightPx32,
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: darkMode
                  ? ColorPlattes.textDarkLabel
                  : ColorPlattes.textLightLabel,
              fontWeight: FontWeight.bold,
              // fontFamily: FontClass.outfit,
              fontSize:size ?? TextSize.px32,
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
        Spacing.heightPx64,
      ],
    );
  }
}
