import 'package:bazar/app/frontend/auth/widgets/email.dart';
import 'package:bazar/app/frontend/auth/widgets/textform.dart';
import 'package:bazar/app/frontend/auth/widgets/username.dart';
import 'package:bazar/app/frontend/utils/button.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/service/auth/authservice.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final AuthService authService = AuthService();
  bool flag = true;
  Color categorycolor = GlobalColor.textfeildColor;
  Color iconColor = GlobalColor.darkfontcolor;
  Color textColor = Colors.black;
  Color sellercategorycolor = GlobalColor.textfeildColor;
  Color sellericoncolor = GlobalColor.darkfontcolor;
  Color sellertextcolor = Colors.black;
  String userCategory = "user";
  bool loading = false;

  // ignore: non_constant_identifier_names
  void CreateNow() async {
    authService.Register(
        username: usernamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmpassword: confirmpasswordcontroller.text,
        type: userCategory,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.09,
                ),
                BoldFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 25,
                    text: "Hellow,"),
                const SizedBox(
                  height: 10,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 15,
                    text: "Please Create Your Account To Explore"),
                SizedBox(
                  height: h * 0.02,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "    Name: "),
                const SizedBox(
                  height: 10,
                ),
                Usernametextform(username: usernamecontroller),
                const SizedBox(
                  height: 15,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "    Email: "),
                const SizedBox(
                  height: 10,
                ),
                EmailForm(email: emailcontroller),
                const SizedBox(
                  height: 15,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "    Password: "),
                const SizedBox(
                  height: 10,
                ),
                AuthtextForm(controller: passwordcontroller),
                const SizedBox(
                  height: 15,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "    Confirm Password: "),
                const SizedBox(
                  height: 10,
                ),
                AuthtextForm(controller: confirmpasswordcontroller),
                const SizedBox(
                  height: 25,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "    Category: "),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          categorycolor = Colors.green;
                          iconColor = Colors.white;
                          textColor = Colors.white;
                          sellercategorycolor = GlobalColor.textfeildColor;
                          sellericoncolor = GlobalColor.primary;
                          sellertextcolor = Colors.black;
                          userCategory = "admin";
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                            color: categorycolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.admin_panel_settings_outlined,
                              color: iconColor,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BoldFont(
                                color: textColor, fontsize: 10, text: "Admin")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sellercategorycolor = Colors.green;
                          sellericoncolor = Colors.white;
                          sellertextcolor = Colors.white;
                          categorycolor = GlobalColor.textfeildColor;
                          iconColor = GlobalColor.primary;
                          textColor = Colors.black;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                            color: sellercategorycolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: sellericoncolor,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BoldFont(
                                color: sellertextcolor,
                                fontsize: 10,
                                text: "User")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.17,
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
                              Duration(seconds: 3),
                              () {
                                setState(() {
                                  loading = false;
                                });
                              },
                            );
                            CreateNow();
                          }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
