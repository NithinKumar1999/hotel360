import 'package:get/get.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.controller.dart';

class DashboardPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardPageController());
  }
}
