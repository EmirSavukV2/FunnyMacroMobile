import 'package:funny_macro/Constants/style.dart';
import 'package:funny_macro/Screen/Home/HomeScreen/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Components/input_field.dart';
import '../../../../bloc/authentication/login/login_bloc.dart';
import '../../../../resuable/global_function.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _globalFunction = GlobalFunction();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginBloc _loginBloc;
  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13);
        }
        if (state is LoginWaiting) {
          FocusScope.of(context).unfocus();
          _globalFunction.showProgressDialog(context);
        }
        if (state is LoginSuccess) {
          print('data login');
          print('Username : ' + state.loginData[0].username);
          print('email : ' + state.loginData[0].email);
          print('lastLogin : ' + state.loginData[0].lastLogin.toString());
          print('active : ' + state.loginData[0].active.toString());
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: SafeArea(
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
                          onPressed: () => _loginBloc.add(Login(
                            email: emailController.text,
                            password: passwordController.text,
                          )),
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
      ),
    );
  }
}
