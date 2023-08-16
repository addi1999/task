import 'dart:convert';

import 'package:task1/feature/cart/model/cart_model.dart';
import 'package:task1/feature/cart/model/cart_total_model.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<CartshowModel?> fetchCart({Map<String, dynamic>? params}) async {
    http.Response result = await http.get(Uri.parse(
        "https://mumbaimillionaires.in/mmApi/api/show/cart?customer_id=1"));
    if (result.statusCode == 200) {
      CartshowModel cartshowModel =
          CartshowModel.fromJson(jsonDecode(result.body));
      return cartshowModel;
    }
    return null;
  }

  Future<bool?> addCart({int? menid, int? qun, int? amount}) async {
    http.Response result = await http.post(
      Uri.parse(
        "https://mumbaimillionaires.in/mmApi/api/add/cart?menu_id=$menid&customer_id=1&partner_id=2&quantity=$qun&size=Standard&amount=$amount",
      ),
    );
    if (result.statusCode == 200) {
      return true;
    }
    return null;
  }

  Future<bool?> addupdateCart( {int? cartid} ) async {
     http.Response result =await http.post(
      Uri.parse(
        "https://mumbaimillionaires.in/mmApi/api/add-remove/quantity/cart?cart_id=$cartid&status=add",
        ),
        );
    if (result.statusCode == 200) {
      return true;
    }
    return null;
  }
  Future<bool?> removeupdateCart({int? cartid}) async {
    http.Response result =await http.post(
      Uri.parse(
        "https://mumbaimillionaires.in/mmApi/api/add-remove/quantity/cart?cart_id=$cartid&status=remove",
        ),
        );
    if (result.statusCode == 200) {
      return true;
    }
    return null;
  }

  Future<CartstotalModel?> totalCart() async {
    http.Response result = await http.post(
      Uri.parse(
        'https://mumbaimillionaires.in/mmApi/api/cart/total?customer_id=1',
      ),
    );
    if (result.statusCode == 200) {
      CartstotalModel cartstotalModel =
          CartstotalModel.fromJson(jsonDecode(result.body));
      return cartstotalModel;
    }
    return null;
  }
}
