class LopHoc{
  String _makhoa;
  String _maMH;
  String _tenMH;
  String _anh;
  String _maNhom;
  int _slHocVien;

  LopHoc(this._makhoa,this._maMH,this._tenMH,this._slHocVien,this._anh,this._maNhom);
  String get maKhoa => _makhoa;
  String get maNhom => _maNhom;
  String get maMH => _maMH;
  String get anh => _anh;
  String get tenMH => _tenMH;
  int get slHocVien => _slHocVien;

}

List<LopHoc> ls = [
  // LopHoc("2022", "Tin2012", "Chán", 3, "assets/images/IMG_1777.jpg"),
  LopHoc("2021-2022", "Tin4033", "Lập Trình Mobile", 5 ,"assets/images/img_backtoschool.jpg","1"),
  LopHoc("2021-2022", "Tin1113", "Lập Trình Phân Tán", 30 ,"assets/images/img_bookclub.jpg","2"),
  LopHoc("2021-2022", "Tin4011", "Java Nâng cao", 20 ,"assets/images/img_breakfast.jpg","2"),
  LopHoc("2021-2022", "Toan2211", "Vi Tích Phân Hàm 1 Biến", 40 ,"assets/images/img_reachout.jpg","3"),
  LopHoc("2021-2022", "Tin2012", "Kiến Trúc Máy Tính", 20 ,"assets/images/img_read.jpg","3"),

];
