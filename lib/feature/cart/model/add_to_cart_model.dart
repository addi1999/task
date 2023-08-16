// To parse this JSON data, do
//
//     final addtocartModel = addtocartModelFromJson(jsonString);

import 'dart:convert';

AddtocartModel addtocartModelFromJson(String str) => AddtocartModel.fromJson(json.decode(str));

String addtocartModelToJson(AddtocartModel data) => json.encode(data.toJson());

class AddtocartModel {
    String? message;
    MenuData? menuData;
    Cart? cart;

    AddtocartModel({
        this.message,
        this.menuData,
        this.cart,
    });

    factory AddtocartModel.fromJson(Map<String, dynamic> json) => AddtocartModel(
        message: json["message"],
        menuData: MenuData.fromJson(json["menu_data"]),
        cart: Cart.fromJson(json["cart"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "menu_data": menuData!.toJson(),
        "cart": cart!.toJson(),
    };
}

class Cart {
    String customerId;
    String menuId;
    String partnerId;
    String quantity;
    String menuName;
    dynamic menuImage;
    String uploadedFrom;
    String size;
    String menuPrice;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Cart({
        required this.customerId,
        required this.menuId,
        required this.partnerId,
        required this.quantity,
        required this.menuName,
        this.menuImage,
        required this.uploadedFrom,
        required this.size,
        required this.menuPrice,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        customerId: json["customer_id"],
        menuId: json["menu_id"],
        partnerId: json["partner_id"],
        quantity: json["quantity"],
        menuName: json["menu_name"],
        menuImage: json["menu_image"],
        uploadedFrom: json["uploaded_from"],
        size: json["size"],
        menuPrice: json["menu_price"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "menu_id": menuId,
        "partner_id": partnerId,
        "quantity": quantity,
        "menu_name": menuName,
        "menu_image": menuImage,
        "uploaded_from": uploadedFrom,
        "size": size,
        "menu_price": menuPrice,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}

class MenuData {
    int id;
    String name;
    String description;
    int partnerId;
    String partnerName;
    String hotelName;
    int foodCategoryId;
    String foodCategoryName;
    String foodType;
    String sizeType;
    int originalPrice;
    int discountedPrice;
    int regularOriginalPrice;
    int regularDiscountedPrice;
    int mediumOriginalPrice;
    int mediumDiscountedPrice;
    int largeOriginalPrice;
    int largeDiscountedPrice;
    int originalPriceAfterCommission;
    int discountedPriceAfterCommission;
    dynamic image;
    String status;
    int numberOfOrder;
    int rating;
    String uploadedFrom;
    DateTime createdAt;
    DateTime updatedAt;

    MenuData({
        required this.id,
        required this.name,
        required this.description,
        required this.partnerId,
        required this.partnerName,
        required this.hotelName,
        required this.foodCategoryId,
        required this.foodCategoryName,
        required this.foodType,
        required this.sizeType,
        required this.originalPrice,
        required this.discountedPrice,
        required this.regularOriginalPrice,
        required this.regularDiscountedPrice,
        required this.mediumOriginalPrice,
        required this.mediumDiscountedPrice,
        required this.largeOriginalPrice,
        required this.largeDiscountedPrice,
        required this.originalPriceAfterCommission,
        required this.discountedPriceAfterCommission,
        this.image,
        required this.status,
        required this.numberOfOrder,
        required this.rating,
        required this.uploadedFrom,
        required this.createdAt,
        required this.updatedAt,
    });

    factory MenuData.fromJson(Map<String, dynamic> json) => MenuData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        partnerId: json["partner_id"],
        partnerName: json["partner_name"],
        hotelName: json["hotel_name"],
        foodCategoryId: json["food_category_id"],
        foodCategoryName: json["food_category_name"],
        foodType: json["food_type"],
        sizeType: json["size_type"],
        originalPrice: json["original_price"],
        discountedPrice: json["discounted_price"],
        regularOriginalPrice: json["regular_original_price"],
        regularDiscountedPrice: json["regular_discounted_price"],
        mediumOriginalPrice: json["medium_original_price"],
        mediumDiscountedPrice: json["medium_discounted_price"],
        largeOriginalPrice: json["large_original_price"],
        largeDiscountedPrice: json["large_discounted_price"],
        originalPriceAfterCommission: json["original_price_after_commission"],
        discountedPriceAfterCommission: json["discounted_price_after_commission"],
        image: json["image"],
        status: json["status"],
        numberOfOrder: json["number_of_order"],
        rating: json["rating"],
        uploadedFrom: json["uploaded_from"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "partner_id": partnerId,
        "partner_name": partnerName,
        "hotel_name": hotelName,
        "food_category_id": foodCategoryId,
        "food_category_name": foodCategoryName,
        "food_type": foodType,
        "size_type": sizeType,
        "original_price": originalPrice,
        "discounted_price": discountedPrice,
        "regular_original_price": regularOriginalPrice,
        "regular_discounted_price": regularDiscountedPrice,
        "medium_original_price": mediumOriginalPrice,
        "medium_discounted_price": mediumDiscountedPrice,
        "large_original_price": largeOriginalPrice,
        "large_discounted_price": largeDiscountedPrice,
        "original_price_after_commission": originalPriceAfterCommission,
        "discounted_price_after_commission": discountedPriceAfterCommission,
        "image": image,
        "status": status,
        "number_of_order": numberOfOrder,
        "rating": rating,
        "uploaded_from": uploadedFrom,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
