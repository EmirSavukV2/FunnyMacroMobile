import 'package:flutter/material.dart';

import '../../../model/login_model.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final LoginModel loginData;
  const HomeScreen({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
