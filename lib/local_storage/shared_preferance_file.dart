import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferance {
  SharedPreferance._();
  static SharedPreferences? preferance;

  setString({required String keyName, required value}) async {
    preferance = preferance ?? (await SharedPreferences.getInstance());
    await preferance!.setString(keyName, value);
  }

  getString({required String keyName}) async {
    preferance = preferance ?? (await SharedPreferences.getInstance());
    return preferance!.getString(keyName);
  }

  static Future<void> setListString(listValue, {required keyName}) async {
    preferance = preferance ?? (await SharedPreferences.getInstance());
    await preferance!.setStringList(keyName, listValue);
  }

  Future<List<String>?> getListString({required String keyName}) async {
    preferance = preferance ?? (await SharedPreferences.getInstance());
    return preferance!.getStringList(keyName);
  }

  clearSharedPreferance() async {
    preferance = preferance ?? (await SharedPreferences.getInstance());
    return preferance!.clear();
  }
}
