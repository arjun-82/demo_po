
import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';


class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() {
    // Default theme is light mode
    isDarkMode.value = false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
