import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/config/constants/app_colors.dart';
import 'package:flutter_application_1/config/constants/constants.dart';
import 'package:flutter_application_1/widgets/auth/gender_radio_tile.dart';

class GenderPicker extends StatelessWidget {
  final String? gender;
  final Function(String? value) onChanged;
  const GenderPicker({Key? key, this.gender, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GenderRadioTile(
            genderText: "Male",
            value: "Male",
            selectedValue: gender,
            onChanged: onChanged,
          ),
          GenderRadioTile(
            genderText: "Female",
            value: "Female",
            selectedValue: gender,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
