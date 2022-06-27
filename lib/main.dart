import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Constants/theme_data.dart';
import 'Screen/Auth/Login/LoginScreen.dart';
import 'Screen/Auth/Welcome/welcome_screen.dart';
import 'Screen/Home/HomeScreen/home_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: kThemeData,
      darkTheme: kThemeData,
      home: HomeScreen(),
    );
  }
}
