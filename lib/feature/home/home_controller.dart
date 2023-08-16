// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task1/feature/home/home_service.dart';
import 'package:task1/feature/home/model/home_model.dart';
import 'package:task1/utils/common_snackbar.dart';

class MenusController extends GetxController{
      
  RxBool isMenuLoading = false.obs;
  Rx<Menus> menumodel =Menus().obs;
  RxBool isVegOn = false.obs;
  RxBool isNonvegOn = false.obs;


  init(){
    menudetails();
  }
  
  void menudetails() async{
    try{
      isMenuLoading.value = true;
      var data = await HomeService().fetchmenu(
        params: {
          'customer_id': '1',
          'hotel_id':'2',
        }
      );
      if(data != null){
        menumodel.value = data;
      }
      else{
        CustomSnackBar().errorSnackBar(message: "unable to fetch menu");

      }
      isMenuLoading.value = false;
    }catch(error){
      isMenuLoading.value= false;
      CustomSnackBar().errorSnackBar(message: error.toString());
    }
  }
  void toggleVegInMenu() {
    if (isVegOn.value) {
      menumodel.value.data
          ?.removeWhere((element) => element.foodType != "veg");
      menumodel.value.data?.forEach((element) {
        element.foodType;
      });
    }
  }
    void toggleNonVegInMenu() {
    if (isNonvegOn.value) {
      menumodel.value.data
          ?.removeWhere((element) => element.foodType == "veg");
      menumodel.value.data?.forEach((element) {
        element.foodType;
      });
    } 
    }
}