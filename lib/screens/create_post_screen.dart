import 'dart:io';

import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/widgets/posts/round_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/createpost';

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late final TextEditingController _postController;
  File? file;

  @override
  void initState() {
    _postController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a post"),
        titleTextStyle:
            const TextStyle(color: AppColors.whiteColor, fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.blueColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              //TODO: změnit barvu, když není nic v příspěvku šedivou a bílí text, když příspěvěk něco obsahuje bgc=blue, text=white
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.greyColor),
                child: const Text('Post'),
              ))
        ],
      ),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          children: [
            Row(
              children: [
                const RoundProfileTile(url: Constants.maleProfilePic),
                Column(
                  children: [
                    const Text("User Name"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(child: Container(child: Row(children: [],),),)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
