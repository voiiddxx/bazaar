import 'package:bazar/app/frontend/home/widgets/categorywidget.dart';
import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/home/widgets/searchtextform.dart';
import 'package:bazar/app/frontend/utils/productcard.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/Product/productservice.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:flutter/material.dart';

class USerHomeScreen extends StatefulWidget {
  const USerHomeScreen({super.key});

  @override
  State<USerHomeScreen> createState() => _USerHomeScreenState();
}

class _USerHomeScreenState extends State<USerHomeScreen> {
  final ProductService productService = ProductService();
  List<Getproduct>? Data;

  void GetDatauser() async {
    Data = await productService.getUserProduct(context: context);
    setState(() {});
  }

  void Navigate(Getproduct product) {
    Navigator.pushNamed(context, RoutesNames.productDetail, arguments: product);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDatauser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const SearchTextForm(),
                const SizedBox(
                  height: 25,
                ),
                const CategoreisWidget(),
                BoldFont(
                    color: Colors.grey, fontsize: 13, text: "Explore Products"),
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
                        : GridView.builder(
                            itemCount: Data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    mainAxisExtent: 280),
                            itemBuilder: (context, index) {
                              final item = Data![index];
                              return ProductCard(
                                  detail: item.productDetail.toString(),
                                  image: item.images![0].toString(),
                                  name: item.productName.toString(),
                                  price: item.productPrice.toString(),
                                  onClick: () {
                                    Navigate(item);
                                  });
                            },
                          ))
              ],
            ),
          ),
        ));
  }
}
