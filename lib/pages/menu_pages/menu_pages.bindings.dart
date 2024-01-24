import 'package:get/get.dart';
import 'package:hotel_app/pages/menu_pages/menu_pages.controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuPageController());
  }
}
