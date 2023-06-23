import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static SharedPreferences? sharedPreferences;

  Future intiSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // .......................................................................................................................................................................................Student Local Database Business Function..................................................................

  Future setName(String name) async {
    return await sharedPreferences!.setString("name", name);
  }

  getName() {
    return sharedPreferences!.getString("name");
  }

  Future setEmail(String email) async {
    return await sharedPreferences!.setString("Email", email);
  }

  getEmail() {
    return sharedPreferences!.getString("Email");
  }

  Future setGender(String gender) async {
    return await sharedPreferences!.setString("Gender", gender);
  }

  getGender() {
    return sharedPreferences!.getString("Gender");
  }

  Future setNumber(String num) async {
    return await sharedPreferences!.setString("Number", num);
  }

  getNumber() {
    return sharedPreferences!.getString("Number");
  }

  Future setAge(String age) async {
    return await sharedPreferences!.setString("Age", age);
  }

  getAge() {
    return sharedPreferences!.getString("Age");
  }

  Future setPresentAddress(String city) async {
    return await sharedPreferences!.setString("City", city);
  }

  getPresentAddress() {
    return sharedPreferences!.getString("City");
  }

  Future setPermanentAddress(String address) async {
    return await sharedPreferences!.setString("Address", address);
  }

  getPermanentAddress() {
    return sharedPreferences!.getString("Address");
  }
}
