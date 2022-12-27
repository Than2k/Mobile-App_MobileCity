import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/cart_model.dart';
import 'package:lt_mobile_nhom5/model/customer.dart';
import '../model/product_model.dart';

class CustomerProvider  extends ChangeNotifier{
  Customer customer = new Customer();
}
Customer parseMobile(String res){
  Map<String, dynamic> valueMap = json.decode(res);
  return Customer.fromJson(valueMap);
}
Future<Customer> ktDn(String email, String pass) async {
  // lay du lieu tu web api
  Customer list1 = new Customer();
  var url = "${URL_SERVER}/account/login";
  Map<String,String> requestHeader = {'Content-Type':'application/json'};
  var client = http.Client();
  var rs = await client.post(Uri.parse(url),headers: requestHeader,body:jsonEncode({"email":email, "pass": pass}) );
  return compute(parseMobile, rs.body);
}
