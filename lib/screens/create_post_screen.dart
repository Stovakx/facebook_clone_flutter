import 'dart:io';
import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/config/constants/constants.dart';
import 'package:facebook_clone_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone_flutter/widgets/posts/round_profile_tile.dart';
import 'package:facebook_clone_flutter/config/auth/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/createpost';

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late final TextEditingController _postController;
  late Future<UserModel> _currentUser;
  String FileType = "image";
  File? file;

  @override
  void initState() {
    _postController = TextEditingController();
    _currentUser = AuthService().getCurrentUserInfo();
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
      body: Column(
        children: [
          FutureBuilder<UserModel>(
            future: _currentUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final UserModel user = snapshot.data!;
                return Row(
                  children: [
                    RoundProfileTile(url: user.profilePicUrl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.userGroup,
                                      size: 18,
                                      color: AppColors.whiteColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Friends",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.caretDown,
                                      size: 15,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 18,
                                      color: AppColors.whiteColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Album",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.caretDown,
                                      size: 15,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.instagram,
                                      size: 18,
                                      color: AppColors.whiteColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Off",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.caretDown,
                                      size: 15,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const SizedBox(
                height: 20,
              ),
           Padding(
             padding: Constants.defaultPadding,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                TextField(
                  controller: _postController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 12,
                  maxLength: 220,
                  
                )
              ],
                       ),
           )
        ],
      ),
    );
  }
}
