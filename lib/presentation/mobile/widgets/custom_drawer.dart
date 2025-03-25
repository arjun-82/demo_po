import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(ScrollControllerX());
    return Drawer(
      backgroundColor: darkMode ? ColorPlattes.dark : ColorPlattes.light,
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: SizePadding.allPx16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Arjun Portfolio",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: TextSize.px16,
                      fontFamily: FontClass.dancingScript),
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
          Spacing.heightPx32,
          DrawerTile(
            title: "Home",
            onTap: () {
              controller.scrollToSection("Home", controller.homeKey);
              Get.back();
            },
          ),
           DrawerTile(title: "My Skills",
           onTap: () {
              controller.scrollToSection("My Skills", controller.skillKey);
              Get.back();
            },),
          DrawerTile(title: "Experiance", onTap: () {
              controller.scrollToSection("Experiance", controller.experianceKey);
              Get.back();
            },),
          DrawerTile(title: "Project", onTap: () {
              controller.scrollToSection("Project", controller.projectKey);
              Get.back();
            },),
          DrawerTile(title: "Contact Me", onTap: () {
              controller.scrollToSection("Contact Me", controller.contactKey);
              Get.back();
            },),
          DrawerTile(title: "Get Connect", onTap: () {
              controller.scrollToSection("Get Connect", controller.getTouchKey);
              Get.back();
            },),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 15,
      splashColor: Theme.of(context).brightness == Brightness.dark
          ? ColorPlattes.lightSecondary
          : ColorPlattes.lightSecondary,
      onTap: onTap,
      child: Container(
        height: 54,
        padding: SizePadding.horizontalPx64,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
