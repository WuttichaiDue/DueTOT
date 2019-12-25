class ProductModel {
  String id;
  String product;
  String detail;
  String path;
  String post;
  String code;

  ProductModel(
      {this.id, this.product, this.detail, this.path, this.post, this.code});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['Product'];
    detail = json['Detail'];
    path = json['Path'];
    post = json['Post'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Product'] = this.product;
    data['Detail'] = this.detail;
    data['Path'] = this.path;
    data['Post'] = this.post;
    data['Code'] = this.code;
    return data;
  }
}
