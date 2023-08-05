import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String id;
  final String product_name;
  final String product_detail;
  final String product_price;
  final String product_quantity;
  final String product_category;
  final List<String> images;
  Product({
    required this.id,
    required this.product_name,
    required this.product_detail,
    required this.product_price,
    required this.product_quantity,
    required this.product_category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_name': product_name,
      'product_detail': product_detail,
      'product_price': product_price,
      'product_quantity': product_quantity,
      'product_category': product_category,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] as String,
      product_name: map['product_name'] as String,
      product_detail: map['product_detail'] as String,
      product_price: map['product_price'] as String,
      product_quantity: map['product_quantity'] as String,
      product_category: map['product_category'] as String,
      images: List<String>.from(
        (map['images'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
