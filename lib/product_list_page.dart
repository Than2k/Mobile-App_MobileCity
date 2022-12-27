import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/page/product_items.dart';
import 'package:lt_mobile_nhom5/provider/product_provider.dart';
import 'package:provider/provider.dart';



class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProducts();
    return GridView.count(
            childAspectRatio: 0.7,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              ...provider.list.map((e) {
                return ProductItems();
              }).toList()
            ],
          );
  }
}