import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScrollControllerX());
    final urlController = Get.put(UrlController());
    return Wrap(
      spacing: 64,
      children: [
        SizedBox(
          width: 140,
          height: 41,
          child: OutlinedButton(
            style: ButtonStyle(
              side: WidgetStateProperty.all(
                const BorderSide(color: ColorPlattes.buttonColorLight),
              ),
            ),
            onPressed: () => controller.scrollToSection(
                "Get In Touch", controller.contactKey),
            child: Text(
              "Get In Touch",
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontClass.raleway,
                fontWeight: FontWeight.w500,
                color: darkMode
                    ? ColorPlattes.lightSecondary
                    : ColorPlattes.lightPrimary,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 140,
          height: 41,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
              darkMode
                  ? ColorPlattes.lightSecondary
                  : ColorPlattes.lightPrimary,
            )),
            onPressed: () => urlController.downloadCv(
                "https://drive.usercontent.google.com/uc?id=1kTGBpY5Dzc7vLCqKtFXKtXyzDxK2hpCl&export=download"),
            child: Text(
              "Download CV",
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontClass.raleway,
                fontWeight: FontWeight.w500,
                color: darkMode
                    ? ColorPlattes.textLightPrimary
                    : ColorPlattes.textDarkPrimary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
