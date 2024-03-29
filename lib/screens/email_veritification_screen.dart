import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/config/provider/auth_provider.dart';
import 'package:facebook_clone_flutter/screens/home_screen.dart';
import 'package:facebook_clone_flutter/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailVeritificationScreen extends ConsumerWidget {
  const EmailVeritificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        actions: [IconButton(onPressed:() {ref.read(authProvider).singOut();}, icon: const Icon(Icons.logout))],
      ),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: "Verify email",
              onPressed: () async {
                await ref.read(authProvider).verifyEmail().then((value) {
                  if (value == null) {
                    Fluttertoast.showToast(
                        msg: 'Email verification sent to your email');
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "Refresh",
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!.reload();
                final emailVerified =
                    FirebaseAuth.instance.currentUser?.emailVerified;
                if (emailVerified == true) {
                  if (!context.mounted) return;
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "Change Email",
              onPressed: () {
                ref.read(authProvider).singOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
