import 'dart:async';
import 'dart:convert';

import 'package:bazar/app/config/appurl.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/res/httpresponse.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CartService {
  Future<void> Addtocart(
      {required BuildContext context, required Getproduct product}) async {
    final userpro = Provider.of<userProvider>(context, listen: false);
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.addTocart),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.user.token!
          },
          body: jsonEncode({'id': product.id}));

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            ShowSnackBar(context, "Item Added", Colors.blue);
            User user =
                userpro.user.copyWith(cart: jsonDecode(response.body)['cart']);

            userpro.SetUser(user);
          });
    } catch (e) {
      print(e.toString());
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }

  Future<void> deleteTocart(
      {required BuildContext context, required String name}) async {
    final userpro = Provider.of<userProvider>(context, listen: false);
    try {
      http.Response response = await http.delete(
          Uri.parse(AppUrl.deleteTocart + "${name}"),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.user.token!
          });

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            ShowSnackBar(context, "Item Deleted", Colors.yellow);
            User user =
                userpro.user.copyWith(cart: jsonDecode(response.body)['cart']);
            userpro.SetUser(user);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }
}
