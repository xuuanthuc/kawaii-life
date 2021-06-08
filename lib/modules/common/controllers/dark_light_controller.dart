import 'package:get/get.dart';

class DarkLightController extends GetxController{
  RxBool isDarkMode = false.obs;
  RxBool isLightMode = true.obs;
  List<RxBool> isSelect = [true.obs, false.obs];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLightMode.value = true;
  }
}