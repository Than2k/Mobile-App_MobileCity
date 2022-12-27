import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/page/hom_page.dart';

import 'package:lt_mobile_nhom5/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);


  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/EVN1.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10), //bo viền
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formkey, //lưu đối tượng trả về
                  child: Column(
                    children: [
                      Text(
                        "Đăng nhập hệ thống",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Tên đăng nhập không được để trống";
                          else
                            return null;
                        },
                        controller: userNameController,
                        decoration: InputDecoration(
                            hintText:
                                "Vui lòng nhập tên đăng nhập", //từ gợi ý giống plahoder
                            label: Text("Tên đăng nhập",
                                style: TextStyle(fontSize: 23)),
                            prefixIcon: Icon(Icons.person)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Bạn chưa nhập mật khẩu";
                          else
                            return null;
                        },
                        obscureText: true,
                        controller: passWordController,
                        decoration: InputDecoration(
                            hintText:
                                "Vui lòng nhập mật khẩu", //từ gợi ý giống plahoder
                            label: Text(
                              "Mật khẩu",
                              style: TextStyle(fontSize: 23),
                            ),
                            prefixIcon: Icon(Icons.password)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            var userName = userNameController.text;
                            var passWork = passWordController.text;
                            if (userName == "abc" && passWork == "123") {
                              productProvider.getProducts();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } else {
                              var snackBar = SnackBar(
                                content: Text("Xin chào: ${userName}"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 83,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Đăng nhập",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
