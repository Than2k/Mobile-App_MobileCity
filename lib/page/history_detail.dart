import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/hoadon_model.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:lt_mobile_nhom5/provider/hoadon_provider.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../provider/cart_provider.dart';
import 'cart_items.dart';

class HistoryDetail extends StatelessWidget {
  HistoryDetail({required this.hoadon});
  final HoaDonModel hoadon;
  @override
  Widget build(BuildContext context) {
    int tongTien=0;
    var hoadonProvider = Provider.of<HoaDonProvider>(context);
    var customerProvider = Provider.of<CustomerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
        ),
        title: Text("Chi tiết đơn hàng"),
      ),
      body: ListView(
        children: [
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                Container(
                 child: Column(
                   children: [
                     Text("Thông tin chi tiết đơn hàng: #${hoadon.id}",
                       style: TextStyle(
                           fontSize: 20, color: Colors.blue,
                           fontWeight: FontWeight.bold
                       ),
                     ),
                     Text("Gồm: ${hoadon.chiTietHD!.length} sản phẩm",
                       style: TextStyle(
                           fontSize: 17, color: Colors.blue,
                           fontWeight: FontWeight.w500
                       ),
                     ),
                   ],
                 ),
                ),
                ...hoadon.chiTietHD!.map((e) {
                  tongTien += e.soLuong! *e.gia!;
                  return  Container(
                    height: 120,
                    width: 600,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 70,
                          margin: EdgeInsets.only(right: 15),
                          child: Image.network(URL_SERVER +"/images_mobile/"+e.anh.toString()),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${e.ten}',
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                ),
                                Text('Số lượng: ${e.soLuong}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                ),
                                Text('Giá:'+
                                  NumberFormat.simpleCurrency(
                                      locale: 'vi-VN',
                                      decimalDigits: 0)
                                      .format(e.gia),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                )



              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(
                        locale: 'vi-VN',
                        decimalDigits: 0)
                        .format(tongTien),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  )
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}