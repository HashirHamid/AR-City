import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobilegarage_mechanics_app/configs/configs.dart';
import 'package:mobilegarage_mechanics_app/utils/utils.dart';
import '../main.dart';
class CloudAPI {
  static Future<http.Response> authenticate(var body) {
    return http.post(
      Uri.http(Configs.BASE_URL, 'authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> post(BuildContext context, String uri, var body) async {
    String token = await Utils.getFromPrefs("access-token");
    if(token == null){
      Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (Route<dynamic> route) => false);
    }
    return http.post(
      Uri.http(Configs.BASE_URL, uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
      body: jsonEncode(body),
    );
  }
}