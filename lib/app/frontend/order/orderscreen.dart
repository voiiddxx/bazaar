import 'package:bazar/app/frontend/admin/widgets/productform.dart';
import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/utils/button.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/order/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  final Getproduct product;
  const OrderScreen({super.key, required this.product});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController addresscontroller = TextEditingController();
  final OrderService orderService = OrderService();

  void OrderNow({required String address, required Getproduct product}) async {
    orderService.postOrder(
        context: context, product: product, address: address);
  }

  Color? cod = Colors.blue[50];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final userpro = Provider.of<userProvider>(context).user;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: h * 05,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  BoldFont(
                      color: GlobalColor.darkfontcolor,
                      fontsize: 15,
                      text: "This Packege will deliver to " + userpro.username),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: h * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 244, 244, 244),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: double.infinity,
                            width: w * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              widget.product.images![0].toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              BoldFont(
                                  color: GlobalColor.darkfontcolor,
                                  fontsize: 22,
                                  text: widget.product.productName.toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              LightFont(
                                  color: GlobalColor.darkfontcolor,
                                  fontsize: 15,
                                  text: widget.product.productCategory
                                      .toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              BoldFont(
                                  color: GlobalColor.darkfontcolor,
                                  fontsize: 20,
                                  text: "\$ " +
                                      widget.product.productPrice.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  LightFont(
                      color: Colors.grey,
                      fontsize: 12,
                      text: "Please Enter Your Address"),
                  const SizedBox(
                    height: 15,
                  ),
                  ProductForm(
                      fieldname: "Addrrss",
                      productcontroller: addresscontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  LightFont(
                      color: Colors.grey,
                      fontsize: 12,
                      text: "Choose Payment Option"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: h * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[50]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldFont(
                            color: Colors.grey,
                            fontsize: 15,
                            text: "Choose Online Payment"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.open_in_new_outlined,
                          color: Colors.blue,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        cod = Colors.orange[50];
                      });
                    },
                    child: Container(
                      height: h * 0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: cod),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoldFont(
                              color: Colors.grey,
                              fontsize: 15,
                              text: "Cash On Delivery"),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.playlist_add_check_rounded,
                            color: Colors.blue,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.25,
                  ),
                  ElevatedButtonUtil(
                      text: "Pay Now ",
                      onClicked: () {
                        OrderNow(
                            address: addresscontroller.text,
                            product: widget.product);
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
