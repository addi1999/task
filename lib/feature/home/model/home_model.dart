// ignore_for_file: constant_identifier_names

import 'dart:convert';

Menus menusFromJson(String str) => Menus.fromJson(json.decode(str));

String menusToJson(Menus data) => json.encode(data.toJson());

class Menus {
    List<Datum>? data;

    Menus({
        this.data,
    });

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String description;
    int partnerId;
    PartnerName partnerName;
    HotelName hotelName;
    int foodCategoryId;
    FoodCategoryName foodCategoryName;
    FoodType foodType;
    SizeType sizeType;
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
    String? image;
    Status status;
    int numberOfOrder;
    int rating;
    UploadedFrom uploadedFrom;
    DateTime createdAt;
    DateTime updatedAt;
    int? cartQuantity;
    int? cartId;

    Datum({
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
        this.cartQuantity,
        this.cartId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        partnerId: json["partner_id"],
        partnerName: partnerNameValues.map[json["partner_name"]]!,
        hotelName: hotelNameValues.map[json["hotel_name"]]!,
        foodCategoryId: json["food_category_id"],
        foodCategoryName: foodCategoryNameValues.map[json["food_category_name"]]!,
        foodType: foodTypeValues.map[json["food_type"]]!,
        sizeType: sizeTypeValues.map[json["size_type"]]!,
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
        status: statusValues.map[json["status"]]!,
        numberOfOrder: json["number_of_order"],
        rating: json["rating"],
        uploadedFrom: uploadedFromValues.map[json["uploaded_from"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cartQuantity: json["cart_quantity"],
        cartId: json["cart_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "partner_id": partnerId,
        "partner_name": partnerNameValues.reverse[partnerName],
        "hotel_name": hotelNameValues.reverse[hotelName],
        "food_category_id": foodCategoryId,
        "food_category_name": foodCategoryNameValues.reverse[foodCategoryName],
        "food_type": foodTypeValues.reverse[foodType],
        "size_type": sizeTypeValues.reverse[sizeType],
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
        "status": statusValues.reverse[status],
        "number_of_order": numberOfOrder,
        "rating": rating,
        "uploaded_from": uploadedFromValues.reverse[uploadedFrom],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cart_quantity": cartQuantity,
        "cart_id": cartId,
    };
}

enum FoodCategoryName {
    DEMO_NAME,
    FRENCH_FRIES,
    STARTER
}

final foodCategoryNameValues = EnumValues({
    "Demo Name": FoodCategoryName.DEMO_NAME,
    "French Fries": FoodCategoryName.FRENCH_FRIES,
    "Starter": FoodCategoryName.STARTER
});

enum FoodType {
    NON_VEG,
    VEG
}

final foodTypeValues = EnumValues({
    "Non-veg": FoodType.NON_VEG,
    "Veg": FoodType.VEG
});

enum HotelName {
    NEW_HOTEL
}

final hotelNameValues = EnumValues({
    "New Hotel": HotelName.NEW_HOTEL
});

enum PartnerName {
    HOTEL
}

final partnerNameValues = EnumValues({
    "Hotel": PartnerName.HOTEL
});

enum SizeType {
    STANDARD
}

final sizeTypeValues = EnumValues({
    "Standard": SizeType.STANDARD
});

enum Status {
    ACTIVE,
    INACTIVE
}

final statusValues = EnumValues({
    "Active": Status.ACTIVE,
    "Inactive": Status.INACTIVE
});

enum UploadedFrom {
    ADMIN,
    MOBILE
}

final uploadedFromValues = EnumValues({
    "Admin": UploadedFrom.ADMIN,
    "Mobile": UploadedFrom.MOBILE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}