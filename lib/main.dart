import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:funny_macro/resuable/global_function.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants/theme_data.dart';
import 'Screen/Auth/Login/LoginScreen.dart';
import 'Screen/Auth/Welcome/welcome_screen.dart';
import 'Screen/Home/HomeScreen/home_screen.dart';
import 'bloc/authentication/login/login_bloc.dart';

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
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    return MultiProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: kThemeData,
        darkTheme: kThemeData,
        home: SplashScreen(),
      ),
    );
  }
}

String? finalEmail;
String? finalPass;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => finalEmail == null
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ));
    });
    super.initState();
  }

  getValidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? pass = prefs.getString('pass');
    setState(() {
      finalEmail = email;
      finalPass = pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
