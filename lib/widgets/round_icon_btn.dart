import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final double size;

  const RoundIconBtn({
    super.key,
    required this.icon,
    required this.color,
    required this.size,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: size ,
        backgroundColor: backgroundColor,
        child: FaIcon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}