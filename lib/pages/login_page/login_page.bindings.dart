import 'package:get/get.dart';
import 'package:hotel_app/pages/login_page/login_page.controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
