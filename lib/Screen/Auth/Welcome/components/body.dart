import 'package:flutter/material.dart';
import 'package:funny_macro/Constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Constants/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height * 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/funny_logo.png",
              height: size.height * 0.4,
            ),
            SizedBox(height: kDefaultPadding * 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text("Giriş Yap")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _launchUrl,
                      child: const Text("Web Sayfasına Git"),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
