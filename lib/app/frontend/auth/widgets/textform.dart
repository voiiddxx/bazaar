import 'package:bazar/app/global/colors/color.dart';
import 'package:flutter/material.dart';

class AuthtextForm extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  AuthtextForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: GlobalColor.formErrorcolior,
              style: BorderStyle.solid,
            )),
            hintText: "   ************",
            prefixIcon: Icon(
              Icons.password,
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
