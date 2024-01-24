import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/local_storage/global_controller.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.variables.dart';

class DashBoardPageController extends GetxController
    with DashBoardPageVariables {
  @override
  void onInit() {
    super.onInit();
  }

  save(context, intialData) {
    if (intialData != null) {
      var existData = GlobalController.orderList
          .firstWhere((element) => element['id'] == intialData['id']);
      existData['Main_dish'] = selectedMainDish.value;
      existData['Starters'] = selectedStarters.value;
      existData['gravy'] = selectedGravy.value;
      selectedMainDish.value = "";
      selectedStarters.value = "";
      selectedGravy.value = "";
      Navigator.pop(context);
      GlobalController.orderList.refresh();
    } else {
      if (selectedMainDish.value != "" &&
          selectedStarters.value != "" &&
          selectedGravy.value != "") {
        GlobalController.orderList.add({
          "id": generateRandomId(),
          "Main_dish": selectedMainDish.value,
          "Starters": selectedStarters.value,
          "gravy": selectedGravy.value,
          "assigned": false
        });
        selectedMainDish.value = "";
        selectedStarters.value = "";
        selectedGravy.value = "";
        Navigator.pop(context);
        GlobalController.orderList.refresh();
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill all the fields')));
      }
    }
  }

  String generateRandomId() {
    Random random = Random();
    const int idLength = 8;
    String randomId = '';
    for (int i = 0; i < idLength; i++) {
      int randomDigit =
          random.nextInt(10); // Generates a random digit between 0 and 9
      randomId += randomDigit.toString();
    }

    return randomId;
  }
}
