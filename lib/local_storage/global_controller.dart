import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GlobalController {
  static RxList orderList = [].obs;
  static RxList startersList = [
    {"name": "Chicken 65"},
    {"name": "Mutton fry"},
  ].obs;
  static RxList mainDishList = [
    {"name": "Chicken Biriyani"},
    {"name": "Mutton Biriyani"},
  ].obs;
  static RxList gravyList = [
    {"name": "Chicken Masala"},
    {"name": "Mutton Masala"},
  ].obs;

  factory GlobalController() {
    init();
    _this = GlobalController._();

    return _this;
  }
  static late GlobalController _this;
  GlobalController._();
  static init() async {}
}
