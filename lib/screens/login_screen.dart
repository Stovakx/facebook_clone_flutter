import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/screens/register_screen.dart';
import 'package:facebook_clone_flutter/widgets/auth/auth_text.dart';
import 'package:facebook_clone_flutter/widgets/round_text_field.dart';
import 'package:facebook_clone_flutter/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
      ),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/icons/fb_logo.png",
              width: 60,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundTextField(
                      controller: _emailController,
                      hintText: "Email",
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundTextField(
                      controller: _pwController,
                      hintText: "Password",
                      textInputAction: TextInputAction.next,
                      isPW: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthText(
                          hintText: "Forgot password?",
                          clickableText: "Click here",
                          onTap: () {},
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    RoundedButton(
                      text: "Login",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthText(
                          hintText: "Don't have acount?",
                          clickableText: "Register here",
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            Column(
              children: [
                Image.asset(
                  'assets/icons/meta.png',
                  height: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
