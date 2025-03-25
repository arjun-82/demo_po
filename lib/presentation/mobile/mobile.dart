import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScrollControllerX());
    return Scaffold(
      appBar: const MoblieAppBar(),
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        padding: SizePadding.horizontalPx8,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Home(),
            MobileHome(
              scrollKey: controller.homeKey,
            ),
            // Skill(),
            MobileTitleText(
              title: "mySkill",
              isUnderLine: false,
              key: controller.skillKey,
            ),
            const MobileSkill(),

            // Experiance(),
            MobileTitleText(
              title: "Experience",
              isUnderLine: false,
              scrollKey: controller.experianceKey,
            ),
            Experience(),
            // Project(),
            MobileTitleText(
              title: "Project",
              isUnderLine: false,
              scrollKey: controller.projectKey,
            ),
            // const MobileProject(),
            Spacing.heightPx16,
            // Contact(),
            MobileContact(
              scrollKey: controller.contactKey,
            ),
            // Connect(),
            MobileGetTouch(
              scrollKey: controller.getTouchKey,
            ),
            // Footer(),
            const MobileFooter()
          ],
        ),
      ),
    );
  }
}
