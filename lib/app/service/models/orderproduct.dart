class Orderproduct {
  String? id;
  Products? products;
  String? address;
  String? userId;
  int? value;
  int? v;

  Orderproduct(
      {this.id, this.products, this.address, this.userId, this.value, this.v});

  Orderproduct.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["products"] is Map) {
      products =
          json["products"] == null ? null : Products.fromJson(json["products"]);
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["value"] is int) {
      value = json["value"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    if (products != null) {
      _data["products"] = products?.toJson();
    }
    _data["address"] = address;
    _data["userId"] = userId;
    _data["value"] = value;
    _data["__v"] = v;
    return _data;
  }
}

class Products {
  String? productName;
  String? productDetail;
  String? productPrice;
  String? productQuantity;
  String? productCategory;
  List<String>? images;
  String? id;
  int? v;

  Products(
      {this.productName,
      this.productDetail,
      this.productPrice,
      this.productQuantity,
      this.productCategory,
      this.images,
      this.id,
      this.v});

  Products.fromJson(Map<String, dynamic> json) {
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
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["product_name"] = productName;
    _data["product_detail"] = productDetail;
    _data["product_price"] = productPrice;
    _data["product_quantity"] = productQuantity;
    _data["product_category"] = productCategory;
    if (images != null) {
      _data["images"] = images;
    }
    _data["_id"] = id;
    _data["__v"] = v;
    return _data;
  }
}
