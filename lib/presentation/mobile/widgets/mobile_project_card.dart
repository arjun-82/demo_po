import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileProjectCard extends StatelessWidget {
  final String? title, description, imageUrl, design;
  final GestureTapCallback? onTap;
  const MobileProjectCard(
      {super.key,
      this.title,
      this.description,
      this.imageUrl,
      this.design,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 1.4,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkMode ? ColorPlattes.dark : ColorPlattes.light,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  height: size.height / 2.6,
                  width: size.width,
                  fit: BoxFit.cover,
                  imageUrl ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSINf-h7s-dTiMQ7IGfWORtc28YXGp-82Zzhw&s"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "Project Name",
                  style: TextStyle(
                    fontSize: TextSize.px18,
                    fontFamily: FontClass.outfit,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.heightPx16,
                Text(
                  design ?? "Mobile Application Design",
                  style: TextStyle(
                      fontSize: TextSize.px12,
                      color: darkMode
                          ? ColorPlattes.textDarkLabel
                          : ColorPlattes.textLightLabel),
                ),
                Spacing.heightPx16,
                Text(
                  description ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: TextSize.px16, fontWeight: FontWeight.w500),
                ),
                Spacing.heightPx32,
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  hoverColor: darkMode
                      ? ColorPlattes.buttonColorDark.withOpacity(.1)
                      : ColorPlattes.buttonColorLight.withOpacity(.1),
                  focusColor: darkMode
                      ? ColorPlattes.buttonColorDark.withOpacity(.1)
                      : ColorPlattes.buttonColorLight.withOpacity(.1),
                  mouseCursor: MouseCursor.uncontrolled,
                  onTap: onTap,
                  child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: .5, color: ColorPlattes.buttonColorLight),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Wrap(
                          spacing: 9,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "VIEW WORK",
                              style: TextStyle(
                                  fontSize: TextSize.px10,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(size: 18, HugeIcons.strokeRoundedArrowRight01)
                          ],
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
