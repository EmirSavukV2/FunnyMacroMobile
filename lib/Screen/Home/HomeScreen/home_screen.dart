library home_screen;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funny_macro/Screen/Auth/Welcome/welcome_screen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/login_model.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:lottie/lottie.dart';
import 'package:funny_macro/Constants/style.dart';

import '../../../model/status_model.dart';
part './components/body.dart';

class HomeScreen extends StatelessWidget {
  final LoginModel userData;

  const HomeScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userData: userData),
    );
  }
}
