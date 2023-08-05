import 'package:bazar/app/frontend/admin/widgets/adminproductcard.dart';
import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/admin/admin.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final AdminService adminService = AdminService();
  List<Getproduct>? data;

  void Getdata() async {
    data = await adminService.fetchAdminProduct(context: context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getdata();
  }

  navigateProductDetail(Getproduct product) async {
    Navigator.pushNamed(context, RoutesNames.productDetail, arguments: product);
  }

  void deleteproduct(Getproduct product, int index) async {
    await adminService.DeleteProduct(
        context: context,
        product: product,
        success: () {
          data!.removeAt(index);
          setState(() {});
          ShowSnackBar(context, "Product Deleted Successfully", Colors.black);
        });
  }

  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReuablseAppbar().homeappbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              BoldFont(
                  color: GlobalColor.darkfontcolor,
                  fontsize: 20,
                  text: "Hello " + userpro.username.toString() + " ⚡"),
              const SizedBox(
                height: 20,
              ),
              LightFont(
                  color: Colors.grey, fontsize: 15, text: "Your Products"),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: data == null
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                    : ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final item = data![index];
                          return AdminProductCard(
                              detail: item.productDetail.toString(),
                              image: item.images![0].toString(),
                              name: item.productName.toString(),
                              price: item.productPrice.toString(),
                              onClick: () {
                                navigateProductDetail(item);
                              },
                              onDelete: () {
                                deleteproduct(item, index);
                              });
                        },
                      ),
              )
            ],
          ),
        ));
  }
}
