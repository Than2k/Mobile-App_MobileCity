import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/slider_widget.dart';

import 'hattab_widget.dart';

class DestincationPage extends StatelessWidget {
   DestincationPage({Key? key}) : super(key: key);
   String content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             // blockImage(context),
              SliderWidget(),
              HattabWitget(),
              blockTitle(context),
              blockButtons(context),
              blockDescription(context)
            ],
          ),
        ),
      ),
    );
  }

  blockImage(BuildContext context) {
    return Image.asset("assets/images/IMG_1777.jpg");
  }

  blockTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,//canh lề các thuộc tính trên 1 hàng (flex)
        children: [
          Column(

            children: [
              Text(
                "Trường ĐHKH Huế",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text(
                "77 Nguyễn Huệ,Tp Huế",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
              )
            ],
          ),

          Row(
            children: [
              Icon(Icons.star,color: Colors.grey,),
              Text(
                "41",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  button(String title, IconData iconData){
    return Column(
      children: [
        Icon(
            iconData,
          color: Colors.blueAccent,
          size: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.blueAccent
          ),
        )
      ],
    );
  }
  blockButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        button("CALL", Icons.call),
        button("ROUTE", Icons.route),
        button("SHARE", Icons.share),
      ],
    );
  }

  blockDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Text(
        content,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
