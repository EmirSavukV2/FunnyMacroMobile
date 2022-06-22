library home_screen;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../model/login_model.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:lottie/lottie.dart';
import 'package:funny_macro/Constants/style.dart';
part './components/body.dart';

class HomeScreen extends StatelessWidget {
  final LoginModel loginData;
  const HomeScreen({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userData: loginData),
    );
  }
}
