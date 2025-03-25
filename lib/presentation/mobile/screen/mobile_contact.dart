import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileContact extends StatelessWidget {
  final Key? scrollKey;
  const MobileContact({super.key, this.scrollKey});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final UrlController urlController = Get.put(UrlController());
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: darkMode ? ColorPlattes.dark : ColorPlattes.light,
      child: Container(
        height: size.height / 2.9,
        width: size.width / 1,
        key: scrollKey,
        decoration: BoxDecoration(
            // color: ColorPlattes.lightSecondary,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: -150,
              child: SvgPicture.asset(
                "assets/svg/contactMe.svg",
                height: 270,
                width: 300,
                // ignore: deprecated_member_use
                color: darkMode
                    ? ColorPlattes.darkPrimary
                    : ColorPlattes.lightPrimary,
              ),
            ),
            Center(
              child: Padding(
                padding: SizePadding.allPx32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's Work Together!",
                      style: TextStyle(
                        color: darkMode
                            ? ColorPlattes.textDarkLabel
                            : ColorPlattes.textLightLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: TextSize.px24,
                      ),
                    ),
                    Spacing.heightPx16,
                    const Text(
                      "Got an idea? A project in mind? Or just want to say hi? Let's connect and create something amazing together!",
                      style: TextStyle(fontSize: TextSize.px12),
                      textAlign: TextAlign.center,
                    ),
                    Spacing.heightPx16,
                    const Text(
                      "Drop me a message—I’d love to hear from you!",
                      style: TextStyle(
                        fontSize: TextSize.px12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacing.heightPx16,
                    ElevatedButton(
                        onPressed: () =>
                            urlController.openUrl("https://wa.me/8089991810"),
                        child: Text(
                          "Contact Me",
                          style: TextStyle(
                              fontSize: 14,
                              color: darkMode
                                  ? ColorPlattes.dark
                                  : ColorPlattes.light),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
