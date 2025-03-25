
import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class DesktopHome extends StatelessWidget {
  final Key? scrollKey;
  const DesktopHome({
    super.key,
    this.scrollKey,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      key: scrollKey,
      height: size.height,
      width: size.width,
      padding: SizePadding.horizontalPx32,
      child: Stack(
        children: [
           const AboutText(),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 90, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: darkMode
                            ? ColorPlattes.textDarkPrimary
                            : ColorPlattes.textLightPrimary,
                        fontSize: TextSize.px64,
                      ),
                      children: [
                        TextSpan(
                          text: "Hey, I'm ",
                          style: TextStyle(
                            fontFamily: FontClass.raleway,
                            fontSize: TextSize.px64,
                          ),
                        ),
                        TextSpan(
                          text: "ARJUN",
                          style: TextStyle(
                            fontFamily: FontClass.outfit,
                            color: darkMode
                                ? ColorPlattes.lightSecondary
                                : ColorPlattes.lightPrimary,
                            fontSize: TextSize.px64,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacing.heightPx16,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: darkMode
                            ? ColorPlattes.textDarkPrimary
                            : ColorPlattes.textLightPrimary,
                        fontSize: TextSize.px64,
                      ),
                      children: [
                        TextSpan(
                          text: "I'm a",
                          style: TextStyle(
                            fontFamily: FontClass.raleway,
                            fontSize: TextSize.px32,
                          ),
                        ),
                        TextSpan(
                          text: " Flutter ",
                          style: TextStyle(
                            fontFamily: FontClass.outfit,
                            fontSize: TextSize.px32,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: "Full Stack Developer",
                          style: TextStyle(
                            fontFamily: FontClass.raleway,
                            fontSize: TextSize.px32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  HomeButtons(darkMode: darkMode),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SvgPicture.asset(
                  //   "assets/svg/Ellipse.svg",
                  //   height: 350,
                  //   width: 350,
                  //   color: darkMode
                  //       ? ColorPlattes.darkSecondary
                  //       : ColorPlattes.lightSecondary,
                  // ),
                  Text("Scroll down"),
                  Icon(
                    HugeIcons.strokeRoundedArrowDown01,
                    color: ColorPlattes.buttonColorLight,
                  ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 60),
          //     child: SvgPicture.asset(
          //       "assets/svg/FrameDemo.svg",
          //       height: 500,
          //       width: 500,
          //       color: darkMode
          //           ? ColorPlattes.textDarkPrimary
          //           : ColorPlattes.textLightPrimary,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
