import 'package:bazar/app/frontend/admin/screens/addproduct.dart';
import 'package:bazar/app/frontend/admin/screens/adminhome.dart';
import 'package:bazar/app/frontend/admin/screens/adminorder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../profile/profile.dart';

class AdminBottomScreen extends StatefulWidget {
  const AdminBottomScreen({super.key});

  @override
  State<AdminBottomScreen> createState() => _AdminBottomScreenState();
}

class _AdminBottomScreenState extends State<AdminBottomScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    AdminHomeScreen(),
    AddProductScreen(),
    AdminorderScreen(),
    ProfileScreen(),
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
            icon: Icons.add_home_sharp,
            text: "Add Product",
          ),
          GButton(
            icon: Icons.call_missed_outgoing_sharp,
            text: "Analytics",
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
