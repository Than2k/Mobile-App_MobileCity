
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lt_mobile_nhom5/model/cart_model.dart';
import 'package:lt_mobile_nhom5/model/cartpay_model.dart';
import 'package:http/http.dart' as http;
import '../hepper/network.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> listCart = [];

  void addToCart(int count, int? id, String? ten,String? anh, int? gia) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].id == id) {
        listCart[i].setSl(listCart[i].soLuong + count);

        return;
      }
    }
    listCart.add(new CartModel(id ?? 0, ten ?? "", anh ?? "",  gia?? 0, 1));
    notifyListeners();
  }

  double total() {
    double sum = 0;
    for (int i = 0; i < listCart.length; i++) {
      sum += listCart[i].gia * listCart[i].soLuong;
    }
    //notifyListeners();
    return sum;
  }

  void delete(int id) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].id == id) {
        listCart.removeAt(i);
        notifyListeners();
        return;
      }
    }
  }

  void count(int id, int k) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].id == id) {
        listCart[i].setSl(listCart[i].soLuong + k);
        notifyListeners();
        return;
      }
    }
  }
  void deleteAll(){
    listCart.clear();
    notifyListeners();
  }
  Future<String?> pay(int idCustomer ) async {
    if(listCart.length >0){
      CartPay cartPay = new CartPay(idCustomer: idCustomer, cart: listCart);
      var json1 = cartPay.toJson();
      String jsonCart =json.encode(json1);
      Map<String,String> requestHeader = {'Content-Type':'application/json'};
      var url = "$URL_SERVER/cart-api/pay";
      var client = http.Client();
      var rs = await client.post(Uri.parse(url),headers: requestHeader,body:jsonCart );
      var jsonString = rs.body;
      //return jsonString!;
      print(jsonString);

    }

  }
}

