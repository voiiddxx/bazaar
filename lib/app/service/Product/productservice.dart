import 'dart:convert';

import 'package:bazar/app/config/appurl.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/res/httpresponse.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Getproduct>> fetchCategory(
      {required BuildContext context, required String category}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    final List<Getproduct> categoryproduct = [];

    try {
      http.Response response = await http.get(
          Uri.parse(AppUrl.categoryProduct + "$category"),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          });

      var data = jsonDecode(response.body);

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            for (Map<String, dynamic> i in data) {
              categoryproduct.add(Getproduct.fromJson(i));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }

    return categoryproduct;
  }

  Future<List<Getproduct>> searchData(
      {required BuildContext context, required String query}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    List<Getproduct> searchList = [];
    try {
      http.Response response = await http.get(
          Uri.parse(AppUrl.searchProduct + "$query"),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          });

      var data = jsonDecode(response.body);

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            for (Map<String, dynamic> i in data) {
              searchList.add(Getproduct.fromJson(i));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
    return searchList;
  }

  // FETCHING DATA FOR USER PANNEL

  Future<List<Getproduct>> getUserProduct(
      {required BuildContext context}) async {
    List<Getproduct> userProduct = [];
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    try {
      http.Response response = await http
          .get(Uri.parse(AppUrl.getUserproduct), headers: <String, String>{
        "Content-type": "application/json",
        "Accept": "application/json",
        "x-auth-token": userpro.token!
      });
      var data = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            for (Map<String, dynamic> i in data) {
              userProduct.add(Getproduct.fromJson(i));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
    return userProduct;
  }
}
