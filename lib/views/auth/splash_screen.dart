import 'package:flutter/material.dart';
import 'package:stock_veer/utils/colors.dart';

import '../root.dart';
import 'mobile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  durationForSplash() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Root())));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    durationForSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNavyBlue,
      body: Center(
        child: Image.asset(
          'assets/images/stockveer_Splash.png',
          height: 197,
          width: 205,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
