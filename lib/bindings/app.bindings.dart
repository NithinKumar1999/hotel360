import 'package:get/get.dart';
import 'package:hotel_app/pages/chef_view/chef_view.controller.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.controller.dart';
import 'package:hotel_app/pages/home_page/home_page.controller.dart';
import 'package:hotel_app/pages/login_page/login_page.controller.dart';

class AppGlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
    Get.lazyPut(() => DashBoardPageController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => ChefViewController());
  }
}
