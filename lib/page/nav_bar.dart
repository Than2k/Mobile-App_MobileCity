import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lt_mobile_nhom5/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

import 'cart_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  // final cart = Get.put(ListCart());
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var provider = Provider.of<ProductProvider>(context);
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 25, bottom: 25, left: 5),
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Store",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 13, right: 13),
          height: 50,
          width: 260,
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(hintText: "  Search..."),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Badge(
          badgeColor: Colors.red,
          padding: EdgeInsets.all(7),
          badgeContent: Text(
            '${cartProvider.listCart.length}',
            style: TextStyle(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 35,
              color: Color(0xFF4C53A5),
            ),
          ),
        )
      ]),
    );
  }
}
