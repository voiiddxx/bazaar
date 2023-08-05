import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/order/userorder.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: ReuablseAppbar().homeappbar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.1,
            ),
            ClipRRect(
              child: Image.asset(
                "assets/images/profilee.jpg",
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(
              height: 15,
            ),
            BoldFont(
                color: GlobalColor.darkfontcolor,
                fontsize: 20,
                text: userpro.username),
            const SizedBox(
              height: 10,
            ),
            LightFont(color: Colors.black, fontsize: 15, text: userpro.email),
            const Expanded(child: SizedBox()),
            Container(
              height: h * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        if (userpro.type == "user") {
                          Navigator.pushNamed(
                              context, RoutesNames.userOrderscreen);
                        } else {
                          Navigator.pushNamed(
                              context, RoutesNames.adminOrderscreen);
                        }
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BoldFont(
                                color: GlobalColor.darkfontcolor,
                                fontsize: 15,
                                text: "Your Orders"),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        if (userpro.type == 'admin') {
                          ShowSnackBar(
                              context,
                              "This Feature is only available for users",
                              Colors.red);
                        } else {
                          Navigator.pushNamed(context, RoutesNames.cartScreen);
                        }
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BoldFont(
                                color: GlobalColor.darkfontcolor,
                                fontsize: 15,
                                text: "Your Cart"),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        if (userpro.type == "user") {
                          Navigator.pushNamed(context, RoutesNames.BottomUser);
                        } else {
                          Navigator.pushNamed(context, RoutesNames.adminBottom);
                        }
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.amp_stories_rounded,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BoldFont(
                                color: GlobalColor.darkfontcolor,
                                fontsize: 15,
                                text: "Checkout Products"),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: InkWell(
                      onTap: () async {
                        final SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setString("x-auth-token", " ");
                        Navigator.pushReplacementNamed(
                            context, RoutesNames.SigninScreen);
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BoldFont(
                                color: GlobalColor.darkfontcolor,
                                fontsize: 15,
                                text: "Log Out"),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  BoldFont(
                      color: Colors.black,
                      fontsize: 10,
                      text: "Made By Void 🚀"),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
