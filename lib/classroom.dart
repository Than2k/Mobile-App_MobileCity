import 'package:flutter/material.dart';

import 'model/Lophoc.dart';

class ClassRoom extends StatelessWidget {
  ClassRoom({Key? key}) : super(key: key);
  List<LopHoc> lophoc = ls;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...lophoc.map((e) {
              //... phân rã ra từng phần tử riêng biệt
              return Stack(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 200,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 10, right: 5, left: 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e.anh), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10), //bo viền
                    ),
                    child: Container(
                        child: PopupMenuButton(
                            itemBuilder:(context) => [
                              PopupMenuItem<int>(
                                  value: 0,
                                  child: Text('Xóa')
                              ),
                            ]
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "[ ${e.maKhoa} ]- ${e.tenMH}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "${e.maKhoa} . ${e.maMH} . ${e.maNhom}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 85),
                        Row(
                          children: [

                            Text(
                              e.slHocVien.toString() + " Học Viên",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
