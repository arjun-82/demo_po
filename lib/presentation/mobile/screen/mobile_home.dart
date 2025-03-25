import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({
    super.key, required this.scrollKey,
  });
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1,
      width: size.width,
      key: scrollKey,
      child: Stack(
        children: [
          Spacing.heightPx64,
          Positioned(
            top: size.height / 2.5,
            right: 0,
            left: 0,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: darkMode
                          ? ColorPlattes.textDarkPrimary
                          : ColorPlattes.textLightPrimary,
                      fontSize: TextSize.px48,
                    ),
                    children: [
                      TextSpan(
                        text: "Hey, I'm ",
                        style: TextStyle(
                          fontFamily: FontClass.raleway,
                          fontSize: TextSize.px48,
                        ),
                      ),
                      TextSpan(
                        text: "ARJUN",
                        style: TextStyle(
                          fontFamily: FontClass.outfit,
                          color: darkMode
                              ? ColorPlattes.textDarkPrimary
                              : ColorPlattes.textLightPrimary,
                          fontSize: TextSize.px48,
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
                        fontSize: TextSize.px24),
                    children: [
                      TextSpan(
                        text: "I'm a",
                        style: TextStyle(
                          fontFamily: FontClass.raleway,
                        ),
                      ),
                      TextSpan(
                        text: " Flutter ",
                        style: TextStyle(
                          fontFamily: FontClass.outfit,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "Full Stack Developer",
                        style: TextStyle(
                          fontFamily: FontClass.raleway,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("About Me",
                        style: TextStyle(
                          fontSize: TextSize.px20,
                          fontWeight: FontWeight.bold,
                        )),
                    Spacing.heightPx16,
                    const Text(
                      "I am a passionate and dedicated fresher with a strong foundation in Flutter development.\n"
                      "I love creating beautiful and functional mobile applications.\n"
                      "I am eager to learn and grow in the field of software development and am always on the lookout for good opportunities.\n"
                      "I have hands-on experience with Dart, Flutter, and various state management techniques.\n"
                      "I am also familiar with RESTful APIs, Firebase, and version control systems like Git.\n"
                      "My goal is to contribute to impactful projects and collaborate with talented professionals to enhance my skills and knowledge.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: TextSize.px14,
                      ),
                    ),
                    Spacing.heightPx16,
                    const Column(
                      children: [
                        Text("Scroll down"),
                        Icon(
                          HugeIcons.strokeRoundedArrowDown01,
                          color: ColorPlattes.buttonColorLight,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
