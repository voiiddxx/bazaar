import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String detail;
  VoidCallback onClick;
  ProductCard(
      {super.key,
      required this.detail,
      required this.image,
      required this.name,
      required this.price,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Column(
          children: [
            Image.network(
              image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldFont(color: Colors.black, fontsize: 14, text: name),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: GlobalColor.darkfontcolor,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    detail,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoldFont(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontsize: 17,
                    text: price),
              ],
            )
          ],
        ),
      ),
    );
  }
}
