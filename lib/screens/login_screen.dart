import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/config/provider/auth_provider.dart';
import 'package:facebook_clone_flutter/screens/register_screen.dart';
import 'package:facebook_clone_flutter/widgets/auth/auth_text.dart';
import 'package:facebook_clone_flutter/widgets/round_text_field.dart';
import 'package:facebook_clone_flutter/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  bool isLoading = false;

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

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => isLoading =true);
      await ref
          .read(authProvider)
          .signIn(email: _emailController.text, password: _pwController.text);
      setState(() => isLoading = false);
    }
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
            const SizedBox(height: 10,),
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
                    const SizedBox(height: 10),
                    RoundedButton(
                      text: "Login",
                      onPressed: login,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthText(
                          hintText: "Don't have acount?",
                          clickableText: "Register here",
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
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
