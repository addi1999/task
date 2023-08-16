// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hive/hive.dart';
import 'package:task1/feature/cart/model/cart_model.dart';
import 'package:task1/feature/home/model/home_model.dart';
import 'package:task1/utils/common_snackbar.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/screen_constants.dart';
import '../../../utils/text_styles.dart';
import '../../cart/cart_controller.dart';

class MainCart extends StatefulWidget {
  const MainCart(
      {super.key,
      required this.text,
      required this.name,
      required this.price,
      required this.discountprice,
      required this.menuid,
      required this.quan,
      required this.amount});
  final String text;
  final String name;
  final String price;
  final String discountprice;
  final int? menuid;
  final int ?quan;
  final int? amount;
  @override
  State<MainCart> createState() => _MainCartState();
}

class _MainCartState extends State<MainCart> {
  CartController cartController = Get.put(CartController());
  
  Datum? data;
  // MenuController menuController = Get.find();
    final cartBox=Hive.box("cart");


  int iscounter = 0;
  void incrementCounter() {
    iscounter++;
  }

  void decrementCounter() {
    iscounter--;
  }
  Future<void> savecart(int? amounts)async{
    // final cartBox=Hive.box("cart");
    final carts=Carts(
      menuId: widget.menuid,
      quantity: iscounter,
      menuPrice:amounts,
      );
    await cartBox.add(carts);
    CustomSnackBar().snackbarSuccess (message: 'Invoice saved successfully.');


}


  @override
  Widget build(BuildContext context) {
  int amounts = iscounter * widget.amount!; 

    return SizedBox(
      height: ScreenConstant.size200,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment:
          //     MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CommonColors.colorOrangeShade4,
                  image: const DecorationImage(
                      scale: 0.1,
                      image: AssetImage(
                        'assets/image/saesalt.jpeg',
                      ))),
              height: ScreenConstant.size120,
              width: ScreenConstant.size200,
              // child: Image.asset('assets/image/seasalt.jpeg'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenConstant.size8),
              child: Text(
                widget.text,
                style: TextStyles.textStyleRegular12
                    .copyWith(color: CommonColors.colorGreyShade14),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: ScreenConstant.size10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenConstant.size8),
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/veg.png",
                    scale: 6,
                  ),
                  SizedBox(
                    width: ScreenConstant.size10,
                  ),
                  Text(
                    widget.name,
                    style: TextStyles.textStyleBold14,
                    overflow: TextOverflow.ellipsis,
                    // maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenConstant.size10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.discountprice != 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.size8),
                        child: Text("₹${widget.price}"))
                    : Text.rich(TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '₹${widget.price}',
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(
                            text: '₹${widget.discountprice}',
                          ),
                        ],
                      )),
                // iscounter == 0
                // cartController.addtocartModel.value.cart?.menuId == data?.id?
                 iscounter == 0?
                    InkWell(
                        onTap: () {
                          setState(() {
                            incrementCounter();
                          });
                        },
                        child: Card(
                          color: CommonColors.colorOrangeShade1,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ScreenConstant.size8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenConstant.size6,
                                horizontal: ScreenConstant.size26),
                            child: Text(
                              "ADD",
                              style: TextStyles.textStyleBold16.copyWith(
                                  color: CommonColors.colorWhiteShade1),
                            ),
                          ),
                        ),
                      )
                    : Card(
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
                                '$iscounter',
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
                      InkWell(
                        onTap:(){
                          setState(() {
                            savecart(amounts);
                            
                          });
                        } ,
                        child: const Text("add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
