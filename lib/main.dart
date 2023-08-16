import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task1/feature/cart/view/cart_view.dart';
import 'package:task1/feature/home/view/home.dart';
import 'package:task1/utils/common_font.dart';

import 'feature/cart/model/cart_model.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CartsAdapter(),);
  await Hive.openBox('cart');

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: CommonFonts.interFont,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes:{
        "/":(context) => const HomePage(),
        "/cart":(context) => const CartView(),
      } 
    );
  }
}

