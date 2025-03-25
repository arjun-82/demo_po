import 'package:flutter/material.dart';

class ResponsiveSize {
  static double mobileSize = 768;
  static double desktopSize = 1024;
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < ResponsiveSize.mobileSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= ResponsiveSize.mobileSize &&
      MediaQuery.of(context).size.width < ResponsiveSize.desktopSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= ResponsiveSize.desktopSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return desktop;
        } else if (isTablet(context)) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
