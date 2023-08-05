import 'package:bazar/app/frontend/cart/widgets/cartcard.dart';
import 'package:bazar/app/frontend/home/widgets/homeappbar.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/service/cart/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSCreen extends StatefulWidget {
  const CartSCreen({super.key});

  @override
  State<CartSCreen> createState() => _CartSCreenState();
}

class _CartSCreenState extends State<CartSCreen> {
  final CartService cartService = CartService();

  void Delete(BuildContext context, String name) async {
    await cartService.deleteTocart(context: context, name: name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<userProvider>(context).user.cart;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReuablseAppbar().homeappbar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index]['product'];
              return CartProductCard(
                  detail: item['product_detail'].toString(),
                  image: item['images'][0].toString(),
                  name: item['product_name'].toString(),
                  onBuy: () {},
                  onDeleteCart: () {
                    Delete(
                      context,
                      item['product_name'].toString(),
                    );
                  },
                  price: item['product_price'].toString());
            },
          )),
        ],
      ),
    );
  }
}
