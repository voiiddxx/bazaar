class Getproduct {
  String? id;
  String? productName;
  String? productDetail;
  String? productPrice;
  String? productQuantity;
  String? productCategory;
  List<String>? images;
  int? v;

  Getproduct(
      {this.id,
      this.productName,
      this.productDetail,
      this.productPrice,
      this.productQuantity,
      this.productCategory,
      this.images,
      this.v});

  Getproduct.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product_name"] is String) {
      productName = json["product_name"];
    }
    if (json["product_detail"] is String) {
      productDetail = json["product_detail"];
    }
    if (json["product_price"] is String) {
      productPrice = json["product_price"];
    }
    if (json["product_quantity"] is String) {
      productQuantity = json["product_quantity"];
    }
    if (json["product_category"] is String) {
      productCategory = json["product_category"];
    }
    if (json["images"] is List) {
      images =
          json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["product_name"] = productName;
    _data["product_detail"] = productDetail;
    _data["product_price"] = productPrice;
    _data["product_quantity"] = productQuantity;
    _data["product_category"] = productCategory;
    if (images != null) {
      _data["images"] = images;
    }
    _data["__v"] = v;
    return _data;
  }
}
