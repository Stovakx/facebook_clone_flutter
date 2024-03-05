import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class EmailVeritificationScreen extends StatelessWidget {
  const EmailVeritificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
      ),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: "Verify email",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "Refresh",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "Change Email",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
