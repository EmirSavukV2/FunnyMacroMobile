import 'package:flutter/material.dart';

import '../Constants/style.dart';

class LoginInputField extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final bool enabled;
  const LoginInputField({
    Key? key,
    required this.inputController,
    required this.hintText,
    this.enabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color primaryColor = kPrimaryColor;
    return TextField(
      enabled: enabled,
      controller: inputController,
      onChanged: (value) {
        //Do something wi
      },
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: kTextColor.withOpacity(0.8), fontWeight: FontWeight.w600),
        fillColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const PasswordInput(
      {required this.textEditingController, required this.hintText, Key? key})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = kPrimaryColor;

    return TextFormField(
      controller: widget.textEditingController,
      obscureText: !pwdVisibility,
      style: const TextStyle(
          fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: kTextColor.withOpacity(0.8), fontWeight: FontWeight.w600),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => pwdVisibility = !pwdVisibility,
          ),
          child: Icon(
            pwdVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: 18,
          ),
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
