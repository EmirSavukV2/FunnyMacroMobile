import 'package:flutter/material.dart';
import 'package:funny_macro/Constants/style.dart';
import 'package:lottie/lottie.dart';

import '../../../../Components/input_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height * 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.network(
                  "https://assets4.lottiefiles.com/packages/lf20_jcikwtux.json",
                  height: size.height * 0.4,
                ),
                SizedBox(height: size.height * .1),
                LoginInputField(
                  hintText: "Kullanıcı Adı",
                  inputController: emailController,
                ),
                PasswordInput(
                  hintText: "Şifre",
                  textEditingController: passwordController,
                ),
                SizedBox(height: kDefaultPadding * 2),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/home'),
                        child: const Text("Giriş Yap"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
