import 'package:bazar/app/global/font/font.dart';
import 'package:flutter/material.dart';

class ReuablseAppbar {
  homeappbar() {
    return AppBar(
      leading: const Icon(
        Icons.workspaces,
        color: Colors.black,
        size: 20,
      ),
      actions: const [
        Icon(
          Icons.logout_sharp,
          color: Colors.black,
          size: 20,
        ),
        Icon(
          Icons.logout_sharp,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 20,
        ),
      ],
      centerTitle: true,
      titleSpacing: -5,
      elevation: 0,
      backgroundColor: Colors.white,
      title: BoldFont(color: Colors.black, fontsize: 12, text: "Bazaar"),
    );
  }
}
