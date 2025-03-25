import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class UrlController extends GetxController {
  var latestLink = "".obs;

  // Method to open a URL
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      latestLink.value = url;
    } else {
      Get.snackbar("Error", "Could not launch $url");
    }
  }

  Future<void> makeCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Could not make a call to $phoneNumber");
    }
  }

  //openmap
  Future<void> openMap(
      {String? address, double? latitude, double? longitude}) async {
    Uri uri;

    if (latitude != null && longitude != null) {
      // Open Google Maps with coordinates
      uri = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    } else if (address != null) {
      // Open Google Maps with an address
      uri = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}");
    } else {
      Get.snackbar("Error", "Invalid location data");
      return;
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open maps");
    }
  }

  Future<void> downloadCv(String url) async {
    final Uri uri = Uri.parse(url);
    Get.defaultDialog(
      title: "Download CV",
      middleText: "Do you want to download the CV?",
      textConfirm: "Yes",
      textCancel: "No",
      buttonColor: ColorPlattes.buttonColorLight,
      radius: 10,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      onConfirm: () async {
        Get.back();
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.platformDefault);
          Get.snackbar(
            duration: const Duration(seconds: 5),
            animationDuration: const Duration(milliseconds: 800),
            snackPosition: SnackPosition.BOTTOM,
            "Downloading...",
            "Resume downloading...",
          );
        } else {
          Get.snackbar("Error", "Could not download CV from $url");
        }
      },
      onCancel: () {
        Get.back();
        Get.snackbar("Cancelled", "CV download cancelled");
      },
    );
  }
}
