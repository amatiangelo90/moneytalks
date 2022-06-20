import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_talks_app/size_config.dart';

import '../../constants.dart';
import '../registration/login.dart';
import '../utils/fadeanimation.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  final settingsStyle = GoogleFonts.nunito(
      color: kAffPurple,
      fontSize: getProportionateScreenHeight(25),
      fontWeight: FontWeight.w600,
      letterSpacing: 1
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FadeAnimation(
              delay: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 90,
                  width: getProportionateScreenWidth(500),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: kAffPurple,
                        elevation: 2,
                        primary: Colors.grey.shade50,
                      ),
                      onPressed: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('  ATTIVITA\'',
                              style: settingsStyle),
                          Icon(Icons.logout, color: kAffRed, size: 30,)
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ),
            FadeAnimation(
              delay: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 90,
                  width: getProportionateScreenWidth(500),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: kAffPurple,
                        elevation: 2,
                        primary: Colors.grey.shade50,
                      ),
                      onPressed: (){
                        FirebaseAuth _auth = FirebaseAuth.instance;
                        if(_auth!=null){
                          _auth.signOut();
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('  LOG OUT',
                              style: settingsStyle),
                          Icon(Icons.logout, color: kAffRed, size: 30,)
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
