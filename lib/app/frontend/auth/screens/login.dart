import 'package:bazar/app/frontend/auth/widgets/email.dart';
import 'package:bazar/app/frontend/auth/widgets/textform.dart';
import 'package:bazar/app/frontend/utils/button.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/auth/authservice.dart';
import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthService authService = AuthService();
  bool loading = false;

  void signinnow() async {
    authService.LoginAPiservice(
        email: email.text, password: password.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BoldFont(
                color: GlobalColor.darkfontcolor,
                fontsize: 25,
                text: "Welcome Back,"),
            const SizedBox(
              height: 10,
            ),
            LightFont(
                color: GlobalColor.darkfontcolor,
                fontsize: 15,
                text: "Please Create Your Account To Explore"),
            SizedBox(
              height: h * 0.05,
            ),
            EmailForm(email: email),
            const SizedBox(
              height: 20,
            ),
            AuthtextForm(controller: password),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : ElevatedButtonUtil(
                      text: "Get Started",
                      onClicked: () {
                        setState(() {
                          loading = true;
                        });
                        Future.delayed(
                          Duration(seconds: 2),
                          () {
                            setState(() {
                              loading = false;
                            });
                          },
                        );
                        signinnow();
                      }),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LightFont(
                    color: Colors.grey,
                    fontsize: 15,
                    text: "Don't Have Account?"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.loginScreen);
                  },
                  child: BoldFont(
                    color: Colors.blueAccent,
                    fontsize: 15,
                    text: "Create Account",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
