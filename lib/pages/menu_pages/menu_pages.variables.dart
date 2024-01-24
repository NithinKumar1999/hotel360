import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MenuPageControllerVariables {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  RxString selectedCategory = "".obs;
}
