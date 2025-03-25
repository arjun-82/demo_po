import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  static const double _footerHeight = 150;
  static const double _spacing = 10;

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
          _buildIconsRow(iconColor),
          Spacing.heightPx16,
          _buildFooterText(darkMode),
          _buildDisclaimerText(darkMode),
          _buildSignatureText(iconColor),
        ],
      ),
    );
  }

  Widget _buildIconsRow(Color iconColor) {
    final UrlController urlController = Get.put(UrlController());

    return Wrap(
      spacing: _spacing,
      children: [
        IconButton(
          onPressed: () =>
              urlController.openUrl("https://www.instagram.com/arjunnh__/#"),
          icon: Icon(
            size: 18,
            HugeIcons.strokeRoundedInstagram,
            color: iconColor,
          ),
          tooltip: "Instagram",
        ),
        IconButton(
          onPressed: () =>
              urlController.openUrl("https://x.com/arjyun_official"),
          icon: Icon(
            size: 18,
            HugeIcons.strokeRoundedTwitter,
            color: iconColor,
          ),
          tooltip: "X",
        ),
      ],
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
      "Unauthorized copying, modification, or distribution of this code is prohibited.",
      style: TextStyle(
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
