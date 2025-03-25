import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class AboutText extends StatelessWidget {
  const AboutText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 90, right: 16, left: 600),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
