import 'package:bazar/app/frontend/cart/cartscreen.dart';
import 'package:bazar/app/frontend/home/screens/userhome.dart';
import 'package:bazar/app/frontend/order/userorder.dart';
import 'package:bazar/app/frontend/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottmoUserScreen extends StatefulWidget {
  const BottmoUserScreen({super.key});

  @override
  State<BottmoUserScreen> createState() => _BottmoUserScreenState();
}

class _BottmoUserScreenState extends State<BottmoUserScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    USerHomeScreen(),
    UserorderScreen(),
    CartSCreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
        activeColor: const Color.fromARGB(255, 39, 39, 39),
        curve: Curves.easeInCirc,
        hoverColor: Color.fromARGB(149, 54, 54, 54),
        textStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 79, 79, 79),
            fontSize: 12,
            letterSpacing: 0.2),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: "Orders",
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: "cart",
          ),
          GButton(
            icon: Icons.person_4_sharp,
            text: "Profile",
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
