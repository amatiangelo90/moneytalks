import 'dart:async';
import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/screens/utils/fadeanimation.dart';
import 'package:money_talks_app/screens/registration/login.dart';
import 'package:money_talks_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3100), ()=> Navigator.pushNamed(context, LoginScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            delay: 1,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  children: [
                    FadeAnimation(delay: 0.8,child: Image.asset('assets/images/1024.png', height: getProportionateScreenHeight(300)),),
                    Text('MONEY TALKS',
                        style: GoogleFonts.aleo(
                            color: kAffPurple,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildColumn(String s, double time) {
    return FadeAnimation(
      delay: time,
      child: SizedBox(height: getProportionateScreenHeight(100), width: getProportionateScreenHeight(100),
          child: Container(
            color: kAffPurpleLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(s, style: GoogleFonts.aleo(
                    color: Colors.white,
                    fontSize: 75,
                    fontWeight: FontWeight.w300
                )),
              ],
            ),
          )),
    );
  }

}
