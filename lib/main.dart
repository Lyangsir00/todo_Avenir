import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_2/firebase/services/firebase_notification.dart';
import 'package:todo_app_2/screens/Auth/screens/login_page.dart';
import 'package:todo_app_2/screens/Auth/screens/signup_page.dart';
import 'package:todo_app_2/screens/homepage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseNotification().initNotification();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Foreground message received: ${message.notification?.title}');
    // Handle the foreground message here
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Using StreamBuilder directly in home to check the auth state
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while Firebase initializes
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            // User is signed in, navigate to HomePage
            return const HomePage();
          } else {
            // User is signed out, navigate to LoginPage
            return const LoginPage();
          }
        },
      ),
      routes: {
        "/signUp": (context) => const SignupPage(),
        "/login": (context) => const LoginPage(),
        "/homePage": (context) => const HomePage(),
      },
    );
  }
}
