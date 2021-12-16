import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Utils {
  static showMessage(String message)
  {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showAlertDialog(BuildContext context, String title, String message) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void saveToPrefs(String key, String value)
  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static void saveListToPrefs(String key, List<String> vals)
  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, vals);
  }

  static Future<String> getFromPrefs(String key)
  async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<List<String>> getListFromPrefs(String key)
  async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

}