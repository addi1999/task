// To parse this JSON data, do
//
//     final cartstotalModel = cartstotalModelFromJson(jsonString);

import 'dart:convert';

CartstotalModel cartstotalModelFromJson(String str) => CartstotalModel.fromJson(json.decode(str));

String cartstotalModelToJson(CartstotalModel data) => json.encode(data.toJson());

class CartstotalModel {
    Data? data;
    String ?message;
    dynamic coupon;

    CartstotalModel({
         this.data,
        this.message,
        this.coupon,
    });

    factory CartstotalModel.fromJson(Map<String, dynamic> json) => CartstotalModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        coupon: json["coupon"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "coupon": coupon,
    };
}

class Data {
    int id;
    int menuId;
    String customerId;
    int partnerId;
    int subAmount;
    int amount;
    int shippingPrice;
    int discount;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.menuId,
        required this.customerId,
        required this.partnerId,
        required this.subAmount,
        required this.amount,
        required this.shippingPrice,
        required this.discount,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        menuId: json["menu_id"],
        customerId: json["customer_id"],
        partnerId: json["partner_id"],
        subAmount: json["sub_amount"],
        amount: json["amount"],
        shippingPrice: json["shipping_price"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu_id": menuId,
        "customer_id": customerId,
        "partner_id": partnerId,
        "sub_amount": subAmount,
        "amount": amount,
        "shipping_price": shippingPrice,
        "discount": discount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
