import 'package:d5n/constant/theam.dart';
import 'package:d5n/view/Register/register.dart';
import 'package:d5n/view/forget%20password/forget_pass.dart';
import 'package:d5n/view/home/home.dart';
import 'package:d5n/view/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLoggedIn = await checkLoginStatus();
    Intl.defaultLocale = 'en_US';
    
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false; // Default to false
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: lightTheme,  // Light theme
      darkTheme: darkTheme,  // Dark theme
      themeMode: ThemeMode.system,
      home: isLoggedIn ? HomePage() : LoginPage(), // Redirect based on login status
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/forgot', page: () => ForgotPassword()),
      ],
    );
  }
}
