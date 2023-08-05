import 'dart:io';
import 'package:bazar/app/frontend/admin/widgets/productform.dart';
import 'package:bazar/app/frontend/utils/button.dart';
import 'package:bazar/app/frontend/utils/filepicker.dart';
import 'package:bazar/app/service/admin/admin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productnamecontroller = TextEditingController();
  final TextEditingController productdetailcontroller = TextEditingController();
  final TextEditingController productpricecontroller = TextEditingController();
  final TextEditingController productquantitycontroller =
      TextEditingController();
  final AdminService adminService = AdminService();
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    productnamecontroller.dispose();
    productdetailcontroller.dispose();
    productpricecontroller.dispose();
    productquantitycontroller.dispose();
  }

  final List<String> productCategory = [
    'Mobile',
    'Electronics',
    'Clothes',
    'Appliances',
    'Gadgets',
  ];

  List<File> images = [];

  void SelectImages() async {
    var res = await pickFiles();
    setState(() {
      images = res;
    });
  }

  String category = "Mobile";

  void AddNow() async {
    adminService.addProduct(
        product_name: productnamecontroller.text,
        product_detail: productdetailcontroller.text,
        product_price: productpricecontroller.text,
        product_quantity: productquantitycontroller.text,
        product_category: category,
        images: images,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.add_shopping_cart_sharp,
          color: Colors.black,
          size: 20,
        ),
        actions: const [
          Icon(
            Icons.logout_sharp,
            color: Colors.black,
            size: 20,
          ),
          Icon(
            Icons.logout_sharp,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 20,
          ),
        ],
        titleSpacing: -5,
        elevation: 0,
        backgroundColor: Colors.white,
        title:
            LightFont(color: Colors.black, fontsize: 15, text: "Add Products"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                BoldFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 18,
                    text: " Add product And Earn"),
                const SizedBox(
                  height: 5,
                ),
                LightFont(
                    color: GlobalColor.darkfontcolor,
                    fontsize: 12,
                    text: "Please Fill The form And Upload All Details"),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ),
                        )
                      : DottedBorder(
                          color: const Color.fromARGB(
                              255, 36, 36, 36), //color of dotted/dash line
                          strokeWidth: 1, //thickness of dash/dots
                          dashPattern: [5, 3],
                          child: InkWell(
                            onTap: SelectImages,
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    color:
                                        const Color.fromARGB(255, 10, 137, 240),
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Please Add Images"),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProductForm(
                    fieldname: "Product Name",
                    productcontroller: productnamecontroller),
                const SizedBox(
                  height: 15,
                ),
                ProductForm(
                    fieldname: "Product Detail",
                    productcontroller: productdetailcontroller),
                const SizedBox(
                  height: 15,
                ),
                ProductForm(
                    fieldname: "Product Price",
                    productcontroller: productpricecontroller),
                const SizedBox(
                  height: 15,
                ),
                ProductForm(
                    fieldname: "Product Quantity",
                    productcontroller: productquantitycontroller),
                const SizedBox(
                  height: 20,
                ),
                LightFont(color: Colors.black, fontsize: 14, text: "Category"),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    items: productCategory.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text("$item"),
                      );
                    }).toList(),
                    value: category,
                    onChanged: (String? item) {
                      setState(() {
                        category = item!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : ElevatedButtonUtil(
                          text: "Add Now",
                          onClicked: () {
                            setState(() {
                              loading = true;
                            });

                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                setState(() {
                                  loading = false;
                                });
                              },
                            );
                            AddNow();
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
