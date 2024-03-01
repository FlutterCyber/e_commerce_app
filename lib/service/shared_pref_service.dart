import 'dart:convert';

import 'package:e_commerce_app/model/student.dart';
import 'package:e_commerce_app/service/logger_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<void> storeInfo(
      {required String name, required int age}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myName', name);
    await prefs.setInt('myAge', age);
    LoggerService.warningLogger("Name and Age stored successfully");
  }

  static Future<void> getInfo(String nameKey, String ageKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString(nameKey);
    final int? age = prefs.getInt(ageKey);
    LoggerService.debugLogger(name!);
    LoggerService.debugLogger(age.toString());
  }

  static Future<void> removeInfo(String nameKey, String ageKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool nameRemoved = await prefs.remove(nameKey);
    bool ageRemoved = await prefs.remove(ageKey);
    bool removed = nameRemoved && ageRemoved;
    LoggerService.warningLogger(removed.toString());
  }

  static Future<bool> storeObject(
      {required var myObject, required String objKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String str = jsonEncode(myObject);
    bool isStored = await prefs.setString(objKey, str);
    return isStored;
  }

  static Future<Student> getObject(String objectKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? studentString = prefs.getString(objectKey);
    Map<String, dynamic> objMap = jsonDecode(studentString!);
    Student student = Student.fromJson(objMap);
    return student;
  }
}
