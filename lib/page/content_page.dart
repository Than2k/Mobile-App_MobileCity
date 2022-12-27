import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/model/hang_model.dart';
import 'package:lt_mobile_nhom5/model/mobile_model.dart';
import 'package:lt_mobile_nhom5/page/detail_product.dart';
import 'package:lt_mobile_nhom5/provider/cart_provider.dart';
import 'package:lt_mobile_nhom5/provider/mobile_provider.dart';

import 'package:provider/provider.dart';

import 'cart_page.dart';

class ContentWidget extends StatefulWidget {
  ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  String category = "";
  List<MobileModel> listMobile =[];
  List<MobileModel> listMobileDisplay =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMobile1().then((value) {
      setState(() {
        category = "";
        listMobile.addAll(value);
        listMobileDisplay = listMobile;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
   // providerMobile.getMobile("", "");
    //setMobile("", providerMobile.list);
    return Container(
      child: Column(
        children: [
          //Positioned(top: 50,child: NavBar(cartProvider) ,),
          NavBar(cartProvider),
          SliderImaage(),
          CategoryWidget(),
          Container(
            width: 400,
            height: 30,
            padding: EdgeInsets.only(left: 5,),
            margin: EdgeInsets.only(top:10,left: 2),
            decoration: BoxDecoration(

            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                   setState(() {
                     listMobileDisplay!.sort((a,b){
                       var agia = a.giaBan;
                       var bgia = b.giaBan;
                       return agia!.compareTo(bgia!);
                     });
                   });

                  },
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text('giá tăng dần',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      listMobileDisplay!.sort((a,b){
                        var agia = a.giaBan;
                        var bgia = b.giaBan;
                        return -agia!.compareTo(bgia!);
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 30,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text('giá giảm dần',
                      style: TextStyle(
                        fontSize: 13,
                      ),),
                  )
                )
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
                  child: GridView.count(
                    childAspectRatio: 0.7,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      ...listMobileDisplay.map((e) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProduct(item: e)));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 15,
                              ),
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  InkWell(
                                    child: Container(
                                      child: Image.network(
                                        URL_SERVER+"/images_mobile/" +
                                            e.anh.toString(),
                                        height: 150,
                                        width: 150,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: 8, top: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      e.ten.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF4C53A5),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.simpleCurrency(
                                                  locale: 'vi-VN',
                                                  decimalDigits: 0)
                                              .format(e.giaBan),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF4C53A5),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cartProvider.addToCart(1, e.id, e.ten, e.anh, e.giaBan);
                                          },
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Color(0xFF4C53A5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  CategoryWidget(){
    return Container(

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              ...listHang.map((e) {
                return InkWell(
                  onTap: () {
                    print(e.id.toString());
                    //providerMobile.getMobile("", e.id.toString());

                    setState(() {

                      if(e.id.toString() == ""){
                        listMobileDisplay = listMobile;
                      }else{
                        listMobileDisplay = listMobile.where((element){
                          var maLoai = element.maloai;
                          return maLoai == e.id.toString();
                        }).toList();
                      }

                      category = e.id.toString();
                    });
                    print("sl:${listMobileDisplay.length}");

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: category == e.id ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            e.name.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: category == e.id
                                  ? Colors.white
                                  : Color(0xFF4C53A5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        ),
      );
  }
  SliderImaage(){
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      margin: EdgeInsets.only(bottom: 5),
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 120,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          reverse: false,
          aspectRatio: 5.0,
        ),
        itemBuilder: (context, i, id){
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white,)
              ),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/'+
                    imageList[i],
                  width: 600,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: (){
              var url = imageList[i];
              print(url.toString());
            },
          );
        },
      ),
    );
  }
  NavBar(CartProvider cartProvider){
    return Container(

      color: Colors.blue,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Store",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 13, right: 13),
          height: 45,
          width: 260,
          color: Colors.white,

          //decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(5),
          //),
          child: TextField(
            onChanged: (value) {
              setState(() {
                listMobileDisplay = listMobile.where((element){
                  var ten = element.ten!.toLowerCase();
                  return ten!.contains(value.toLowerCase());
                }).toList();
              });
            },
            decoration: InputDecoration(hintText: "  Search..."),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Badge(
          badgeColor: Colors.red,
          padding: EdgeInsets.all(7),
          badgeContent: Text(
            '${cartProvider.listCart.length}',
            style: TextStyle(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 35,
              color: Color(0xFF4C53A5),
            ),
          ),
        )
      ]),
    );
  }
}
