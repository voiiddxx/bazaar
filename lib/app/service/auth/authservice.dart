import 'dart:convert';
import 'dart:io';
import 'package:bazar/app/config/appurl.dart';
import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:bazar/app/global/colors/color.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/res/httpresponse.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/models/loginmodel.dart';
import 'package:bazar/app/service/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> Register(
      {required String username,
      required String email,
      required String password,
      required String confirmpassword,
      required String type,
      required BuildContext context}) async {
    try {
      User user = User(
        id: '',
        username: username,
        email: email,
        password: password,
        confirmpassword: confirmpassword,
        type: type,
        token: '',
        cart: [],
      );

      http.Response response = await http.post(Uri.parse(AppUrl.RegisterUrl),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: user.toJson());

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () {
            ShowSnackBar(context, "Account Created Successfully", Colors.green);
            Navigator.pushNamed(context, RoutesNames.SigninScreen);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), Colors.red);
      print(e.toString());
    }
  }

// LOGIN API INTEGREATION

  Future<void> LoginAPiservice(
      {required String email,
      required String password,
      required BuildContext context}) async {
    LoginUser loginUser = LoginUser(email: email, password: password);
    try {
      http.Response response = await http.post(Uri.parse(AppUrl.LoginUrl),
          headers: <String, String>{
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: loginUser.toJson());

      // ignore: use_build_context_synchronously
      Httphandler(
          context: context,
          response: response,
          onSussess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<userProvider>(context, listen: false)
                .setuser(response.body.toString());
            await prefs.setString(
                "x-auth-token", jsonDecode(response.body)['token']);

            // ignore: use_build_context_synchronously
            ShowSnackBar(context, "Login Successfully", Colors.green);
            if (Provider.of<userProvider>(context, listen: false).user.type ==
                "user") {
              Navigator.pushNamed(context, RoutesNames.BottomUser);
            } else {
              Navigator.pushNamed(context, RoutesNames.adminBottom);
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString(), GlobalColor.Redprimary);
      print(e.toString());
    }
  }

// API INTEGREATION FOR GETTING THE USER DATA
  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String? token = _prefs.getString('x-auth-token');

      if (token == null) {
        _prefs.setString('x-auth-token', '');
      }

      var tokenresponse =
          await http.get(Uri.parse(AppUrl.isvalid), headers: <String, String>{
        "Content-type": "application/json",
        "Accept": "application/json",
        "x-auth-token": token!
      });

      var tokenres = jsonDecode(tokenresponse.body.toString());

      if (tokenres == true) {
        http.Response response =
            await http.get(Uri.parse(AppUrl.getUser), headers: <String, String>{
          "Content-type": "application/json",
          "Accept": "application/json",
          "x-auth-token": token!
        });

        var userPro = Provider.of<userProvider>(context, listen: false);
        userPro.setuser(response.body);
      }
    } catch (e) {
      ShowSnackBar(context, e.toString(), GlobalColor.Redprimary);
      print(e.toString());
    }
  }
}
