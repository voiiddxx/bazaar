import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({
    super.key,
  });

  // ignore: non_constant_identifier_names
  void Nacigatetosearch(BuildContext context, String search) {
    Navigator.pushNamed(context, RoutesNames.searchScreen, arguments: search);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        onFieldSubmitted: (value) {
          Nacigatetosearch(context, value);
        },
        style: GoogleFonts.lato(color: GlobalColor.darkfontcolor, fontSize: 15),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: GlobalColor.formErrorcolior,
              style: BorderStyle.solid,
            )),
            hintText: "Search Your Item!",
            prefixIcon: const Icon(
              Icons.search_sharp,
              size: 24,
              color: Colors.black,
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
