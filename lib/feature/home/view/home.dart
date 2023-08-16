// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task1/feature/cart/cart_controller.dart';
// import 'package:task1/feature/cart/model/cart_model.dart';
import 'package:task1/feature/home/home_controller.dart';
import 'package:task1/feature/home/widget/bottom.dart';
import 'package:task1/utils/screen_constants.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/common_logics.dart';
import '../../../utils/custom_switch.dart';
import '../../../utils/text_styles.dart';
import '../widget/main_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MenusController menuController = MenusController();
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    menuController.init();
    cartController.init();
  }

  // Carts? menu_id;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness:
                isDarkTheme(context) ? Brightness.dark : Brightness.light,
            statusBarIconBrightness:
                isDarkTheme(context) ? Brightness.light : Brightness.dark,
            statusBarColor: isDarkTheme(context)
                ? CommonColors.colorBlackShade1
                : CommonColors.colorWhiteShade3,
            systemStatusBarContrastEnforced: true),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Mumbai Millionaires",
            style: TextStyles.textStyleBold20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: cartController.cartshowModel.value.data == null
          ? const SizedBox()
          : const Bottombar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0.7,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.size16,
                    vertical: ScreenConstant.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.home_outlined),
                            Text(
                              "Addi home".toUpperCase(),
                              style: TextStyles.textStyleBold16,
                            ),
                          ],
                        ),
                        const Text("weft,Mumbai,Maharashtra")
                      ],
                    ),
                    const Icon(Icons.arrow_drop_down_circle_outlined)
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.size16,
                  ),
                  child: Row(
                    children: [
                      CustomSwitch(
                        onTap: () {
                          setState(() {
                            menuController.isVegOn.value =
                                !menuController.isVegOn.value;
                            menuController.toggleNonVegInMenu();
                          });
                        },
                        value: menuController.isVegOn.value,
                        color: CommonColors.colorGreenShade1,
                      ),
                      SizedBox(
                        width: ScreenConstant.size10,
                      ),
                      Text(
                        "Veg",
                        style: TextStyles.textStyleSemiBold12.apply(
                            color: isDarkTheme(context)
                                ? CommonColors.colorWhiteShade1
                                : null),
                      ),
                      SizedBox(
                        width: ScreenConstant.size20,
                      ),

                      /// as of now Non-veg status is not present so commented
                      CustomSwitch(
                        onTap: () {
                          setState(() {
                            menuController.isNonvegOn.value =
                                !menuController.isNonvegOn.value;
                            menuController.toggleNonVegInMenu();
                          });
                        },
                        value: menuController.isNonvegOn.value,
                        color: CommonColors.colorOrangeShade2,
                      ),
                      SizedBox(
                        width: ScreenConstant.size10,
                      ),
                      Text(
                        "Non-veg",
                        style: TextStyles.textStyleSemiBold12.apply(
                            color: isDarkTheme(context)
                                ? CommonColors.colorWhiteShade1
                                : null),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenConstant.size30,
            ),
            Obx(
              () {
                return menuController.menumodel.value.data == null
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.size14),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              menuController.menumodel.value.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            var menus = menuController.menumodel.value.data;
                            return MainCart(
                              text: "${menus?[index].description}",
                              name: "${menus?[index].name}",
                              price: '${menus?[index].originalPrice}',
                              discountprice: '${menus?[index].discountedPrice}',
                              amount: menus?[index].originalPrice,
                              quan: menus?[index].cartQuantity,
                              menuid: menus?[index].id,
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: ScreenConstant.size0,
                                  mainAxisSpacing: ScreenConstant.size10,
                                  crossAxisSpacing: ScreenConstant.size8),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );},);
  }
}
