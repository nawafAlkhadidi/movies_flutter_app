import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static clearAllSharedPref() async {
    await _prefs!.clear();
  }

  static Future<bool> putBoolean({
    @required String? key,
    @required bool? value,
  }) async {
    return await _prefs!.setBool(key!, value!);
  }

  static dynamic getData({
    @required String? key,
  }) {
    return _prefs!.get(key!);
  }


  static dynamic getSting({
    @required String? key,
  }) {
    return _prefs!.getString(key!);
  }
  static dynamic getDataList({
    @required String? key,
  }) {
    return _prefs!.getStringList(key!);
  }

  static Future<bool> setData({
    @required String? key,
    @required dynamic value,
  }) async {
    if (value is String) return await _prefs!.setString(key!, value);
    if (value is String) return await _prefs!.setString(key!, value);
    if (value is int) return await _prefs!.setInt(key!, value);
    if (value is bool) return await _prefs!.setBool(key!, value);
    if (value is List<String>) return await _prefs!.setStringList(key!, value);

    return await _prefs!.setDouble(key!, value!);
  }

  static Future<bool> removeData({
    @required String? key,
  }) async {
    return await _prefs!.remove(key!);
  }

  static dynamic containsKey({
    @required String? key,
  }) {
    return _prefs!.containsKey(key!);
  }



  static Map<String, dynamic> getMap(
    String key,
  ) {
    final data = getData(key: key);
    return data.isEmpty ? {} : jsonDecode(data) as Map<String, dynamic>;
  }

  static Future<void> setString(String key, String value) => _prefs!.setString(key, value);

  static Future<void> setMap(
    String key,
    Map<String, dynamic> map,
  ) =>
      setString(key, jsonEncode(map));



 

}
