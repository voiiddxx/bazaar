import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldFont extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  BoldFont({required this.color, required this.fontsize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.lato(
          color: color, fontSize: fontsize, fontWeight: FontWeight.bold),
    );
  }
}

class LightFont extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  LightFont({required this.color, required this.fontsize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
