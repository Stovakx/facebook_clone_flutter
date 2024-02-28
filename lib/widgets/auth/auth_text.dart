import 'package:flutter/widgets.dart';

class AuthText extends StatelessWidget {
  
  final String hintText;
  final String clickableText;
  final VoidCallback? onTap;

  const AuthText(
      {super.key,
      required this.hintText,
      required this.clickableText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(hintText, style: const TextStyle(fontSize: 18),),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(clickableText, style: const TextStyle(decoration: TextDecoration.underline,fontSize: 18, fontWeight: FontWeight.w600),),
        )
      ],
    );
  }
}
