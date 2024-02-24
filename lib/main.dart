import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCaiXd5E8dSbsKQvCQr8x-UgVszCj0i7kg",
      authDomain: "my-firebase-project-62f59.firebaseapp.com",
      projectId: "my-firebase-project-62f59",
      storageBucket: "my-firebase-project-62f59.appspot.com",
      messagingSenderId: "190804869700",
      appId: "1:190804869700:android:fadbbf70b8da650eedb211",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PeriodFirebase Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Uncomment the routes and remove the home property
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
