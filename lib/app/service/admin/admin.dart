import 'dart:convert';
import 'dart:io';
import 'package:bazar/app/config/appurl.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/res/httpresponse.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/models/productmodel.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AdminService {
  Future<void> addProduct(
      {required String product_name,
      required String product_detail,
      required String product_price,
      required String product_quantity,
      required String product_category,
      required List<File> images,
      required BuildContext context}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;

    try {
      final List<String> imageurl = [];
      final cloudinary = CloudinaryPublic('dwkmxsthr', 'zch0vrtr');
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: product_name));
        imageurl.add(response.secureUrl);
      }

      Product product = Product(
          id: '',
          product_name: product_name,
          product_detail: product_detail,
          product_price: product_price,
          product_quantity: product_quantity,
          product_category: product_category,
          images: imageurl);

      http.Response response = await http.post(Uri.parse(AppUrl.addproduct),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          },
          body: product.toJson());

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            ShowSnackBar(context, "Product Added Successfully", Colors.blue);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }

  Future<List<Getproduct>> fetchAdminProduct(
      {required BuildContext context}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    List<Getproduct> adminData = [];
    try {
      http.Response response = await http.get(
        Uri.parse(AppUrl.getDataAdmin),
        headers: <String, String>{
          "Content-type": "application/json",
          "Accept": "application/json",
          "x-auth-token": userpro.token!
        },
      );
      var data = jsonDecode(response.body);

      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            for (Map<String, dynamic> i in data) {
              adminData.add(Getproduct.fromJson(i));
            }
          });
    } catch (e) {
      print(e.toString());
      ShowSnackBar(context, e.toString(), Colors.red);
    }

    return adminData;
  }

  Future<void> DeleteProduct(
      {required BuildContext context,
      required Getproduct product,
      required VoidCallback success}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.deleteproduct),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          },
          body: jsonEncode({'id': product.id}));

      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            success();
          });
    } catch (e) {
      print(e.toString());
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }
}
