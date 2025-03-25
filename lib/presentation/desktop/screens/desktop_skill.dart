import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  const Skill({super.key});

  @override
  Widget build(BuildContext context) {
    final UrlController urlController = Get.put(UrlController());
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills.entries.map((entry) {
        return SkillCard(
          imageUrl: entry.value["imageUrl"] ?? "",
          title: entry.value["name"] ?? "",
          description: entry.value["description"] ?? "",
          onTap: () => urlController.openUrl(entry.value["link"] ?? ""),
        );
      }).toList(),
    );
  }
}

Map<String, Map<String, String>> skills = {
  "flutter": {
    "imageUrl": StringSvg.flutter,
    "name": "Flutter",
    "description":
        "A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.",
    "link": "https://flutter.dev"
  },
  "dart": {
    "imageUrl": StringSvg.dart,
    "name": "Dart",
    "description":
        "A client-optimized programming language for fast apps on any platform, primarily used with Flutter.",
    "link": "https://dart.dev"
  },
  "firebase": {
    "imageUrl": StringSvg.firebase,
    "name": "Firebase",
    "description":
        "A backend platform by Google offering authentication, database, cloud functions, and hosting.",
    "link": "https://firebase.google.com"
  },
  "github": {
    "imageUrl": StringSvg.github,
    "name": "GitHub",
    "description":
        "A cloud-based platform for version control and collaboration using Git repositories.",
    "link": "https://github.com"
  },
  "git": {
    "imageUrl": StringSvg.git,
    "name": "Git",
    "description":
        "A distributed version control system for tracking changes in source code during software development.",
    "link": "https://git-scm.com"
  },
};
