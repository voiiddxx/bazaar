import 'package:bazar/app/global/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailForm extends StatelessWidget {
  TextEditingController email = TextEditingController();
  EmailForm({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        style: GoogleFonts.lato(color: GlobalColor.darkfontcolor, fontSize: 15),
        controller: email,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: GlobalColor.formErrorcolior,
              style: BorderStyle.solid,
            )),
            hintText: "   john@gmail.com",
            prefixIcon: Icon(
              Icons.email_outlined,
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
