import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickImage extends StatelessWidget {
  const PickImage({Key? key, this.image}) : super(key: key);
  final File? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: Stack(
        children: [
          image != null
              ? CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(image!),
                )
              : const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(Constants.maleProfilePic),
                ),
          const Positioned(
              bottom: 0,
              right: 0,
              child: FaIcon(
                FontAwesomeIcons.camera,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
