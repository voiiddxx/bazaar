import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String confirmpassword;
  final String type;
  final String token;
  final List<dynamic> cart;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmpassword,
    required this.type,
    required this.token,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'confirmpassword': confirmpassword,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] as String,
        username: map['username'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        confirmpassword: map['confirmpassword'] as String,
        type: map['type'] as String,
        token: map['token'] as String,
        cart: List<Map<String, dynamic>>.from(
            map['cart']?.map((x) => Map<String, dynamic>.from(x))));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? confirmpassword,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}
