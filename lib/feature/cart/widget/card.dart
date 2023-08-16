// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/screen_constants.dart';
import '../../../utils/text_styles.dart';
import '../cart_controller.dart';

class CartCard extends StatefulWidget {
  CartCard(
      {super.key,
      required this.index,
      required this.name,
      required this.price});
  int index;
  String name;
  int? price;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  CartController cartController = Get.put(CartController());

  int iscounter = 0;

  // int? iscounter = cartController.cartshowModel.value.data?[index].quantity ;
  void incrementCounter() {
    if (iscounter == -1 || iscounter <= 4) {
      iscounter++;
    }
  }

  int getTotalItemCount(int counter) {
    int count = counter;

    count += (cartController.cartshowModel.value.data?[0].quantity ?? 0);

    return count;
  }

  void decrementCounter() {
    if (iscounter >= 1) {
      iscounter--;
    }
  }

  @override
  Widget build(BuildContext context) {
    var price = (widget.price!) * iscounter;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenConstant.size20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ScreenConstant.size170,
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/veg.png",
                    scale: ScreenConstant.size4,
                  ),
                  SizedBox(
                    width: ScreenConstant.size10,
                  ),
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textStyleBold14,
                  )
                ],
              ),
            ),
            SizedBox(
              width: ScreenConstant.size10,
            ),
            // CounterUpdateWidget(updateCounter: checkIndex,),
            SizedBox(
              width: ScreenConstant.size120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    color: CommonColors.colorOrangeShade1,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenConstant.size8)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenConstant.size4,
                          horizontal: ScreenConstant.size10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                cartController.removeupdateCart(cartController
                                    .cartshowModel
                                    .value
                                    .data?[widget.index]
                                    .id);
                                decrementCounter();
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: CommonColors.colorWhiteShade1,
                            ),
                          ),
                          SizedBox(
                            width: ScreenConstant.size8,
                          ),
                          Text(
                            // '${menus?[index].quantity}',
                            getTotalItemCount(iscounter).toString(),
                            style: const TextStyle(
                              // fontSize: 3,
                              fontWeight: FontWeight.bold,
                              color: CommonColors.colorWhiteShade1,
                            ),
                          ),
                          SizedBox(
                            width: ScreenConstant.size8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                cartController.addupdateCart(cartController
                                    .cartshowModel
                                    .value
                                    .data?[widget.index]
                                    .id);
                                incrementCounter();
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: CommonColors.colorWhiteShade1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ScreenConstant.size40,
              child:
                  iscounter == 0 ? Text("₹${widget.price}") : Text("₹$price"),
            ),
          ],
        ),
      ),
    );
  }
}
