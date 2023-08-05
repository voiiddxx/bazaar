import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderCard extends StatefulWidget {
  final image;
  final name;
  final detail;
  final category;
  final price;
  VoidCallback view;
  OrderCard(
      {super.key,
      required this.category,
      required this.detail,
      required this.image,
      required this.name,
      required this.price,
      required this.view});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: h * 0.18,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                  widget.image,
                  height: double.infinity,
                  width: w * 0.4,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: w * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldFont(
                        color: const Color.fromARGB(255, 88, 88, 88),
                        fontsize: 20,
                        text: widget.name),
                    const SizedBox(
                      height: 5,
                    ),
                    LightFont(
                        color: Colors.grey, fontsize: 13, text: widget.detail),
                    const SizedBox(
                      height: 12,
                    ),
                    LightFont(
                        color: Colors.grey,
                        fontsize: 15,
                        text: widget.category),
                    const SizedBox(
                      height: 10,
                    ),
                    BoldFont(
                        color: const Color.fromARGB(255, 88, 88, 88),
                        fontsize: 15,
                        text: widget.price),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        widget.view();
                      },
                      child: Row(
                        children: [
                          BoldFont(
                              color: Colors.redAccent,
                              fontsize: 14,
                              text: "View More")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 0.5,
        )
      ],
    );
  }
}
