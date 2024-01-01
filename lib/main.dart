import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_app/Dark_ui/grid_ui.dart';

import 'Log_sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('images/splash.png'),
      backgroundColor: Colors.teal.shade800,
      splashIconSize: 250,
      nextScreen: const Front_Page(),
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       SizedBox(
//         height: 300,
//         child: AnimatedSplashScreen(
//         splash: Image.asset('assets/one.png'),
//         backgroundColor: Colors.teal.shade800,
//         splashIconSize: 250 ,
//         nextScreen: const Log_sign_up(),
//         duration: 3000,
//         splashTransition: SplashTransition.sizeTransition,
//         pageTransitionType: PageTransitionType.topToBottom,
//             ),
//       );
//   }
// }

// Future<void> initializeFirebase() async {
//   try {
//     // Check if Firebase is already initialized
//     if (Firebase.apps.isEmpty) {
//       await Firebase.initializeApp();
//       print('Firebase initialized successfully!');
//     }
//   } catch (e) {
//     print('Error initializing Firebase: $e');
//     // Handle the initialization error as needed
//
// }}
class Front_Page extends StatelessWidget {
  const Front_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            if (snapshot.data == 'admin') {
              // Navigate to admin page
              Log_sign_up();
            } else {
              // Navigate to regular user page
              return Grid();
            }
          }

          // If no data or an error occurs, you can show a login or landing page.
          return Log_sign_up();
        },
      ),
    );
  }
}