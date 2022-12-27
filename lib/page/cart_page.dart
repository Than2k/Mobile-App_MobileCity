 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/page/history_page.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../provider/cart_provider.dart';
import 'cart_items.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
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
        title: Text("Cart"),
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
                ...cartProvider.listCart.map((e) {
                  return  Container(
                    height: 120,
                    width: 400,
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
                          child: Image.network(URL_SERVER +"/images_mobile/"+ e.anh),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
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
                                Text(
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
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  cartProvider.delete(e.id);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                        cartProvider.count(e.id, 1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 10),
                                          ]),
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      '${e.soLuong}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if(e.soLuong >1){
                                        cartProvider.count(e.id, -1);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 10),
                                          ]),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
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
          height: 150,
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
                          .format(cartProvider.total()),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  )
                ],
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: ()  {
                    cartProvider.pay(customerProvider.customer.id??0);
                    print('thêm hóa đơn');
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Thông báo'),
                          content: const Text('Bạn đã đặt hàng thành công.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      cartProvider.deleteAll();
                    },
                  child: const Text('Đặt hàng',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

}