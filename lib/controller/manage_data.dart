import 'package:shared_preferences/shared_preferences.dart';

class DataController {
  Future<String> getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('data') ?? "[]";
    return data;
  }

  Future<bool> putdata(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", data);
    return true;
  }
}
