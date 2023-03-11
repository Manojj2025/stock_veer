import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/auth/mobile_screen.dart';

class SplashController extends GetxController{
  durationForSplash(BuildContext context){
     Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MobileScreen())));
  }
}