import 'package:lt_mobile_nhom5/model/cart_model.dart';

class CartPay {
  int? idCustomer;
  List<CartModel>? cart;

  CartPay({this.idCustomer, this.cart});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCustomer'] = this.idCustomer;
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}