import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/screen_constants.dart';
import '../../../utils/text_styles.dart';
import '../../cart/cart_controller.dart';
import '../../cart/model/cart_model.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  final CartController cartController = Get.put(CartController());
  

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box("cart");
    final cart = cartBox.getAt(0) as Carts;
    final int? id= cart.menuId ;
    final int? quan=  cart.quantity;
    final int? price= cart.menuPrice;
    return SafeArea(
      child: Container(
          color: CommonColors.colorGreenShade1,
          padding: EdgeInsets.symmetric(
              vertical: ScreenConstant.size16,
              horizontal: ScreenConstant.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "1 items | Mumbai Millionaires ",

                "${getTotalItemCount()} items | ${cartController.cartstotalModel.value.data?.amount}",
                style: TextStyles.textStyleSemiBold18
                    .apply(color: CommonColors.colorWhiteShade1),
              ),
              InkWell(
                onTap: () {
                  
                  cartController.addToCart(
                    id,quan,price
                  );
                  // CustomSnackBar()
                  //     .snackbarSuccess(message: "Item is added in cart");
                  
                  Get.toNamed("/cart");
                  cartController.totalCart();
                  
                },
                child: Row(
                  children: [
                    Text(
                      "View Cart",
                      style: TextStyles.textStyleSemiBold18
                          .apply(color: CommonColors.colorWhiteShade1),
                    ),
                    SizedBox(width: ScreenConstant.size8),
                    const Icon(Icons.shopping_cart_outlined,
                        color: CommonColors.colorWhiteShade1)
                  ],
                ),
              ),
            ],
          )),
    );
  }

  int getTotalItemCount() {
    int count = 0;

    count += (cartController.cartshowModel.value.data?[0].quantity ?? 0);

    return count;
  }
}
