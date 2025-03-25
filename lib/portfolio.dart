import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        title: 'Hey ! Wann touch Me!!',
        theme: ThemeUtils.lightTheme,
        darkTheme: ThemeUtils.darkTheme,
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
        home: const ResponsiveWidget(
          mobile:Mobile(),
          tablet: Mobile(),
          desktop: Desktop(),
        ),
      ),
    );
  }
}
