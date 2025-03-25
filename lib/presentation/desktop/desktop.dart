import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScrollControllerX());

    return Scaffold(
      appBar: const DesktopAppBar(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        padding: SizePadding.horizontalPx32,
        child: Column(
          children: [
            //home
            DesktopHome(
              scrollKey: controller.homeKey,
            ),
            // skill
            TitleText(
              title: "Technical Skill",
              scrollKey: controller.skillKey,
              isUnderLine: false,
            ),
            const Skill(),
            // experience
            const TitleText(
              title: "Experience",
              isUnderLine: false,
            ),
            Experience(),

            // projrct
            TitleText(
              title: "Projects",
              scrollKey: controller.projectKey,
              isUnderLine: false,
            ),
            const Project(),
            // contact
            Spacing.heightPx32,
            Contact(
              scrollKey: controller.contactKey,
            ),
            // Get Touch
            const TitleText(title: "Get In Touch!", isUnderLine: false),
            GetTouch(
              scrollKey: controller.getTouchKey,
            ),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
