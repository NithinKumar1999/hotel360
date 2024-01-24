import 'package:get/get.dart';
import 'package:hotel_app/pages/chef_view/chef_view.controller.dart';

class ChefPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChefViewController());
  }
}
