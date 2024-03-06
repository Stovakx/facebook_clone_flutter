import 'package:facebook_clone_flutter/config/constants/app_colors.dart';
import 'package:facebook_clone_flutter/widgets/round_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: _buildFacebookText(),
        actions: [
          _buildSearchWidget(),
         _buildMessengerWidget()],
      ),
    );
  }

  Widget _buildFacebookText() => const Text(
        "Facebook",
        style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      );

  Widget _buildSearchWidget() => const RoundIconBtn(
      icon: FontAwesomeIcons.magnifyingGlass,
      color: AppColors.blackColor,
      size: 16,
      backgroundColor: AppColors.greyColor);

  Widget _buildMessengerWidget() => const RoundIconBtn(
      icon: FontAwesomeIcons.facebookMessenger,
      color: AppColors.blackColor,
      size: 16,
      backgroundColor: AppColors.greyColor);
}
