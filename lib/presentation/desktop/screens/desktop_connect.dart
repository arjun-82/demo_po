import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class GetTouch extends StatelessWidget {
  const GetTouch({super.key, this.scrollKey});
  final Key? scrollKey;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final UrlController urlController = Get.put(UrlController());
    return SizedBox(
      height: 450,
      width: size.width,
      key: scrollKey,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: SizePadding.allPx32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Work Together!",
                      style: TextStyle(
                        color: darkMode
                            ? ColorPlattes.textDarkLabel
                            : ColorPlattes.textLightLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: TextSize.px32,
                      ),
                    ),
                    Spacing.heightPx32,
                    DetailsLabel(
                      darkMode: darkMode,
                      title: "LinkeIn", // www.linkedin.com/in/arjun-c-674395343
                      onTap: () => urlController.openUrl(
                          "https://www.linkedin.com/in/arjun-c-674395343/"),
                      icon: HugeIcons.strokeRoundedLinkedin01,
                      text: "LinkedIn",
                    ),
                    DetailsLabel(
                      darkMode: darkMode,
                      title: "GitHub",
                      onTap: () =>
                          urlController.openUrl("https://github.com/arjun-82"),
                      icon: HugeIcons.strokeRoundedGithub,
                      text: "GitHub",
                    ),
                    DetailsLabel(
                      darkMode: darkMode,
                      title: "Location",
                      onTap: () =>
                          urlController.openMap(address: "Calicut, Kerala"),
                      icon: HugeIcons.strokeRoundedLocation01,
                      text: "Location",
                    ),
                    DetailsLabel(
                      darkMode: darkMode,
                      title: "Contact",
                      onTap: () => urlController.makeCall("+918089991810"),
                      icon: HugeIcons.strokeRoundedCall,
                      text: "contact number",
                    ),
                  ],
                ),
              )),
          const Expanded(
            flex: 3,
            child: ContactForm(),
          ),
        ],
      ),
    );
  }
}
