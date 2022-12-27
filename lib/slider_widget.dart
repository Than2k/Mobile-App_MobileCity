import 'package:flutter/material.dart';
class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key}) : super(key: key);

  List<String> list = [
    'assets/images/IMG_1777.jpg',
    'assets/images/anh2.jpg',
    'assets/images/anh1.jpg',
    'assets/images/IMG_1777.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,//cuộn nằm ngang
        child: Row(
          children: [
            // for(int i=0;i<list.length;i++)
            //   Image.asset(list[i]),
            ...list.map((e){//... phân rã ra từng phần tử riêng biệt
              return Container(

                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width * .8,//lấy chiều rộng màn hình
                decoration:BoxDecoration(//trang trí cho container
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(30)//bo viền
                ) ,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
