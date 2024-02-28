import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final double height;

  const RoundedButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.color = AppColors.lightBlueColor,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.darkBlueColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: (color == AppColors.lightBlueColor && onPressed != null)
                    ? AppColors.realWhiteColor
                    : AppColors.darkBlueColor,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
