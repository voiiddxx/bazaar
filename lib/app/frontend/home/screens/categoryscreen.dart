import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/utils/productcard.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/Product/productservice.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductService productService = ProductService();
  List<Getproduct>? categoryData;

  void getData() async {
    categoryData = await productService.fetchCategory(
        context: context, category: widget.category);
    setState(() {});
  }

  navigateDetail(BuildContext context, Getproduct product) {
    Navigator.pushNamed(context, RoutesNames.productDetail, arguments: product);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Column(
          children: [
            SizedBox(
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
                    text: widget.category)
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: categoryData == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : GridView.builder(
                        itemCount: categoryData!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                                mainAxisExtent: 280),
                        itemBuilder: (context, index) {
                          final item = categoryData![index];
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
