import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/mobile_model.dart';
import '../model/product_model.dart';

class MobileProvider extends ChangeNotifier {
  List<MobileModel> list = [];

  void getMobile() async{
      // lay du lieu tu web api

    var url = "$URL_SERVER/mobile-api";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e) {
      return MobileModel.fromJson(e);
    }).toList();

    }

  }


List<MobileModel> parseMobile(String res){
  var list = json.decode(res) as List<dynamic>;
  List<MobileModel> mobiles = list.map((model) => MobileModel.fromJson(model)).toList();
  return mobiles;
}
Future<List<MobileModel>> getMobile1() async {
  // lay du lieu tu web api
  List<MobileModel> list1 = [];
  var url = "$URL_SERVER/mobile-api";
  var client = http.Client();
  var rs = await client.get(Uri.parse(url));
  return compute(parseMobile, rs.body);
}
