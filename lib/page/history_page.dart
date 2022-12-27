import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/page/history_detail.dart';
import 'package:provider/provider.dart';

import '../hepper/network.dart';
import '../model/customer.dart';
import '../model/hoadon_model.dart';
import '../provider/customer_provider.dart';
import '../provider/hoadon_provider.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({required this.kh});
  Customer kh;
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HoaDonModel> listHd = [];
  int sum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("khachhang:${this.widget.kh.id}");
    getHoaDon(this.widget.kh.id ?? 0).then((value) {

      listHd.addAll(value);
    });

  }

  @override
  Widget build(BuildContext context) {
    var hoadonProvider = Provider.of<HoaDonProvider>(context);
    hoadonProvider.list = listHd;
    if (listHd.length > 0) {
      setState(() {
        hoadonProvider.list = listHd;
      });
    }
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
        title: Text("Lịch sử mua hàng"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(),
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:15,bottom: 15)
                  ,
                  child: Column(
                    children: [
                      Text('Chào a/c: ${this.widget.kh.hoten}-${this.widget.kh.sdt}',
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('( lịch sử mua hàng gần đây của ban! )',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
                ...hoadonProvider.list.map((e) {
                  return Container(
                    height: 200,
                    width: 400,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Đơn hàng: #${e.id}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 130),
                              child: Text(
                                ' ${e.damua == 1 ? "đã xác nhận" : "chưa xác nhận"}',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              margin: EdgeInsets.only(right: 15, top: 30),
                              child: Image.network(
                                  "${URL_SERVER}/images_mobile/${(e.chiTietHD)?.first.anh}"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${(e.chiTietHD)?.first.ten}',
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                    Text(
                                      "${(e.chiTietHD != null && e.chiTietHD!.length >= 2) ? 'và ${e.chiTietHD!.length - 1} sản phẩm khác' : ''}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "ngày đặt: ${e.ngayMua}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Tổng tiền: " +
                                          NumberFormat.simpleCurrency(
                                                  locale: 'vi-VN',
                                                  decimalDigits: 0)
                                              .format(TongTien(e.chiTietHD)),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 7),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoryDetail(
                                              hoadon: e,
                                            )),
                                  );
                                },
                                child: Text('Xem chi tiết',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
