import 'dart:async';

import 'package:ecommerce/Appconstants/keysConstant.dart';
import 'package:ecommerce/registration/SigninPage.dart';
import 'package:ecommerce/Login/logInPage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),()async{
      SharedPreferences mprefs= await SharedPreferences.getInstance();
    var token=  mprefs.get(AppKeyConstants.TokenKey);
   token!=null ?   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavPage())):
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogInPage()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 300,
          child: Image.asset("assets/images/ecoomerce_splash.png"),
        ),
      ),
    );
  }
}
