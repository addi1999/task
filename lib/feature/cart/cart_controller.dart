import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task1/feature/cart/cart_service.dart';
import 'package:task1/feature/cart/model/add_to_cart_model.dart';
import 'package:task1/feature/cart/model/cart_model.dart';
import 'package:task1/feature/cart/model/cart_total_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../utils/common_snackbar.dart';

class CartController extends GetxController {
  Rx<CartshowModel> cartshowModel = CartshowModel().obs;
  RxBool isCartLoading = false.obs;
  RxBool istotalLoading = false.obs;
  RxBool isAddCartLoading = false.obs;
  RxBool isUpdateCartLoading = false.obs;
  Rx<CartstotalModel>cartstotalModel=CartstotalModel().obs;
  Rx<AddtocartModel>addtocartModel=AddtocartModel().obs;
  RxList totallist =<CartstotalModel>[].obs;
  Razorpay? _razorpay;


  RxList<RxBool> isSelectedIndex = <RxBool>[].obs;
  RxInt? totalQty = 0.obs;



 init(){
    fetchCart();
    totalCart();
    _razorpay =Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    CustomSnackBar().snackbarSuccess(
        message: "SUCCESS PAYMENT: ${response.paymentId}",);
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    CustomSnackBar().errorSnackBar(
        message: "ERROR HERE: ${response.code} - ${response.message}",
        );
  }
  void _handleExternalWallet(ExternalWalletResponse response) {
    CustomSnackBar().snackbarSuccess(
        message: "EXTERNAL_WALLET IS : ${response.walletName}",
        );
  }
  Future<void> fetchCart({bool? isShowLoading = true}) async {
    try {
      if (isShowLoading == true) {
        isCartLoading.value = true;
      }

      var data = await CartService().fetchCart();
      if (data != null) {
        cartshowModel.value = data;
        isSelectedIndex =
            RxList.filled(cartshowModel.value.data!.length, false.obs);
        totalQty = 0.obs;
        for (var element in cartshowModel.value.data!) {
          totalQty!.value = totalQty!.value + element.quantity!;
        }
      } else {
        CustomSnackBar().errorSnackBar(message: "Unable to fetch cart");
      }
      isCartLoading.value = false;
    } catch (error) {
      isCartLoading.value = false;
      log(error.toString());
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }

  void addToCart(int? menid, int? qun, int? amount) async {
    try {
      isAddCartLoading.value = true;

      var data = await CartService().addCart(amount: amount,qun: qun,menid: menid);
    
      if (data != null ) {
        fetchCart();
      } else {
        CustomSnackBar().errorSnackBar(message: "Unable to add cart");
      }
      isAddCartLoading.value = false;
      // }
    } catch (error) {
      isAddCartLoading.value = false;
      log('$error');
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }
  
  void addupdateCart( int? cartId) async {
    try {
      isUpdateCartLoading.value = true;

      var data = await CartService().addupdateCart(cartid:cartId
      );
      if (data != null && data) {
        fetchCart(isShowLoading: false);
      } else {
        isUpdateCartLoading.value = false;
        CustomSnackBar().errorSnackBar(message: "Unable to cart Update");
      }
      isUpdateCartLoading.value = false;
      // }
    } catch (error) {
      isUpdateCartLoading.value = false;
      log(error.toString());
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }  
  
  void removeupdateCart( int? cartId) async {
    try {
      isUpdateCartLoading.value = true;

      var data = await CartService().removeupdateCart(cartid:cartId
      );
      if (data != null ) {
        fetchCart(isShowLoading: false);
      } else {
        isUpdateCartLoading.value = false;
        CustomSnackBar().errorSnackBar(message: "Unable to cart Update");
      }
      isUpdateCartLoading.value = false;
      // }
    } catch (error) {
      isUpdateCartLoading.value = false;
      log(error.toString());
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }
  Future<void> totalCart() async {
    try {
      istotalLoading.value = true;

      var data = await CartService().totalCart();
    
      if (data != null ) {
        cartstotalModel.value = data;
      } else {
        CustomSnackBar().errorSnackBar(message: "Unable to cart");
      }
      istotalLoading.value = false;
      // }
    } catch (error) {
      istotalLoading.value = false;
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }

  Future<void> openPaymentPortal(int? amount)async{
    var options = {
      'key':'rzp_test_H0sSU3vG0Xa6FL',
      'amount':amount,
      'description':'Payment',
      'prefill':{ 'cotact':'9699967929','email':'asad@gmail.com'},
      'external':{
        'wallets':['paytm']
      }
    };
    try{
      _razorpay?.open(options);
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
}
