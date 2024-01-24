// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:hotel_app/local_storage/global_controller.dart';
import 'package:hotel_app/pages/chef_view/chef_view.variables.dart';

class ChefViewController extends GetxController with ChefViewVariables {
  init() {
    fetchAssignedOrders();
  }

  List fetchAssignedOrders() {
    List list = GlobalController.orderList.value
        .where((element) => element['assigned'] == true)
        .toList();
    // assignOrderList.value = GlobalController.orderList.value
    //     .where((element) => element['assigned'] == true)
    //     .toList();
    return list;
  }
}
