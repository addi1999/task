// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:task1/feature/cart/cart_controller.dart';
import 'package:task1/utils/common_colors.dart';
import 'package:task1/utils/screen_constants.dart';
import 'package:task1/utils/text_styles.dart';

import '../widget/billdetail.dart';
import '../widget/card.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    // menuController.init();
    cartController.init();
  }

  @override
  Widget build(BuildContext context) {
    // var a = iscounter * 75;
    // var b = (iscounter * 75) * 5 / 100;
    // var c = (iscounter * 75) * 10 / 100;
    // var d = a + b + c;
    var carttotal = cartController.cartstotalModel.value.data;
    int carttotal1= carttotal!.amount + 00;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Cart",
          style: TextStyles.textStyleBold20,
        )),
        // actions: const [BackButton()],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.size20,
              vertical: ScreenConstant.size10),
          child: SizedBox(
            height: ScreenConstant.size70,
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.size20,
                    vertical: ScreenConstant.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "₹$carttotal1",
                          // "",
                          style: TextStyles.textStyleBold16,
                        ),
                        const Text("View Detailed Bill")
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cartController.openPaymentPortal(carttotal.amount);
                      },
                      child: Card(
                        color: CommonColors.colorRedShade1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.size30,
                              vertical: ScreenConstant.size10),
                          child: Text(
                            "Continue",
                            style: TextStyles.textStyleMedium12
                                .copyWith(color: CommonColors.colorWhiteShade1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: ScreenConstant.size14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery address",
                            style: TextStyles.textStyleBold18,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Distance:",
                              children: [
                                TextSpan(
                                  text: "2.7 Km",
                                  style: TextStyles.textStyleBold14.copyWith(
                                    color: CommonColors.colorRedShade1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.size10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // const Icon(Icons.home_outlined),
                                  Text(
                                    "Addi home".toUpperCase(),
                                    style: TextStyles.textStyleBold14,
                                  ),
                                ],
                              ),
                              const Text("weft,Mumbai,Maharashtra")
                            ],
                          ),
                          const Icon(Icons.arrow_drop_down_circle_outlined)
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.size10,
                      ),
                      Dash(
                        length: MediaQuery.of(context).size.width * 0.9,
                        dashColor: CommonColors.colorGreyShade13,
                      ),
                      SizedBox(
                        height: ScreenConstant.size20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            cartController.cartshowModel.value.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var menus = cartController.cartshowModel.value.data;
                          return SizedBox(
                            height: ScreenConstant.size60,
                            child:
                                // menus?[index].quantity == 0
                                //     ? SizedBox(
                                //         height: ScreenConstant.size0,
                                //       )
                                //     :
                                CartCard(
                              index: index,
                              price: menus?[index].menuPrice,
                              name: '${menus?[index].menuName}',
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: ScreenConstant.size20,
                      ),
                      Text(
                        "Offers",
                        style: TextStyles.textStyleBold18,
                      ),
                      SizedBox(
                        height: ScreenConstant.size20,
                      ),
                      SizedBox(
                        height: ScreenConstant.size60,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.size20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Apply Coupon",
                                  style: TextStyles.textStyleMedium14,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenConstant.size20,
                      ),
                      Text(
                        "Bill Details",
                        style: TextStyles.textStyleBold18,
                      ),
                      SizedBox(
                        height: ScreenConstant.size20,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.size20,
                              vertical: ScreenConstant.size10),
                          child: Column(
                            children: [
                              Billdetail(
                                text2: "${carttotal.subAmount}",
                                text: "Item Total",
                              ),
                              SizedBox(
                                height: ScreenConstant.size6,
                              ),
                              Billdetail(
                                text2: "${carttotal.shippingPrice}",
                                text: "Delivery Charge",
                              ),
                              SizedBox(
                                height: ScreenConstant.size6,
                              ),
                              Billdetail(
                                text2: "0",
                                text: "Gst(5%)",
                              ),
                              SizedBox(
                                height: ScreenConstant.size6,
                              ),
                              Billdetail(
                                text2: "${carttotal.discount}",
                                text: "Discount",
                              ),
                              SizedBox(
                                height: ScreenConstant.size6,
                              ),
                              Dash(
                                length:
                                    MediaQuery.of(context).size.width * 0.79,
                                dashColor: CommonColors.colorGreyShade13,
                              ),
                              SizedBox(
                                height: ScreenConstant.size6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyles.textStyleBold16,
                                  ),
                                  Text(
                                    "₹${carttotal.amount}",
                                    style: TextStyles.textStyleBold16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
