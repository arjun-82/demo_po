import 'package:arjun_portfolio/presentation/mobile/widgets/mobile_connect_form.dart';
import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileGetTouch extends StatelessWidget {
  const MobileGetTouch({super.key, this.scrollKey});
  final Key? scrollKey;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final UrlController urlController = Get.put(UrlController());
    return SizedBox(
      height: size.height / 1.1,
      width: size.width,
      key: scrollKey,
      child: Column(
        children: [
          Container(
            padding: SizePadding.allPx32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get In Touch!",
                  style: TextStyle(
                    color: darkMode
                        ? ColorPlattes.textDarkLabel
                        : ColorPlattes.textLightLabel,
                    fontWeight: FontWeight.bold,
                    fontSize: TextSize.px24,
                  ),
                ),
                Spacing.heightPx8,
                Text(
                  "Feel free to reach out to me via the form below.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkMode
                        ? ColorPlattes.textDarkLabel
                        : ColorPlattes.textLightLabel,
                    fontSize: TextSize.px16,
                  ),
                ),
                Spacing.heightPx8,
                const MobileContactForm(),
                Spacing.heightPx8,
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () =>
                            urlController.makeCall("+918089991810"),
                        icon: Icon(
                          HugeIcons.strokeRoundedCall,
                          color: darkMode
                              ? ColorPlattes.darkPrimary
                              : ColorPlattes.lightPrimary,
                        )),
                    socialIconButton(
                        urlController,
                        darkMode,
                        "https://www.linkedin.com/in/arjun-c-674395343/",
                        HugeIcons.strokeRoundedLinkedin01),
                    socialIconButton(
                      urlController,
                      darkMode,
                      "https://github.com/arjun-82",
                      HugeIcons.strokeRoundedGithub,
                    ),
                    socialIconButton(
                        urlController,
                        darkMode,
                        "https://www.linkedin.com/in/arjun-c-674395343/",
                        HugeIcons.strokeRoundedLinkedin01),
                    IconButton(
                        onPressed: () =>
                            urlController.openMap(address: "Calicut, Kerala"),
                        icon: Icon(
                          HugeIcons.strokeRoundedLocation01,
                          color: darkMode
                              ? ColorPlattes.darkPrimary
                              : ColorPlattes.lightPrimary,
                        )),
                    socialIconButton(
                        urlController,
                        darkMode,
                        "https://www.instagram.com/arjunnh__/#",
                        HugeIcons.strokeRoundedInstagram),
                    socialIconButton(
                        urlController,
                        darkMode,
                        "https://x.com/arjyun_official",
                        HugeIcons.strokeRoundedTwitter),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconButton socialIconButton(
      UrlController urlController, bool darkMode, String url, IconData icon) {
    return IconButton(
        onPressed: () => urlController.openUrl(url),
        icon: Icon(
          icon,
          color:
              darkMode ? ColorPlattes.darkPrimary : ColorPlattes.lightPrimary,
        ));
  }
}
