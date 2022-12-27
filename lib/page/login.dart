import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lt_mobile_nhom5/hepper/network.dart';
import 'package:lt_mobile_nhom5/page/hom_page.dart';
import 'package:http/http.dart' as http;
import 'package:lt_mobile_nhom5/page/register_page.dart';
import 'package:lt_mobile_nhom5/provider/customer_provider.dart';
import 'package:provider/provider.dart';

import '../model/customer.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool err =false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
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
                "Login to continue using MobileCity",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 20),
                child: TextField(
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
              ),
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
              Container(
                //constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed:() async{
                      try{
                        String email = _emailController.text;
                        String pass = _passController.text;
                        print(email +":" + pass);
                        Map<String,String> requestHeader = {'Content-Type':'application/json'};
                        //lay du lieu tu web api
                        var url = "${URL_SERVER}/account/login";
                        var client = http.Client();
                        var rs = await client.post(Uri.parse(url),headers: requestHeader,body:jsonEncode({"email":email, "pass": pass}) );
                        if(rs.statusCode == 200){
                          var jsonString = rs.body;
                          if(jsonString.isNotEmpty == true){
                            Map<String, dynamic> valueMap = json.decode(jsonString);
                            customerProvider.customer= Customer.fromJson(valueMap);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => HomePage()));
                          }else{
                            setState(() {err=true;});
                            print("dang nhap sai");
                          }
                        }else{
                          print(rs.statusCode);
                        }
                      }catch(e){
                        print(e.toString());
                      }
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    //color: Color(0xff3277D8),
                    //shape: RoundedRectangleBorder(
                    //    borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),);
                  },
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      color: Colors.blue,

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

