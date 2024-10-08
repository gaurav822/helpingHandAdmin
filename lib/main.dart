import 'package:demoapp/home_screen.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/login_screen.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/purchase_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  Get.lazyPut(()=>PurchaseRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helping Hand',
      navigatorKey: GlobalVariable.navState,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      callNextScreenAndClearStack(context, LoginScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Images.ic_logo_name,height: 100, ),
      ),
    );
  }
}
