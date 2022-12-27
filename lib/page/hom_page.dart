import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/page/history_page.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:lt_mobile_nhom5/provider/mobile_provider.dart';
import 'package:provider/provider.dart';

import '../hepper/network.dart';
import '../provider/cart_provider.dart';
import 'cart_page.dart';
import 'content_page.dart';
import 'nav_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index =0;
  var _Kh;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index =0;
  }
  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<CartProvider>(context);
    var customerProvider = Provider.of<CustomerProvider>(context);
    setState(() {
      _Kh = customerProvider.customer;
    });
    var Mobile = Provider.of<MobileProvider>(context);
    //hoadonPrivder.getHoaDon1(customerProvider.customer.id??0);
    return Scaffold(
      body: ListView(
        children: [

          ContentWidget(),
        ],
      ),
    bottomNavigationBar: BottomWidget(customerProvider.customer.id??0),
    );

  }
  BottomWidget( int id){
    return CustomNavigationBar(backgroundColor: Colors.lightBlue,selectedColor: Colors.white,
        borderRadius: Radius.circular(5.0),
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home),


          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.history),
          ),

          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;

        });
        if(_index ==1){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        }
        if(_index ==2){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage(kh: _Kh,)),
          );
        }
        if(_index ==0){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },

    );

  }
}
