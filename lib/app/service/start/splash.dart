import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/auth/authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashService {
  delayeService(BuildContext context) async {
    await AuthService().getUserData(context);
    // ignore: use_build_context_synchronously
    final userpro = Provider.of<userProvider>(context, listen: false).user;

    if (userpro.token.isNotEmpty) {
      if (userpro.type == "user") {
        Future.delayed(const Duration(seconds: 2));

        Navigator.pushNamed(context, RoutesNames.BottomUser);
      } else {
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesNames.adminBottom);
      }
    } else {
      Future.delayed(const Duration(seconds: 2));
      Navigator.pushNamed(context, RoutesNames.SigninScreen);
    }
  }
}
