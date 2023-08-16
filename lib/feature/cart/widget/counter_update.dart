// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/common_logics.dart';
import '../../../utils/screen_constants.dart';
import '../../../utils/shadow.dart';
import '../../../utils/text_styles.dart';
import '../../cart/cart_controller.dart';
import '../model/cart_model.dart';

class CounterUpdateWidget extends StatelessWidget {
  CounterUpdateWidget({
    Key? key,
    required this.updateCounter,
  }) : super(key: key);
  // final RestaurantController restaurantController = Get.find();
  final CartController cartController = Get.find();
  List<Carts> updateCounter;

  @override
  Widget build(BuildContext context) {
    var carts = updateCounter[0];

    return Column(
      children: [
        SizedBox(
          width: ScreenConstant.size100,
          child: ShadowWidget(
            shadowColor: CommonColors.colorBlackShade1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: ScreenConstant.size8,
              ),
              width: ScreenConstant.size100,
              decoration: BoxDecoration(
                color: isDarkTheme(context)
                    ? CommonColors.colorBlackShade1
                    : CommonColors.colorWhiteShade1,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(RouteConstants.cartView, arguments: {
                        //   'is_show_appbar': true,
                        //   'restaurant_id':
                        //       restaurantController.restaurantListData.id,
                        // });

                        cartController.removeupdateCart(
                            carts.quantity!- 1,);
                      },
                      child: Icon(
                        Icons.remove,
                        size: ScreenConstant.size16,
                        color: CommonColors.colorGreenShade1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      (/*carts.quantity*/ getCount()).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleBold16
                          .copyWith(color: CommonColors.colorGreenShade1),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        // cartController.updateCart(
                        //     carts.quantity! + 1, carts.menuId, carts.id);
                      },
                      child: Icon(
                        Icons.add,
                        size: ScreenConstant.size16,
                        color: CommonColors.colorGreenShade1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  num getCount() {
    num quantity = 0;
    for (var element in updateCounter) {
      quantity += element.quantity!;
    }
    return quantity;
  }
}
