import 'package:flutter/material.dart';
import 'package:news_app/features/splash/splash_screen.dart';

import 'core/data_source/local_data/preferences_manager.dart';
import 'core/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SplashScreen(),
    );
  }
}
