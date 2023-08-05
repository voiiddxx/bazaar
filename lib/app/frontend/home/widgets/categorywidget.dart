import 'package:bazar/app/global/font/font.dart';
import 'package:bazar/app/global/gloablvar.dart';
import 'package:bazar/app/routes/routename.dart';
import 'package:flutter/material.dart';

class CategoreisWidget extends StatelessWidget {
  const CategoreisWidget({super.key});

  void navigate(BuildContext context, String category) {
    Navigator.pushNamed(context, RoutesNames.categoryScreen,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: GlobalVariable.category.length,
        itemExtent: 85,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigate(context, GlobalVariable.category[index]['title']!);
            },
            child: Column(
              children: [
                Container(
                  child: ClipRRect(
                    // ignore: sort_child_properties_last
                    child: Image.network(
                      GlobalVariable.category[index]['image']!,
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                LightFont(
                    color: Colors.black,
                    fontsize: 12,
                    text: GlobalVariable.category[index]['title']!),
              ],
            ),
          );
        },
      ),
    );
  }
}
