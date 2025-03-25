import 'package:arjun_portfolio/presentation/upload.dart';
import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(70); // Corrected implementation

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    final controller = Get.put(ScrollControllerX());
    return PreferredSize(
      preferredSize: preferredSize, // Use the preferredSize defined above
      child: Container(
        height: preferredSize.height,
        padding: SizePadding.horizontalPx32,
        width: MediaQuery.of(context).size.width, // Ensures it spans full width
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Arjun Portfolio",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TextSize.px16,
                    fontFamily: FontClass.dancingScript),
              ),
              Wrap(
                spacing:
                    Spacing.px64, // Ensure Spacing.px64 is defined properly
                children: [
                  CustomButton(
                    onPressed: () =>
                        controller.scrollToSection("Home", controller.homeKey),
                    isTextButton: true,
                    isSelected: controller.selectedSection.value == "Home",
                    text: "Home",
                  ),
                  CustomButton(
                    onPressed: () => controller.scrollToSection(
                        "Skills", controller.skillKey),
                    isTextButton: true,
                    text: "Skills",
                    isSelected: controller.selectedSection.value == "Skills",
                  ),
                  CustomButton(
                    onPressed: () => controller.scrollToSection(
                        "Project", controller.projectKey),
                    isTextButton: true,
                    text: "Project",
                    isSelected: controller.selectedSection.value == "Project",
                  ),
                  CustomButton(
                    onPressed: () => controller.scrollToSection(
                        "Contact me", controller.contactKey),
                    isTextButton: true,
                    text: "Contact me",
                    isSelected:
                        controller.selectedSection.value == "Contact me",
                  ),
                  CustomButton(
                    onPressed: () => Get.to(() => UploadPortfolioPage()),
                    isTextButton: true,
                    text: "Upload",
                    isSelected: controller.selectedSection.value == "Upload",
                  ),
                ],
              ),
              Obx(() {
                return IconButton(
                    onPressed: themeController.toggleTheme,
                    tooltip: "Change Theme",
                    icon: Icon(themeController.isDarkMode.value
                        ? HugeIcons.strokeRoundedSun01
                        : HugeIcons.strokeRoundedMoon02));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
