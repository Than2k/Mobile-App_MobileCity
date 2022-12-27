class CartModel{
  int _id;
  String _ten;
  String _anh;
  int _gia;
  int _soLuong;
  CartModel(this._id , this._ten , this._anh, this._gia, this._soLuong);

  int get id => this._id;
  String get ten => this._ten;
  String get anh => this._anh;
  int get soLuong => this._soLuong;
  int get gia => this._gia;
  void setSl(int sl){
    this._soLuong =sl;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['soLuong'] = this.soLuong;
    data['gia'] = this.gia;
    return data;
  }

}