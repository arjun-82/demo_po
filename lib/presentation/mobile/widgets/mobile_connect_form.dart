import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MobileContactForm extends StatelessWidget {
  const MobileContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController emailController = Get.put(EmailController());
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: SizePadding.allPx32,
      child: Form(
        key: emailController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController.emailController,
              label: "Email",
              hint: "example@gmail.com",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email can't be empty";
                }
                return null;
              },
            ),
            CustomTextField(
              controller: emailController.subjectController,
              label: "Subject (optional)",
              hint: "Subject",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: emailController.messageController,
              label: "Message",
              hint: "Enter your message",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Message can't be empty";
                }
                return null;
              },
              maxLines: 3,
            ),
            Spacing.heightPx16,
            SizedBox(
              height: 40,
              width: 100,
              child: OutlinedButton(
                onPressed: emailController.sendEmail,
                child: Text(
                  "Send",
                  style: TextStyle(
                      fontSize: TextSize.px14,
                      fontFamily: FontClass.raleway,
                      fontWeight: FontWeight.w500,
                      color: darkMode
                          ? ColorPlattes.textDarkPrimary
                          : ColorPlattes.textLightPrimary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
