import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/auth/validation.dart';
import 'package:flutter_application_1/config/constants/app_colors.dart';
import 'package:flutter_application_1/config/constants/constants.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widgets/auth/birthday_picker.dart';
import 'package:flutter_application_1/widgets/auth/gender_picker.dart';
import 'package:flutter_application_1/widgets/pick_image.dart';
import 'package:flutter_application_1/widgets/round_text_field.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';

final _formKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;
  late final TextEditingController _pwConfirmedController;

  File? image;
  DateTime? birthday;
  String gender = "Male";

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _pwConfirmedController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: Constants.defaultPadding,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        image = await pickImage();
                        setState(() {});
                      },
                      child: PickImage(
                        image: image,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: RoundTextField(
                          controller: _firstNameController,
                          hintText: "First Name",
                          textInputAction: TextInputAction.next,
                          validator: validateName,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: RoundTextField(
                          controller: _lastNameController,
                          hintText: "Last Name",
                          textInputAction: TextInputAction.next,
                          validator: validateName,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BirthdayPicker(
                        dateTime: birthday ?? DateTime.now(),
                        onPressed: () async {
                          birthday = await pickSimpleDate(
                              context: context, date: birthday);
                          setState(() {});
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GenderPicker(
                        gender: gender,
                        onChanged: (value) {
                          gender = value ?? "Male";
                          setState(() {});
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundTextField(
                      controller: _emailController,
                      hintText: "Email",
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 10),
                    RoundTextField(
                      controller: _pwController,
                      hintText: "Password",
                      textInputAction: TextInputAction.next,
                      isPW: true,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 10),
                    RoundTextField(
                      controller: _pwConfirmedController,
                      hintText: "Confirm Password",
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return validateConfirmedPassword(
                            value, _pwController.text);
                      },
                      isPW: true,
                    ),
                    const SizedBox(height: 20),
                    RoundedButton(text: "Next", onPressed: (){},)
                  ],
                ))),
      ),
    );
  }
}
