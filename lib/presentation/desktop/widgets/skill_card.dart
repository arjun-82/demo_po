import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String? imageUrl, title, description;
  final GestureTapCallback? onTap;
  const SkillCard(
      {super.key, this.imageUrl, this.title, this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final ColorController controller = Get.put(
        ColorController(
          context: context,
        ),
        tag: UniqueKey().toString());

    final size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => controller.changeColor(true),
      onExit: (_) => controller.changeColor(false),
      child: AnimatedBuilder(
        animation: controller.colorAnimation,
        builder: (context, child) {
          return SizedBox(
            height: size.height * 0.25,
            width: size.width * 0.14,
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                color: controller.colorAnimation.value,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: SizePadding.allPx8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        imageUrl ?? "assets/icons/linkedin.svg",
                        height: size.height * .05,
                      ),
                      Spacing.heightPx8,
                      Text(
                        title ?? "Skill",
                        style: TextStyle(
                            fontFamily: FontClass.outfit,
                            fontWeight: FontWeight.bold,
                            fontSize: TextSize.px18),
                      ),
                      Text(
                        description ?? "Description",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: TextSize.px10,
                            color: darkMode
                                ? ColorPlattes.textDarkLabel
                                : ColorPlattes.textLightLabel),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
