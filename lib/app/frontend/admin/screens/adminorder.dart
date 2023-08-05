import 'package:bazar/app/frontend/admin/widgets/adminordercard.dart';
import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/models/orderproduct.dart';
import 'package:bazar/app/service/order/orderservice.dart';
import 'package:flutter/material.dart';

class AdminorderScreen extends StatefulWidget {
  const AdminorderScreen({super.key});

  @override
  State<AdminorderScreen> createState() => _AdminorderScreenState();
}

class _AdminorderScreenState extends State<AdminorderScreen> {
  final OrderService orderService = OrderService();
  List<Orderproduct>? Data;

  void AdminOrder() async {
    Data = await orderService.fetchAdminOrder(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    AdminOrder();
  }

  void navigatedetail(Orderproduct product) async {
    Navigator.pushNamed(context, RoutesNames.orderdetailScreen,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              BoldFont(
                  color: GlobalColor.darkfontcolor,
                  fontsize: 17,
                  text: "All Reciver Orders"),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Data == null
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        )
                      : GridView.builder(
                          itemCount: Data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 2,
                                  mainAxisExtent: 320),
                          itemBuilder: (context, index) {
                            final item = Data![index];
                            return Adminordercard(
                                image: item.products!.images![0].toString(),
                                name: item.products!.productName.toString(),
                                price: item.products!.productPrice.toString(),
                                view: () {
                                  navigatedetail(item);
                                });
                          },
                        ))
            ],
          ),
        ));
  }
}
