import 'package:bazar/app/global/colors/color.dart';
import 'package:flutter/material.dart';

import '../../../global/font/font.dart';

class Adminordercard extends StatefulWidget {
  final name;
  final price;
  final image;
  VoidCallback view;
  Adminordercard(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.view});

  @override
  State<Adminordercard> createState() => _AdminordercardState();
}

class _AdminordercardState extends State<Adminordercard> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: const Color.fromARGB(255, 235, 235, 235),
      child: Column(
        children: [
          Image.network(
            widget.image,
            height: h * 0.2,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 15,
          ),
          BoldFont(
              color: GlobalColor.darkfontcolor,
              fontsize: 17,
              text: widget.name),
          SizedBox(
            height: 12,
          ),
          LightFont(color: Colors.black, fontsize: 14, text: widget.price),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              widget.view();
            },
            child: Container(
              height: h * 0.03,
              width: w * 0.3,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 33, 33),
                  borderRadius: BorderRadius.circular(3)),
              child: Center(
                child: LightFont(
                    color: Colors.white, fontsize: 10, text: "View more"),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
