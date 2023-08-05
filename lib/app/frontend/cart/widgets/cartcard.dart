import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String detail;
  final VoidCallback onBuy;
  final VoidCallback onDeleteCart;
  CartProductCard(
      {super.key,
      required this.detail,
      required this.image,
      required this.name,
      required this.onBuy,
      required this.onDeleteCart,
      required this.price});

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: 280,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 243, 241, 241)),
              height: h * 0.17,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: h * 0.15,
                      width: w * 0.35,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 252, 252),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: double.infinity,
                    width: w * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldFont(
                            color: GlobalColor.darkfontcolor,
                            fontsize: 20,
                            text: widget.name),
                        const SizedBox(
                          height: 4,
                        ),
                        LightFont(
                            color: Colors.grey,
                            fontsize: 10,
                            text: widget.detail),
                        LightFont(
                            color: Colors.grey,
                            fontsize: 10,
                            text: "Get Your Item Now"),
                        const SizedBox(
                          height: 15,
                        ),
                        BoldFont(
                            color: Colors.black,
                            fontsize: 15,
                            text: "\$" + widget.price)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 0.065,
                width: w * 0.4,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 251, 251),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldFont(
                        color: Colors.black, fontsize: 15, text: "Get Now"),
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  widget.onDeleteCart();
                },
                child: Container(
                  height: h * 0.065,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 53, 53, 53),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoldFont(
                          color: Colors.white, fontsize: 15, text: "Remove "),
                      const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
