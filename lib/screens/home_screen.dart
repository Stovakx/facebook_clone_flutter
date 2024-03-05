import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  static const routeName = "/HomeScreen";

  @override
  Widget build(BuildContext context){
    return Container(
      child: const Text("HomeScreen"),
    );
  }
}