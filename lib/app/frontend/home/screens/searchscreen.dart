import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/service/Product/productservice.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:flutter/material.dart';

import '../../../global/font/font.dart';
import '../../../routes/routename.dart';
import '../../utils/productcard.dart';

class SearchScreen extends StatefulWidget {
  final String searchquery;
  const SearchScreen({super.key, required this.searchquery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ProductService productService = ProductService();
  List<Getproduct> seacrhItem = [];

  // ignore: non_constant_identifier_names
  void GetsearchData() async {
    seacrhItem = await productService.searchData(
        context: context, query: widget.searchquery);
    setState(() {});
  }

  navigateDetail(BuildContext context, Getproduct product) {
    Navigator.pushNamed(context, RoutesNames.productDetail, arguments: product);
  }

  @override
  void initState() {
    super.initState();
    GetsearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 20,
                    text: "      Keep Shopping For  "),
                BoldFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 20,
                    text: widget.searchquery)
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: seacrhItem.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  mainAxisExtent: 280),
              itemBuilder: (context, index) {
                final item = seacrhItem[index];
                return ProductCard(
                    detail: item.productDetail.toString(),
                    image: item.images![0].toString(),
                    name: item.productName.toString(),
                    price: item.productPrice.toString(),
                    onClick: () {
                      navigateDetail(context, item);
                    });
              },
            ))
          ],
        ));
  }
}
