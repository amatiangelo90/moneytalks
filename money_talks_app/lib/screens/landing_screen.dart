import 'dart:async';

import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:money_talks_app/screens/registration/registration_branch_screen.dart';
import 'package:money_talks_app/screens/utils/fadeanimation.dart';
import 'package:money_talks_app/style.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';
import 'home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static String routeName = 'landing';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
    Timer(const Duration(milliseconds: 2000), ()=> Navigator.pushNamed(context, Home.routeName));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBundleNotifier>(
      builder: (child, databundle, _){
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                FadeAnimation(delay: 0.2,child: Image.asset('assets/images/1024.png', height: getProportionateScreenHeight(150)),),
                Text('MONEY TALKS',
                    style: GoogleFonts.aleo(
                        color: kAffPurple,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4
                    )),
                Column(
                  children: [
                    FadeAnimation(
                      delay: 0.2,
                      child: Center(child:
                      Text('Welcome',
                          style: GoogleFonts.nunito(
                              fontSize: getProportionateScreenHeight(30),
                              fontWeight: FontWeight.w500,
                              color: kAffPurple
                          )),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.6,
                      child: Center(child:
                      Text(databundle.currentUserEntity.name!,
                          style: GoogleFonts.nunito(
                              fontSize: getProportionateScreenHeight(22),
                              fontWeight: FontWeight.w500,
                              color: kAffPurple
                          )),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(child:
                    Text('Please wait while we loading your data...',
                        style: textStyleCustomWhite),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 2, 18, 40),
                      child: LinearProgressIndicator(
                        color: kAffPurple,
                        minHeight: 3,
                        backgroundColor: Colors.white,
                        value: controller.value,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

