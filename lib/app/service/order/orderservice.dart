import 'dart:convert';
import 'package:bazar/app/config/appurl.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/res/httpresponse.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/models/orderproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<void> postOrder({
    required BuildContext context,
    required Getproduct product,
    required String address,
  }) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.postorder),
          body: jsonEncode({'address': address, 'products': product}),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          });
      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            ShowSnackBar(context, "Ordered Successfully", Colors.blue);
            Navigator.pushNamed(context, RoutesNames.orderSuccess);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }

  Future<List<Orderproduct>> fetchuserOrder(
      {required BuildContext context}) async {
    List<Orderproduct> orderlist = [];
    final userpro = Provider.of<userProvider>(context, listen: false).user;

    try {
      http.Response response = await http
          .get(Uri.parse(AppUrl.getuserorder), headers: <String, String>{
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
              orderlist.add(Orderproduct.fromJson(i));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
    return orderlist;
  }

  // GETTING ORDER DATA FOR ADMIN

  Future<List<Orderproduct>> fetchAdminOrder(
      {required BuildContext context}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    List<Orderproduct> adminorderlist = [];
    try {
      http.Response response = await http
          .get(Uri.parse(AppUrl.getadminorder), headers: <String, String>{
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
              adminorderlist.add(Orderproduct.fromJson(i));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
    return adminorderlist;
  }

// UPDATE THE ORDER STATUS

  Future<void> UpdateStatus(
      {required BuildContext context,
      required int value,
      required Orderproduct product,
      required VoidCallback done}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.updateStatus),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
            "x-auth-token": userpro.token!
          },
          body: jsonEncode({'id': product.id, 'value': value}));
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            done();
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }

  // SERVICE ROUTE TO DELETE ORDER AS USER

  Future<void> deleteOrder(
      {required BuildContext context, required Orderproduct product}) async {
    final userpro = Provider.of<userProvider>(context, listen: false).user;
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.deleteOrder),
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
            ShowSnackBar(
                context, "Your Order has been cancelled", Colors.black);
            Navigator.pushNamed(context, RoutesNames.BottomUser);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
    }
  }
}
