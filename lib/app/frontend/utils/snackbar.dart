import 'dart:ui';
import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String text, Color responseColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: responseColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 250,
                  child:
                      LightFont(color: Colors.white, fontsize: 12, text: text),
                )
              ],
            ),
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
