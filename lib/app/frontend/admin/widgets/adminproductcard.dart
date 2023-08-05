import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

class AdminProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String detail;
  VoidCallback onClick;
  VoidCallback onDelete;
  AdminProductCard(
      {super.key,
      required this.detail,
      required this.image,
      required this.name,
      required this.price,
      required this.onClick,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.network(
              image,
              height: 250,
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
                    style: TextStyle(fontSize: 12),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onDelete,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ),
                      LightFont(
                          color: const Color.fromARGB(255, 63, 63, 63),
                          fontsize: 13,
                          text: " Delete")
                    ],
                  ),
                ),
                BoldFont(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontsize: 17,
                    text: "\$" + price),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 0.5,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
