import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/model/cart_model.dart';
import 'package:lt_mobile_nhom5/page/detail_product.dart';
import 'package:lt_mobile_nhom5/provider/cart_provider.dart';
import 'package:lt_mobile_nhom5/provider/mobile_provider.dart';
import 'package:lt_mobile_nhom5/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';

class ProductItems extends StatelessWidget {
  ProductItems({Key? key}) : super(key: key);
  //final cart = Get.put(ListCart());
  //final ProductModel item;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    //var productProvider = Provider.of<ProductProvider>(context);
   // var mobileProvider = Provider.of<MobileProvider>(context);

    //mobileProvider.getMobile("", "");
   // print(mobileProvider.list.length);
    //productProvider.getProducts();
    return Container();
  }
}
