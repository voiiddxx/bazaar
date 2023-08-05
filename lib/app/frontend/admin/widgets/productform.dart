import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors/color.dart';

class ProductForm extends StatelessWidget {
  TextEditingController productcontroller = TextEditingController();
  final String fieldname;
  ProductForm(
      {super.key, required this.fieldname, required this.productcontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        style: GoogleFonts.lato(color: GlobalColor.darkfontcolor, fontSize: 15),
        controller: productcontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: GlobalColor.formErrorcolior,
              style: BorderStyle.solid,
            )),
            hintText: "$fieldname",
            prefixIcon: Icon(
              Icons.auto_awesome_rounded,
              size: 20,
              color: const Color.fromARGB(255, 43, 43, 43),
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
