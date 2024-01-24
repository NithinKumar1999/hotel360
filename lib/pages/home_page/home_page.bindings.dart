import 'package:get/get.dart';
import 'package:hotel_app/pages/home_page/home_page.controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
