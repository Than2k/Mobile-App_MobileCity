class MobileModel {
  int? id;
  String? ten;
  int? giaBan;
  int? giaNhap;
  int? soluong;
  String? mausac;
  String? cameraTruoc;
  String? cameraSau;
  String? pin;
  String? ram;
  String? anh;
  String? ngaynhap;
  String? cpu;
  String? bonho;
  String? manhinh;
  String? maloai;
  bool? baohanh;

  MobileModel(
      {this.id,
        this.ten,
        this.giaBan,
        this.giaNhap,
        this.soluong,
        this.mausac,
        this.cameraTruoc,
        this.cameraSau,
        this.pin,
        this.ram,
        this.anh,
        this.ngaynhap,
        this.cpu,
        this.bonho,
        this.manhinh,
        this.maloai,
        this.baohanh});

  MobileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    giaBan = json['giaBan'];
    giaNhap = json['giaNhap'];
    soluong = json['soluong'];
    mausac = json['mausac'];
    cameraTruoc = json['cameraTruoc'];
    cameraSau = json['cameraSau'];
    pin = json['pin'];
    ram = json['ram'];
    anh = json['anh'];
    ngaynhap = json['ngaynhap'];
    cpu = json['cpu'];
    bonho = json['bonho'];
    manhinh = json['manhinh'];
    maloai = json['maloai'];
    baohanh = json['baohanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten'] = this.ten;
    data['giaBan'] = this.giaBan;
    data['giaNhap'] = this.giaNhap;
    data['soluong'] = this.soluong;
    data['mausac'] = this.mausac;
    data['cameraTruoc'] = this.cameraTruoc;
    data['cameraSau'] = this.cameraSau;
    data['pin'] = this.pin;
    data['ram'] = this.ram;
    data['anh'] = this.anh;
    data['ngaynhap'] = this.ngaynhap;
    data['cpu'] = this.cpu;
    data['bonho'] = this.bonho;
    data['manhinh'] = this.manhinh;
    data['maloai'] = this.maloai;
    data['baohanh'] = this.baohanh;
    return data;
  }
}