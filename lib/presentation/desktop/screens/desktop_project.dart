import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ExapndController extends GetxController {
  final RxBool showAll = false.obs;

  void toggleProjects() {
    showAll.value = !showAll.value;
  }
}

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    final ExapndController controller = Get.put(ExapndController());
    final List<String> projectCards = [
      "Project 1",
      "Project 2",
      "Project 3",
      "Project 4",
    ];

    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          final displayCount = controller.showAll.value
              ? projectCards.length
              : (projectCards.length > 2 ? 2 : projectCards.length);
          return AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              children: List.generate(displayCount, (index) {
                return ProjectCard(
                  title: projectCards[index],
                  description:
                      "Project description: This is a demo project showcasing the portfolio. It includes various features and functionalities to demonstrate the skills and expertise in Flutter development.",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSINf-h7s-dTiMQ7IGfWORtc28YXGp-82Zzhw&s",
                  design: "Design",
                );
              }),
            ),
          );
        }),
        if (projectCards.length > 2) Spacing.heightPx32,
        Obx(() => SizedBox(
              width: 130,
              height: 41,
              child: OutlinedButton(
                onPressed: controller.toggleProjects,
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                    const BorderSide(color: ColorPlattes.buttonColorLight),
                  ),
                ),
                child: Text(
                  controller.showAll.value ? "Minimize" : "Expand",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w500,
                    color: darkMode
                        ? ColorPlattes.textDarkPrimary
                        : ColorPlattes.textLightPrimary,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
