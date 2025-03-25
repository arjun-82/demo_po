import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    super.key,
  });

  static const double _footerHeight = 100;

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor =
        darkMode ? ColorPlattes.darkPrimary : ColorPlattes.lightPrimary;
    return Container(
      height: _footerHeight,
      padding: SizePadding.allPx16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFooterText(darkMode),
          _buildDisclaimerText(darkMode),
          _buildSignatureText(iconColor),
        ],
      ),
    );
  }

  Widget _buildFooterText(bool darkMode) {
    return Text(
      "© 2024 Arjun Portfolio. All rights reserved.",
      style: TextStyle(
        color: darkMode
            ? ColorPlattes.textDarkPrimary
            : ColorPlattes.textLightPrimary,
        fontSize: TextSize.px14,
      ),
    );
  }

  Widget _buildDisclaimerText(bool darkMode) {
    return Text(
      "Unauthorized copying, or distribution of this code is prohibited.",
      style: TextStyle(
        overflow: TextOverflow.clip,
        color:
            darkMode ? ColorPlattes.textDarkLabel : ColorPlattes.textLightLabel,
        fontSize: TextSize.px12,
      ),
    );
  }

  Widget _buildSignatureText(Color iconColor) {
    return Text(
      "Arjun ❤️",
      style: TextStyle(
        color: iconColor,
        fontFamily: FontClass.dancingScript,
        fontSize: TextSize.px14,
      ),
    );
  }
}
