class HoaDonModel {
  int? id;
  String? ngayMua;
  int? damua;
  List<ChiTietHD>? chiTietHD;

  HoaDonModel({this.id, this.ngayMua, this.damua, this.chiTietHD});

  HoaDonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ngayMua = json['ngayMua'];
    damua = json['damua'];
    if (json['chiTietHD'] != null) {
      chiTietHD = <ChiTietHD>[];
      json['chiTietHD'].forEach((v) {
        chiTietHD!.add(new ChiTietHD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ngayMua'] = this.ngayMua;
    data['damua'] = this.damua;
    if (this.chiTietHD != null) {
      data['chiTietHD'] = this.chiTietHD!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChiTietHD {
  int? id;
  String? ten;
  String? anh;
  int? soLuong;
  int? gia;
  bool? damua;

  ChiTietHD({this.id, this.ten, this.anh, this.soLuong, this.gia, this.damua});

  ChiTietHD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    anh = json['anh'];
    soLuong = json['soLuong'];
    gia = json['gia'];
    damua = json['damua'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten'] = this.ten;
    data['anh'] = this.anh;
    data['soLuong'] = this.soLuong;
    data['gia'] = this.gia;
    data['damua'] = this.damua;
    return data;
  }
}
int TongTien(List<ChiTietHD>? list) {
  int tong=0;
  var sum = list?.map((e) {
    return e.soLuong! * e.gia!;
  });
  sum!.forEach((element) {
    tong += element;
  });
  return tong;
}