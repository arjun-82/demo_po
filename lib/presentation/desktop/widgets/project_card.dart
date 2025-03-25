import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String? title, description, imageUrl, design;
  final GestureTapCallback? onTap;
  const ProjectCard({
    super.key, this.title, this.description, this.imageUrl, this.design, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final ColorController controller = Get.put(
        ColorController(
          context: context,
        ),
        tag: UniqueKey().toString());
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSINf-h7s-dTiMQ7IGfWORtc28YXGp-82Zzhw&s"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: MouseRegion(
                onEnter: (_) => controller.changeColor(true),
                onExit: (_) => controller.changeColor(false),
                child: AnimatedBuilder(
                    animation: controller.colorAnimation,
                    builder: (context, child) {
                      return Container(
                        width: size.width,
                        height: size.height,
                        padding: SizePadding.horizontalPx64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.colorAnimation.value,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                             title ?? "Project Name",
                              style: TextStyle(
                                  fontSize: TextSize.px16,
                                  fontFamily: FontClass.outfit,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5),
                            ),
                            Spacing.heightPx16,
                             Text(
                             description ?? "Project description: This is a demo project showcasing the portfolio. It includes various features and functionalities to demonstrate the skills and expertise in Flutter development.",
                              style: const TextStyle(
                                  fontSize: TextSize.px24,
                                  fontWeight: FontWeight.bold),
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
                            Spacing.heightPx32,
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              hoverColor: darkMode
                                  ? ColorPlattes.buttonColorDark.withOpacity(.1)
                                  : ColorPlattes.buttonColorLight
                                      .withOpacity(.1),
                              focusColor: darkMode
                                  ? ColorPlattes.buttonColorDark.withOpacity(.1)
                                  : ColorPlattes.buttonColorLight
                                      .withOpacity(.1),
                              mouseCursor: MouseCursor.uncontrolled,
                              onTap: onTap,
                              child: Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: .5,
                                          color: ColorPlattes.buttonColorLight),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Wrap(
                                      spacing: 9,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          "VIEW WORK",
                                          style: TextStyle(
                                              fontSize: TextSize.px10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                            size: 18,
                                            HugeIcons.strokeRoundedArrowRight01)
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                          ],
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
