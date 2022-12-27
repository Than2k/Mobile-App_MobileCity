import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/page/hom_page.dart';

import 'package:lt_mobile_nhom5/page/cart_page.dart';
import 'package:lt_mobile_nhom5/page/login.dart';
import 'package:lt_mobile_nhom5/provider/cart_provider.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:lt_mobile_nhom5/provider/hoadon_provider.dart';
import 'package:lt_mobile_nhom5/provider/mobile_provider.dart';

import 'package:lt_mobile_nhom5/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => HoaDonProvider()),
      ChangeNotifierProvider(create: (_) => MobileProvider()),
      ChangeNotifierProvider(create: (_) => CustomerProvider()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyanAccent,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    ),
  ));
}
