import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/cart_model.dart';
import 'package:lt_mobile_nhom5/model/mobile_model.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/cart_provider.dart';

import 'cart_page.dart';
class DetailProduct extends StatelessWidget {
  DetailProduct({required this.item});

  var count=1;
  final MobileModel item;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

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
          title: Text('Chi tiết sản phẩm'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:  Image.network(
                      URL_SERVER+"/images_mobile/" +
                          item.anh.toString(),
                      height: 280,
                      width: 280,
                    ),
                  ),
                  Container(

                    padding: EdgeInsets.only(bottom: 8, right: 5),

                    //alignment: Alignment.bottomRight,
                    child: Text(
                      item.ten.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4C53A5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    decoration:BoxDecoration(
                      color:  Colors.yellow,
                    ) ,
                    //padding: EdgeInsets.only(bottom: 8),
                    //alignment: Alignment.centerLeft,
                    child: Text(
                      '* Thông tin cấu hình: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,),
                    width: 400,
                    decoration: BoxDecoration(

                    ),
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Màn hình:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.manhinh.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Camera trước:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.cameraTruoc.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Camera sau:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.cameraSau.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Ram:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.ram.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Cpu:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.cpu.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Pin:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.pin.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Bộ nhớ:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                item.bonho.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                'Bảo hành:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),

                            Container(
                              width: 290,
                              decoration: BoxDecoration(

                              ),
                              child: Text(
                                '${item.baohanh ==true ? 'Có':'Không'}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.simpleCurrency(
                              locale: 'vi-VN',
                              decimalDigits: 0)
                              .format(item.giaBan),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                count++;
                                print(count);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
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
                                  '$count',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),

                            ),
                            InkWell(
                              onTap: () {
                                count--;
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                ]),
              ),
        ),
        bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 130,
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
                        .format(item.giaBan),
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
                child: InkWell(
                  onTap: () {
                    print("thêm");
                   cartProvider.addToCart(1, item.id, item.ten, item.anh, item.giaBan);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  }, child: Text(
                  "Add to cart",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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