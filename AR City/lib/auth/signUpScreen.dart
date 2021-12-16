import 'package:animator/animator.dart';

import 'package:flutter/material.dart';
import 'package:mobilegarage_mechanics_app/constance/constance.dart';
import 'package:mobilegarage_mechanics_app/auth/helloWorld.dart';
import 'package:mobilegarage_mechanics_app/Language/appLocalizations.dart';

import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var appBarheight = 0.0;



  @override
  Widget build(BuildContext context) {
    appBarheight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 14, left: 14),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: appBarheight,
                    ),
                    Card(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                Animator(
                                  tween: Tween<Offset>(
                                    begin: Offset(0, 0.4),
                                    end: Offset(0, 0),
                                  ),
                                  duration: Duration(seconds: 1),
                                  cycles: 1,
                                  builder: (anim) => SlideTransition(
                                    position: anim,
                                    child: Image.asset(
                                      ConstanceData.splashBackground,
                                      fit: BoxFit.cover,
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of('Sign Up'),
                                            style: Theme.of(context).textTheme.display1.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: ConstanceData.secoundryFontColor,
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(
                                              AppLocalizations.of(' With'),
                                              style: Theme.of(context).textTheme.headline.copyWith(
                                                    color: ConstanceData.secoundryFontColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of('email and phone'),
                                            style: Theme.of(context).textTheme.headline.copyWith(
                                                  color: ConstanceData.secoundryFontColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of('number'),
                                            style: Theme.of(context).textTheme.headline.copyWith(
                                                  color: ConstanceData.secoundryFontColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Theme.of(context).dividerColor),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  child: TextFormField(
                                    autofocus: false,
                                    style: Theme.of(context).textTheme.body1.copyWith(
                                          color: Theme.of(context).textTheme.title.color,
                                        ),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'name@example.com',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        size: 20,
                                        color: Theme.of(context).textTheme.title.color,
                                      ),
                                      hintStyle: Theme.of(context).textTheme.body1.copyWith(
                                            color: Theme.of(context).dividerColor,
                                          ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Theme.of(context).dividerColor),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 86,
                                        child: ListTile(
                                          onTap: (){},

                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: Theme.of(context).textTheme.body1.copyWith(
                                                color: Theme.of(context).textTheme.title.color,
                                              ),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: AppLocalizations.of('Mobile Number'),
                                            hintStyle: Theme.of(context).textTheme.body1.copyWith(
                                                  color: Theme.of(context).dividerColor,
                                                ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 36,
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {

                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).textTheme.title.color,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of('SIGN UP'),
                                        style: Theme.of(context).textTheme.button.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of('Already have an account?'),
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: Theme.of(context).textTheme.title.color,
                              ),
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(' Sign In'),
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Theme.of(context).textTheme.title.color,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
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
}
