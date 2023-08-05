import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/order/widgets/ordercard.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/models/orderproduct.dart';
import 'package:bazar/app/service/order/orderservice.dart';
import 'package:flutter/material.dart';

class UserorderScreen extends StatefulWidget {
  const UserorderScreen({super.key});

  @override
  State<UserorderScreen> createState() => _UserorderScreenState();
}

class _UserorderScreenState extends State<UserorderScreen> {
  final OrderService orderService = OrderService();

  List<Orderproduct>? Data;

  void Fetchdata() async {
    Data = await orderService.fetchuserOrder(context: context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fetchdata();
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
            children: [
              BoldFont(
                  color: GlobalColor.darkfontcolor,
                  fontsize: 17,
                  text: "Your Orders"),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Data == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : ListView.builder(
                          itemCount: Data!.length,
                          itemBuilder: (context, index) {
                            final item = Data![index];
                            return OrderCard(
                                category:
                                    item.products!.productCategory.toString(),
                                detail: item.products!.productDetail.toString(),
                                image: item.products!.images![0].toString(),
                                name: item.products!.productName.toString(),
                                price: item.products!.productPrice.toString(),
                                view: () {
                                  Navigator.pushNamed(
                                      context, RoutesNames.orderdetailScreen,
                                      arguments: item);
                                });
                          },
                        ))
            ],
          ),
        ));
  }
}
