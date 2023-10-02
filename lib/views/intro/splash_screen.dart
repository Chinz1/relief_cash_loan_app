import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:small_loans_app/services/auth_state.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen && context.mounted) {
      Navigator.pushReplacementNamed(context, AuthState.id);
    } else {
      Timer(const Duration(milliseconds: 1), () {
        prefs.setBool('seen', true);
        Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
