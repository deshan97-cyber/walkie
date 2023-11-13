import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social/Responsive/mobile_screen.dart';
import 'package:social/Responsive/responsive_layout_screen.dart';
import 'package:social/Responsive/web_screen.dart';
import 'package:social/Screens/Authentication/login_screen.dart';
import 'package:social/Screens/Authentication/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //check wheather web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCYkWajlDHUgFxDpnYhAMMTOkOlUfEFgC0",
            authDomain: "social-app-f5c94.firebaseapp.com",
            projectId: "social-app-f5c94",
            storageBucket: "social-app-f5c94.appspot.com",
            messagingSenderId: "747780112550",
            appId: "1:747780112550:web:043c41105676c03140b467",
            measurementId: "G-W8S883NCK8"));
  } else {
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: "Walkie",
      home: RegisterScreen(),
    );
  }
}
