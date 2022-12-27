import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/hoadon_model.dart';

class HoaDonProvider extends ChangeNotifier {

    List<HoaDonModel> list = [];
    notifyListeners();
}


List<HoaDonModel> parseHoaDon(String res){
  var list = json.decode(res) as List<dynamic>;
  List<HoaDonModel> hoadon = list.map((model) => HoaDonModel.fromJson(model)).toList();
  return hoadon;
}
Future<List<HoaDonModel>> getHoaDon(int idKh) async {
  // lay du lieu tu web api
  List<HoaDonModel> list1 = [];
  var url = "$URL_SERVER/history-api?maKh=${idKh}";
  var client = http.Client();
  var rs = await client.get(Uri.parse(url));
  //print(rs.body);
  return compute(parseHoaDon, rs.body);
}
