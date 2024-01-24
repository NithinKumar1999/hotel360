// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel_app/local_storage/global_controller.dart';
import 'package:hotel_app/pages/menu_pages/menu_pages.variables.dart';

class MenuPageController extends GetxController
    with MenuPageControllerVariables {
  onTapSave(context) {
    Map<String, String> data = {
      "name": nameController.text,
      "category": selectedCategory.value
    };
    switch (data["category"]) {
      case 'Main Dish':
        GlobalController.mainDishList.add(data);
        break;
      case "Starters":
        GlobalController.startersList.add(data);
        break;
      case "Gravy":
        GlobalController.gravyList.add(data);
        break;
      default:
    }
    nameController.clear();
    selectedCategory.value = "";
    Navigator.pop(context);
  }

  onTapDelete(data, categoryList) {
    categoryList.remove(data);
    GlobalController.mainDishList.refresh();
    GlobalController.startersList.refresh();
    GlobalController.gravyList.refresh();
  }
}
