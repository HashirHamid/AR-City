import 'dart:convert';

import 'package:animator/animator.dart';

import 'package:flutter/material.dart';
import 'package:mobilegarage_mechanics_app/Menu.dart';
 import 'package:mobilegarage_mechanics_app/auth/helloWorld.dart';
import 'package:mobilegarage_mechanics_app/constance/constance.dart';
import 'package:mobilegarage_mechanics_app/Language/appLocalizations.dart';
import 'package:mobilegarage_mechanics_app/cloud/cloudAPI.dart';
import 'package:flutter/foundation.dart';
import '../Maps.dart';
import '../main.dart';
import 'package:mobilegarage_mechanics_app/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose(){
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 220,
              color: Theme.of(context).primaryColor,
              child: Animator(
                tween: Tween<Offset>(
                  begin: Offset(0, 0.4),
                  end: Offset(0, 0),
                ),
                duration: Duration(seconds: 1),
                cycles: 1,
                builder: (anim) => SlideTransition(
                  position: anim,
                  //translation: anim.value,
                  child: Image.asset(
                    ConstanceData.splashBackground,
                    fit: BoxFit.fill,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14, left: 14),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of('Login'),
                                    style: Theme.of(context).textTheme.display1.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).textTheme.title.color,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      AppLocalizations.of(' With Your'),
                                      style: Theme.of(context).textTheme.headline.copyWith(
                                            color: Theme.of(context).textTheme.title.color,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of('provided credentials'),
                                    style: Theme.of(context).textTheme.headline.copyWith(
                                          color: Theme.of(context).textTheme.title.color,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              _emailUI(),
                              SizedBox(
                                height: 5,
                              ),
                              _passwordUI(),

                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  login(context);
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).textTheme.title.color,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of('NEXT'),
                                      style: Theme.of(context).textTheme.button.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _emailUI() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(38)),
          border: Border.all(color: Theme.of(context).dividerColor, width: 0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 48,
            child: Center(
              child: TextField(

                controller: email,
                maxLines: 1,
                onChanged: (String txt) {},
                // style: TextStyle(
                //   // fontSize: 16,
                // ),
                // enabled: _isEditing,
                cursorColor: Theme.of(context).primaryColor,
                decoration: new InputDecoration(
                  errorText: null,
                  border: InputBorder.none,
                  hintText: "email@example.com",
                  hintStyle: TextStyle(color: Theme.of(context).disabledColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _passwordUI() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(38)),
          border: Border.all(color: Theme.of(context).dividerColor, width: 0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 48,
            child: Center(
              child: TextField(
                controller: password,
                maxLines: 1,
                onChanged: (String txt) {},
                // style: TextStyle(
                //   // fontSize: 16,
                // ),
                // enabled: _isEditing,
                cursorColor: Theme.of(context).primaryColor,
                decoration: new InputDecoration(
                  errorText: null,
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Theme.of(context).disabledColor),
                ),
                obscureText:true,
              ),
            ),
          ),
        ),
      ),
    );
  }


  String getCountryString(String str) {
    var newString = '';
    var isFirstdot = false;
    for (var i = 0; i < str.length; i++) {
      if (isFirstdot == false) {
        if (str[i] != ',') {
          newString = newString + str[i];
        } else {
          isFirstdot = true;
        }
      }
    }
    return newString;
  }


  login(BuildContext context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuScreen(),
        // builder: (context) => HelloWorld(),
        // builder: (context) => MapScreen(),
      ),
    );
    //Navigator.pushNamedAndRemoveUntil(context, Routes.HISTORY, (Route<dynamic> route) => false);
    return;
    String emailText = email.text;
    String passwordText = password.text;
    if(emailText == "" || passwordText == "")
    {
      return;
    }

    var body = {
      'email':emailText,
      'password':passwordText
    };

    final response = await CloudAPI.authenticate(body);
    var responseBody = jsonDecode(response.body) as Map;
    var statusCode = responseBody["statusCode"];
    var data = responseBody["data"] as Map;
    debugPrint(data["token"]);

    if(statusCode == "0")
    {
      Utils.saveToPrefs("access-token", data["token"]);

    }
    else{
      Utils.showAlertDialog(context,"Error","User not found");
    }

  }

}
