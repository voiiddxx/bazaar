import 'package:bazar/app/global/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Usernametextform extends StatelessWidget {
  TextEditingController username = TextEditingController();
  Usernametextform({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        style: GoogleFonts.lato(color: GlobalColor.darkfontcolor, fontSize: 15),
        controller: username,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: GlobalColor.formErrorcolior,
              style: BorderStyle.solid,
            )),
            hintText: "   Your Name",
            prefixIcon: Icon(
              Icons.abc,
              size: 30,
              color: GlobalColor.darkfontcolor,
            ),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            fillColor: GlobalColor.textfeildColor),
      ),
    );
  }
}
