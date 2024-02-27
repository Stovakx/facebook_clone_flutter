import 'package:flutter/widgets.dart';

class AuthText extends StatelessWidget {
  
  final String hintText;
  final String clickableText;
  final VoidCallback? onTap;

  const AuthText(
      {Key? key,
      required this.hintText,
      required this.clickableText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(hintText),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(clickableText),
        )
      ],
    );
  }
}
