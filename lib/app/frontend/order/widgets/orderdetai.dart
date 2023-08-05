import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/service/models/orderproduct.dart';
import 'package:bazar/app/service/order/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderdetailScreen extends StatefulWidget {
  final Orderproduct product;
  const OrderdetailScreen({super.key, required this.product});

  @override
  State<OrderdetailScreen> createState() => _OrderdetailScreenState();
}

class _OrderdetailScreenState extends State<OrderdetailScreen> {
  final OrderService orderService = OrderService();

  void changeStatus(int status) async {
    await orderService.UpdateStatus(
        context: context,
        value: status + 1,
        product: widget.product,
        done: () {
          setState(() {
            currentStep += 1;
          });
        });
  }

  int currentStep = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentStep = widget.product.value!;
      print(currentStep);
    });
  }

  void cancelOrder(Orderproduct product) async {
    orderService.deleteOrder(context: context, product: product);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: ReuablseAppbar().homeappbar(),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  LightFont(
                      color: GlobalColor.darkfontcolor,
                      fontsize: 15,
                      text: "Order Id:  "),
                  LightFont(
                      color: GlobalColor.darkfontcolor,
                      fontsize: 13,
                      text: widget.product.id.toString())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  LightFont(
                      color: GlobalColor.darkfontcolor,
                      fontsize: 15,
                      text: "Address:  "),
                  LightFont(
                      color: GlobalColor.darkfontcolor,
                      fontsize: 13,
                      text: widget.product.address.toString())
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 0.4,
            ),
            Container(
              height: h * 0.25,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    child: Image.network(
                      widget.product.products!.images![0].toString(),
                      width: w * 0.45,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: w * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldFont(
                            color: GlobalColor.darkfontcolor,
                            fontsize: 19,
                            text: widget.product.products!.productName
                                .toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        LightFont(
                            color: Colors.grey,
                            fontsize: 12,
                            text: widget.product.products!.productDetail
                                .toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        LightFont(
                            color: Colors.grey,
                            fontsize: 12,
                            text: widget.product.products!.productCategory
                                .toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        LightFont(
                            color: Colors.black,
                            fontsize: 17,
                            text: widget.product.products!.productPrice
                                .toString()),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: userpro.type == "admin"
                              ? SizedBox()
                              : SizedBox(
                                  height: 30,
                                  width: w * 0.3,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      cancelOrder(widget.product);
                                    },
                                    child: LightFont(
                                        color: Colors.black,
                                        fontsize: 14,
                                        text: "Cancel"),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                child: Stepper(
                  currentStep: currentStep,
                  controlsBuilder: (context, details) {
                    if (userpro.type == 'admin' && details.currentStep < 3) {
                      return SizedBox(
                        height: 30,
                        width: w * 0.3,
                        child: OutlinedButton(
                          onPressed: () {
                            changeStatus(details.currentStep);
                          },
                          child: LightFont(
                              color: Colors.black, fontsize: 14, text: "Done"),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                  steps: [
                    Step(
                        title: Text("Placed"),
                        content: Text("Your Order Has Been Placed"),
                        isActive: currentStep >= 0,
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: Text("Out For Delivery"),
                        content: Text("Your Package is out for deleviery"),
                        isActive: currentStep >= 1,
                        state: currentStep > 1
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: Text("Out For Delivery"),
                        content: Text("Your Package is out for deleviery"),
                        isActive: currentStep > 2,
                        state: currentStep >= 2
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: Text("Recived"),
                        content: Text("Order Recived Thanks For Choosing us"),
                        isActive: currentStep >= 3,
                        state: currentStep >= 3
                            ? StepState.complete
                            : StepState.indexed),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
