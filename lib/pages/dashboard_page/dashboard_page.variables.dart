import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin DashBoardPageVariables {
  TextEditingController mainDishName = TextEditingController();
  TextEditingController startersDishName = TextEditingController();
  TextEditingController gravyDishName = TextEditingController();
  RxString selectedMainDish = "".obs;
  RxString selectedStarters = "".obs;
  RxString selectedGravy = "".obs;
}
