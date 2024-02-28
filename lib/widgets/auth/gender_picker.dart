import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/widgets/auth/gender_radio_tile.dart';
import 'package:flutter/widgets.dart';


class GenderPicker extends StatelessWidget {
  final String? gender;
  final Function(String? value) onChanged;
  const GenderPicker({super.key, this.gender, required this.onChanged});

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
