import 'dart:convert';

import 'package:hive/hive.dart';
part 'cart_model.g.dart';

CartshowModel cartshowModelFromJson(String str) => CartshowModel.fromJson(json.decode(str));

String cartshowModelToJson(CartshowModel data) => json.encode(data.toJson());
@HiveType(typeId: 0)
class CartshowModel extends HiveObject{
    List<Carts>? data;

    CartshowModel({
        this.data,
    });

    factory CartshowModel.fromJson(Map<String, dynamic> json) => CartshowModel(
        data: List<Carts>.from(json["data"].map((x) => Carts.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}
@HiveType(typeId: 1)

class Carts  extends HiveObject{
  @HiveField(0)
    int? id;
  @HiveField(1)
    int? menuId;
  @HiveField(2)
    String? customerId;
  @HiveField(3)
    int? partnerId;
  @HiveField(4)
    int? quantity;
  @HiveField(5)
    String? menuName;
  @HiveField(6)
    dynamic menuImage;
  @HiveField(7)
    int? menuPrice;
  @HiveField(8)
    String? uploadedFrom;
  @HiveField(9)
    String? size;
  @HiveField(10)
    DateTime? createdAt;
  @HiveField(11)
    DateTime? updatedAt;
  @HiveField(12)
    String? hotelName;

    Carts({
         this.id,
         this.menuId,
         this.customerId,
         this.partnerId,
         this.quantity,
         this.menuName,
        this.menuImage,
         this.menuPrice,
         this.uploadedFrom,
         this.size,
         this.createdAt,
         this.updatedAt,
         this.hotelName,
    });

    factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        id: json["id"],
        menuId: json["menu_id"],
        customerId: json["customer_id"],
        partnerId: json["partner_id"],
        quantity: json["quantity"],
        menuName: json["menu_name"],
        menuImage: json["menu_image"],
        menuPrice: json["menu_price"],
        uploadedFrom: json["uploaded_from"],
        size: json["size"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        hotelName: json["hotel_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu_id": menuId,
        "customer_id": customerId,
        "partner_id": partnerId,
        "quantity": quantity,
        "menu_name": menuName,
        "menu_image": menuImage,
        "menu_price": menuPrice,
        "uploaded_from": uploadedFrom,
        "size": size,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "hotel_name": hotelName,
    };
}
