import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailController extends GetxController {
  final Dio _dio = Dio();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isSending = false.obs;

  // ignore: non_constant_identifier_names
  final String service_id = "service_61i3stq";
  final String template_id = "template_wa6lo58";
  final String user_id = "z9YOuhwif75wfr9ia";
  final String emailJsUrl = "https://api.emailjs.com/api/v1.0/email/send";

  Future<void> sendEmail() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isSending.value = true;

    final emailData = {
      "service_id": service_id,
      "template_id": template_id,
      "user_id": user_id,
      "template_params": {
        "from_name": emailController.text,
        "subject": subjectController.text.isEmpty
            ? "No Subject"
            : subjectController.text,
        "message": messageController.text
      }
    };

    try {
      if (kDebugMode) {
        print("Sending email data: $emailData");
      }

      final response = await _dio.post(
        emailJsUrl,
        data: emailData,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Notify", "Email Sent Successfully!",
            snackPosition: SnackPosition.TOP);
        emailController.clear();
        subjectController.clear();
        messageController.clear();
      } else {
        throw Exception(
            "Failed to send email. Status: ${response.statusCode}, Data: ${response.data}");
      }
    } catch (e) {
      isSending.value = false;
      String errorMessage =
          "Failed to send email.  Please check your network or configuration.";

      if (e is DioException) {
        if (kDebugMode) {
          print(
              "DioError: ${e.message}, Response: ${e.response?.data}, Status Code: ${e.response?.statusCode}");
        }

        errorMessage =
            "DioError: ${e.message}.  Check console for details."; 
      } else {
        if (kDebugMode) {
          print("General error: $e");
        }
        errorMessage = "Error: ${e.toString()}";
      }

      Get.snackbar(
        "Error",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } finally {
      isSending.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
