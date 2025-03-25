import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerX extends GetxController {
  final ScrollController scrollController = ScrollController();
  var selectedSection = "Home".obs;
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey skillKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey getTouchKey = GlobalKey();
  final GlobalKey experianceKey = GlobalKey();
  void scrollToSection(String section, GlobalKey key) {
    if (key.currentContext != null) {
      selectedSection.value = section;
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToOffset(double offset) {
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
