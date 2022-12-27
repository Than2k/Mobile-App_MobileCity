import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/page/hom_page.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/page/login.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:provider/provider.dart';

import '../model/customer.dart';
class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool err =false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    err = false;
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {

    var customerProvider = Provider.of<CustomerProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              //Image.asset('assets/images/ic_car_green.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Text(
                " create account",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: TextField(
                  controller: _fullNameController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "FullName",
                      prefixIcon: Container(
                          width: 50,
                          child: Image.asset("assets/images/ic_mail.png")),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),

              TextField(
                controller: _emailController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Container(
                        width: 50,
                        child: Image.asset("assets/images/ic_mail.png")),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _phoneController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Phone",
                    prefixIcon: Container(
                        width: 50,
                        child: Image.asset("assets/images/ic_mail.png")),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _addressController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Address",
                    prefixIcon: Container(
                        width: 50,
                        child: Image.asset("assets/images/ic_mail.png")),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(height: 15,),

              TextField(
                controller: _passController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Container(
                        width: 50, child: Image.asset("assets/images/key.png")),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              Container(
                child: err?errmsg("Thông tin đăng nhập sai!"):Container(),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed:() async{
                      try{
                        String email = _emailController.text;
                        String pass = _passController.text;
                        String fullName = _fullNameController.text;
                        String phone = _phoneController.text;
                        String address = _addressController.text;
                        Customer cus = new Customer(id: 0,hoten:fullName, diachi: address,email: email,matkhau: pass,sdt: phone );

                        Map<String,String> requestHeader = {'Content-Type':'application/json'};
                        //lay du lieu tu web api
                        var url = "${URL_SERVER}/account/register";
                        var client = http.Client();
                        var rs = await client.post(Uri.parse(url),headers: requestHeader,body:jsonEncode(cus.toJson1()) );
                        print("nhấn");
                        if(rs.statusCode == 200){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Thông báo'),
                              content: const Text('Bạn đã tạo tài khoản thành công.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => LoginPage()),);
                                  },

                                  child: const Text('Login',
                                  style: TextStyle(fontSize: 16),),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('Thoát',
                                    style: TextStyle(fontSize: 16),),
                                ),
                              ],
                            ),
                          );


                        }
                      }catch(e){
                        print(e.toString());
                      }
                    },
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    //color: Color(0xff3277D8),
                    //shape: RoundedRectangleBorder(
                    //    borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //Navigator.push(
                                //    context,
                                //    MaterialPageRoute(
                                //        builder: (context) => RegisterPage()));
                              },
                            text: "Sign up for a new account",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onLoginClick()  async{
    //try{

    // if (email == "abc@gmail.com" && pass == "123") {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => HomePage()));
    // }
    // var authBloc = MyApp.of(context).authBloc;
    // LoadingDialog.showLoadingDialog(context, "Loading...");
    // authBloc.signIn(email, pass, () {
    //   LoadingDialog.hideLoadingDialog(context);
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => HomePage()));
    // }, (msg) {
    //   LoadingDialog.hideLoadingDialog(context);
    //   MsgDialog.showMsgDialog(context, "Sign-In", msg);
    // });
  }
  Widget errmsg(String text){
    //error message widget.
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text(
          "${text}",
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }

}

