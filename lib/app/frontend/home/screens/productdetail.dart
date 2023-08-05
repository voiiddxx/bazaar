import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/order/orderscreen.dart';
import 'package:bazar/app/frontend/utils/button.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/cart/cartservice.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/order/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PproductDetailScreen extends StatefulWidget {
  final Getproduct getproduct;
  const PproductDetailScreen({super.key, required this.getproduct});

  @override
  State<PproductDetailScreen> createState() => _PproductDetailScreenState();
}

class _PproductDetailScreenState extends State<PproductDetailScreen> {
  final CartService cartService = CartService();
  final OrderService orderService = OrderService();

  void addtocart(Getproduct product) async {
    await cartService.Addtocart(context: context, product: product);
  }

  void navigate(Getproduct product) async {
    Navigator.pushNamed(context, RoutesNames.orderScreen, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: h * 0.4,
                  width: double.infinity,
                  child: Image.network(
                    widget.getproduct.images![0].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BoldFont(
                  color: GlobalColor.darkfontcolor,
                  fontsize: 25,
                  text: widget.getproduct.productName.toString()),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${widget.getproduct.productDetail}Specially created to procide smooth experince to the user and will help them to enhance thier productivity so why are you waiting oredr new i mac and enjoy the fastest and smooth world",
                style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 14,
                    letterSpacing: 0.1,
                    height: 1.5),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.price_check,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  BoldFont(
                      color: Colors.black,
                      fontsize: 20,
                      text: "${widget.getproduct.productPrice} only"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.production_quantity_limits,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  LightFont(
                      color: Colors.black,
                      fontsize: 13,
                      text:
                          "Hurry up!! only ${widget.getproduct.productQuantity} items left"),
                ],
              ),
              const Expanded(child: SizedBox()),
              Container(
                height: h * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: GlobalColor.textfeildColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                            width: 170,
                            child: ElevatedButtonUtil(
                                text: "Buy Now",
                                onClicked: () {
                                  navigate(widget.getproduct);
                                })),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            addtocart(widget.getproduct);
                          },
                          child: Container(
                            height: 62,
                            width: 170,
                            // ignore: sort_child_properties_last
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                LightFont(
                                    color: Colors.white,
                                    fontsize: 15,
                                    text: "Add to Cart")
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 42, 42, 42),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
