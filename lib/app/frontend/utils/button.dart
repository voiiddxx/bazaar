import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedButtonUtil extends StatelessWidget {
  final String text;
  VoidCallback onClicked;
  ElevatedButtonUtil({super.key, required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
          ),
          onPressed: onClicked,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoldFont(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontsize: 16,
                  text: text),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
