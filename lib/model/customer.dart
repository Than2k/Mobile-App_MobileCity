class Customer {
  int? id;
  String? hoten;
  String? diachi;
  String? sdt;
  String? email;
  String? matkhau;

  Customer(
      {this.id, this.hoten, this.diachi, this.sdt, this.email, this.matkhau});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hoten = json['hoten'];
    diachi = json['diachi'];
    sdt = json['sdt'];
    email = json['email'];
    matkhau = json['matkhau'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hoten'] = this.hoten;
    data['diachi'] = this.diachi;
    data['sdt'] = this.sdt;
    data['email'] = this.email;
    data['matkhau'] = this.matkhau;
    return data;
  }
  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoten'] = this.hoten;
    data['diachi'] = this.diachi;
    data['sdt'] = this.sdt;
    data['email'] = this.email;
    data['matkhau'] = this.matkhau;
    return data;
  }
}