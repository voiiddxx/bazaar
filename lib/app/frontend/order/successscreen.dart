import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/order.jpg",
              height: 360,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesNames.BottomUser);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "Go Back To Home Screen"),
                BoldFont(color: Colors.blue, fontsize: 12, text: "   Home"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
