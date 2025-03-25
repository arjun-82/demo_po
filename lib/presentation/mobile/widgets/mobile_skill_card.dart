import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileSkillCard extends StatelessWidget {
  const MobileSkillCard({
    super.key,
    this.imageUrl,
    this.title,
    this.description,
    this.onTap,
  });

  final String? imageUrl;
  final String? title;
  final String? description;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Card(
      color: darkMode ? ColorPlattes.dark : ColorPlattes.light,
      child: Padding(
        padding: SizePadding.allPx8,
        child: InkWell(
          onTap: onTap,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          radius: 30,
          splashColor: Theme.of(context).brightness == Brightness.dark
              ? ColorPlattes.lightSecondary
              : ColorPlattes.lightSecondary,
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
                title ?? "Flutter",
                style: TextStyle(
                    fontFamily: FontClass.outfit,
                    fontWeight: FontWeight.bold,
                    fontSize: TextSize.px18),
              ),
              Text(
                description ??
                    "Flutter is an open-source UI software development toolkit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: TextSize.px12,
                    color: darkMode
                        ? ColorPlattes.textDarkLabel
                        : ColorPlattes.textLightLabel),
              )
            ],
          ),
        ),
      ),
    );
  }
}
