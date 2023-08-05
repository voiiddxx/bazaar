import 'package:bazar/app/frontend/admin/screens/adminhome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottmoBar extends StatefulWidget {
  const BottmoBar({super.key});

  @override
  State<BottmoBar> createState() => _BottmoBarState();
}

class _BottmoBarState extends State<BottmoBar> {
  int _selectedIndex = 0;
  static const List<Widget> _pagees = <Widget>[
    AdminHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pagees.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        activeColor: Colors.black,
        curve: Curves.easeInCirc,
        hoverColor: Color.fromARGB(149, 54, 54, 54),
        textStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            color: Colors.black,
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
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
