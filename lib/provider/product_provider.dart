import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/model/cart_model.dart';
import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];

  void getProducts() async {
    // lay du lieu tu web api
    var url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
  }

  void getSearch(String value) {
    List<ProductModel> temp = [];
    for (int i = 0; i < list.length; i++) {
      if ((list[i].title)!.contains(value, 0)) {
        temp.add(list[i]);
        print('haha');
      }
    }
    notifyListeners();
    list = temp;
  }

  void getSearchByCategory(String value) async {
    List<ProductModel> temp = [];
    if (value == "all") {
      getProducts();
    } else {
      var url = "https://fakestoreapi.com/products";
      var client = http.Client();
      var rs = await client.get(Uri.parse(url));
      var jsonString = rs.body;

      var jsonObject = jsonDecode(jsonString) as List;
      list = jsonObject.map((e) {
        return ProductModel.fromJson(e);
      }).toList();
      for (int i = 0; i < list.length; i++) {
        if ((list[i].category)! == value) {
          temp.add(list[i]);
          print('haha');
        }
      }
    }

    list = temp;
    notifyListeners();
  }
}
