import 'package:bazar/app/frontend/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void Httphandler(
    {required BuildContext context,
    required http.Response response,
    required VoidCallback onSussess}) async {
  switch (response.statusCode) {
    case 200:
      onSussess();
    case 400:
      ShowSnackBar(context, response.body.toString(), Colors.red);

    case 401:
      ShowSnackBar(context, response.body.toString(), Colors.red);

    case 500:
      ShowSnackBar(context, response.body.toString(), Colors.red);

    default:
      ShowSnackBar(context, response.body.toString(), Colors.red);
  }
}
