import 'package:flutter/material.dart';

class GenderRadioTile extends StatelessWidget {
  const GenderRadioTile(
      {super.key,
      required this.genderText,
      required this.value,
      this.selectedValue,
      this.onChanged});

  final String genderText;
  final String value;
  final String? selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(genderText),
        Radio.adaptive(
            value: value, groupValue: selectedValue, onChanged: onChanged)
      ],
    );
  }
}
