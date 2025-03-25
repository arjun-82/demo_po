import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileSkill extends StatelessWidget {
  const MobileSkill({super.key});

  @override
  Widget build(BuildContext context) {
    final skillEntries = skills.values.toList(); // Convert map values to a list
    final UrlController urlController = Get.put(UrlController());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skillEntries.length, // Dynamically set item count
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Spacing.px8,
        crossAxisSpacing: Spacing.px8,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) {
        final skill = skillEntries[index];
        return MobileSkillCard(
          imageUrl: skill["imageUrl"]!,
          title: skill["name"]!,
          description: skill["description"]!,
          onTap: () => urlController.openUrl(skill["link"] ?? ""),
        );
      },
    );
  }
}
