import 'package:bazar/app/frontend/admin/screens/addproduct.dart';
import 'package:bazar/app/frontend/admin/screens/admin_bottom.dart';
import 'package:bazar/app/frontend/admin/screens/adminhome.dart';
import 'package:bazar/app/frontend/admin/screens/adminorder.dart';
import 'package:bazar/app/frontend/auth/screens/create.dart';
import 'package:bazar/app/frontend/auth/screens/login.dart';
import 'package:bazar/app/frontend/cart/cartscreen.dart';
import 'package:bazar/app/frontend/home/screens/bottom_user.dart';
import 'package:bazar/app/frontend/home/screens/categoryscreen.dart';
import 'package:bazar/app/frontend/home/screens/productdetail.dart';
import 'package:bazar/app/frontend/home/screens/searchscreen.dart';
import 'package:bazar/app/frontend/home/screens/userhome.dart';
import 'package:bazar/app/frontend/order/orderscreen.dart';
import 'package:bazar/app/frontend/order/successscreen.dart';
import 'package:bazar/app/frontend/order/userorder.dart';
import 'package:bazar/app/frontend/order/widgets/orderdetai.dart';
import 'package:bazar/app/frontend/profile/profile.dart';
import 'package:bazar/app/frontend/start/splashscreen.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:bazar/app/service/models/getproduct.dart';
import 'package:bazar/app/service/models/orderproduct.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenreateSetting(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.splashScreen:
      return MaterialPageRoute(builder: (context) {
        return const SplashSCreen();
      });
    case RoutesNames.loginScreen:
      return MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      });
    case RoutesNames.SigninScreen:
      return MaterialPageRoute(builder: (context) {
        return const Signinscreen();
      });
    case RoutesNames.AdminHome:
      return MaterialPageRoute(builder: (context) {
        return const AdminHomeScreen();
      });
    case RoutesNames.UserHome:
      return MaterialPageRoute(builder: (context) {
        return const USerHomeScreen();
      });
    case RoutesNames.BottomUser:
      return MaterialPageRoute(builder: (context) {
        return const BottmoUserScreen();
      });
    case RoutesNames.adminBottom:
      return MaterialPageRoute(builder: (context) {
        return const AdminBottomScreen();
      });
    case RoutesNames.addproduct:
      return MaterialPageRoute(builder: (context) {
        return const AddProductScreen();
      });
    case RoutesNames.categoryScreen:
      var category = settings.arguments as String;
      return MaterialPageRoute(builder: (context) {
        return CategoryScreen(category: category);
      });
    case RoutesNames.productDetail:
      var product = settings.arguments as Getproduct;
      return MaterialPageRoute(builder: (context) {
        return PproductDetailScreen(getproduct: product);
      });
    case RoutesNames.searchScreen:
      var searchquery = settings.arguments as String;
      return MaterialPageRoute(builder: (context) {
        return SearchScreen(searchquery: searchquery);
      });
    case RoutesNames.cartScreen:
      return MaterialPageRoute(builder: (context) {
        return const CartSCreen();
      });
    case RoutesNames.orderScreen:
      var product = settings.arguments as Getproduct;
      return MaterialPageRoute(builder: (context) {
        return OrderScreen(product: product);
      });
    case RoutesNames.orderSuccess:
      return MaterialPageRoute(builder: (context) {
        return const SuccessScreen();
      });
    case RoutesNames.userOrderscreen:
      return MaterialPageRoute(builder: (context) {
        return const UserorderScreen();
      });
    case RoutesNames.adminOrderscreen:
      return MaterialPageRoute(builder: (context) {
        return const AdminorderScreen();
      });
    case RoutesNames.orderdetailScreen:
      var product = settings.arguments as Orderproduct;
      return MaterialPageRoute(builder: (context) {
        return OrderdetailScreen(product: product);
      });
    case RoutesNames.profileScreen:
      return MaterialPageRoute(builder: (context) {
        return ProfileScreen();
      });
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(child: Text("NO SCREEN EXISTS")),
        );
      });
  }
}
