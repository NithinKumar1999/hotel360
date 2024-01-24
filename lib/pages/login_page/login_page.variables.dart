import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoginPageVariables {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLogin = true.obs;
  RxBool isAdmin = false.obs;
  RxBool isValiEmail = false.obs;
}
