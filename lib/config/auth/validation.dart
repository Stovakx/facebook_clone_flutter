import 'package:flutter/material.dart';

import 'package:flutter_holo_date_picker/date_picker.dart';

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
  final isEmailValid = emailRegex.hasMatch(email ?? '');
  if (!isEmailValid) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please type a password';
  }
  if (password.length < 6) {
    return 'Your password should be at least 6 characters long';
  }
  if (!containsSpecialCharacter(password)) {
    return 'Your password should contain at least one special character';
  }
  if (!containsNumber(password)) {
    return 'Your password should contain at least one number';
  }
  return null;
}

String? validateConfirmedPassword(String? password, String? confirmedPassword) {
  if (password != confirmedPassword) {
    return 'Passwords do not match';
  }
  return null;
}

bool containsSpecialCharacter(String password) {
  String specialChars = r'!@#$%^&*()_-+={}[]|;:,.<>?';
  for (int i = 0; i < password.length; i++) {
    if (specialChars.contains(password[i])) {
      return true;
    }
  }
  return false;
}

bool containsNumber(String password) {
  RegExp digitRegExp = RegExp(r'\d');
  return digitRegExp.hasMatch(password);
}

String? validateName(String? name) {
  final nameRegex = RegExp(r'^[a-zA-Z\s]{1,50}$');
  if (name == null) {
    return 'Name cannot be null';
  } else if (name.isEmpty) {
    return 'Name should be at least 3 characters';
  } else if (!nameRegex.hasMatch(name)) {
    return 'Please enter a valid name';
  } else {
    return null;
  }
}

final today = DateTime.now();
// 18 years ago
final initialDate = DateTime.now().subtract(const Duration(days: 365 * 18));
// User can be born anytime after 1900 AD
final firstDate = DateTime(1900);
// User should at least be 7 years old
final lastDate = DateTime.now().subtract(const Duration(days: 365 * 7));

Future<DateTime?> pickSimpleDate({
  required BuildContext context,
  required DateTime? date,
}) async {
  final dateTime = await DatePicker.showSimpleDatePicker(
    context,
    initialDate: date ?? initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    dateFormat: "dd-MMMM-yyyy",
  );

  return dateTime;
}