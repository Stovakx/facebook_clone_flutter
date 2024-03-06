import 'package:facebook_clone_flutter/config/routes/routes.dart';
import 'package:facebook_clone_flutter/firebase_options.dart';
import 'package:facebook_clone_flutter/screens/email_veritification_screen.dart';
import 'package:facebook_clone_flutter/screens/home_screen.dart';
import 'package:facebook_clone_flutter/screens/loader.dart';
import 'package:facebook_clone_flutter/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // i když jsem vymazal Theme, tak mi na nějakých místech objevuje jako je v základním nastaví při vytvoření app(fialová)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Facebook clone',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasData) {
              final user = snapshot.data;
              if (user!.emailVerified) {
                return const HomeScreen();
              } else {
                return const EmailVeritificationScreen();
              }
            }
            return const LoginScreen();
          }),
          
    );
  }
}
