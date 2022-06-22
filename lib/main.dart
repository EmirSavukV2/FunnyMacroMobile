import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

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
        home: WelcomeScreen(),
      ),
    );
  }
}
