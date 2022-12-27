import 'dart:math';

import 'package:flutter/material.dart';

class HattabWitget extends StatelessWidget {
  HattabWitget({Key? key}) : super(key: key);
  List<String> list = [
    'Tất cả',
    'Âm nhạc',
    'Trò chơi',
    'Trực tiếp',
    'Bóng đá',
    'Hướng Nghiệp',
    'Danh sách kết hợp',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
         scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...list.map((e) {
              return Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(Random().nextInt(0xffffffff)),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}//stack
