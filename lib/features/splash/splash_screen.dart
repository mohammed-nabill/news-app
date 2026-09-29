import 'package:flutter/material.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';

import '../../core/data_source/local_data/preferences_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(Duration(seconds: 2));
    bool onboardingComplete =
        PreferencesManager().getBool("onboarding_complete") ?? false;
    bool isLoggedIn = PreferencesManager().getBool("is_logged_in") ?? false;

    if (!mounted) return;
    if (!onboardingComplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        width: double.infinity,
        fit: BoxFit.fill,
        'assets/images/splash.png',
      ),
    );
  }
}
