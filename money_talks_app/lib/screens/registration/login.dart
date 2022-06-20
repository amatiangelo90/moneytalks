import 'package:chopper/chopper.dart';
import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:money_talks_app/screens/registration/signup.dart';
import 'package:money_talks_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../keyboard.dart';
import '../../style.dart';
import '../landing_screen.dart';
import '../utils/fadeanimation.dart';


enum Gender{
  Email,
  password,
}

class LoginScreen extends StatefulWidget {

  static String routeName = 'loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Color deaible = Colors.grey;
  bool ispasswordev = true;
  Gender? selected;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  late DataBundleNotifier dataBundleNotifier = DataBundleNotifier();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataBundleNotifier = Provider.of<DataBundleNotifier>(context, listen: false);
    });
    getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser;
      if(user != null){
        Response response = await dataBundleNotifier.affService.apiV1UserRetrieveEmailGet(email: user.email);
        if(response.statusCode == 200){
          dataBundleNotifier.setCurrentUserModel(response.body);
          Navigator.pushNamed(context, LandingScreen.routeName);
        }else{
          print('No user coglione');
        }
      }else{
        print('No user authenticated');
      }
    }catch(e){
      print('Exception : ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundleNotifier, _){
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                width: we,
                height: he,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100),
                    FadeAnimation(delay: 0.8,child: Image.asset('assets/images/1024.png', height: getProportionateScreenHeight(200)),),
                    Text('MONEY TALKS',
                        style: GoogleFonts.aleo(
                            color: kAffPurple,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4
                        )),
                    FadeAnimation(
                      delay: 1,
                      child: Text("LOGIN",style: GoogleFonts.nunito(
                          fontSize: getProportionateScreenHeight(30),
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      ),),
                    ),
                    SizedBox(
                      height: he * 0.04,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: we * 0.9,
                        height:he * 0.071,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child:  TextField(
                          controller: _emailController,
                          onTap: (){
                            setState(() {
                              selected = Gender.Email;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border:InputBorder.none,
                            prefixIcon: Icon(Icons.email_outlined,color: deaible,),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color:  deaible,
                            ),
                          ),
                          style: textStyleCustomW800Grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.02,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: we * 0.9,
                        height:he * 0.071,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _passController,
                          onTap: (){
                            setState(() {
                              selected = Gender.password;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border:InputBorder.none,
                              prefixIcon: Icon(Icons.lock_open_outlined,color: deaible,),
                              suffixIcon: IconButton(
                                icon: ispasswordev ?  Icon(Icons.visibility_off,color: deaible,): Icon(Icons.visibility,color: deaible,) ,
                                onPressed: () => setState(() => ispasswordev = !ispasswordev ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: deaible
                              )
                          ),
                          obscureText: ispasswordev ,
                          style:  textStyleCustomW800Grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.05,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: SizedBox(
                        width: getProportionateScreenWidth(330),
                        child: TextButton(
                            onPressed: () async {

                              try{
                                final user = await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text);
                                if(user != null){
                                  KeyboardUtil.hideKeyboard(context);
                                  Response response = await dataBundleNotifier.affService.apiV1UserRetrieveEmailGet(email: _emailController.text);
                                  if(response.statusCode == 200){
                                    dataBundleNotifier.setCurrentUserModel(response.body);
                                    Navigator.pushNamed(context, LandingScreen.routeName);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errors during update profile. Retry in 2 minute.'));
                                  }


                                }
                              }catch(e){
                                final snackBar = SnackBar(
                                  elevation: 10.0,
                                  backgroundColor: kAffRed,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    e.toString().replaceAll('[firebase_auth/wrong-password] ', '').replaceAll('[firebase_auth/user-not-found] ', ''),
                                    style: textStyleCustomWhite,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }

                            },
                            style:  TextButton.styleFrom(
                                backgroundColor: kAffRed,
                                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                )
                            ),
                            child: Text("LOGIN",style: GoogleFonts.nunito(
                                fontSize: getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w800,
                                color: Colors.white
                            ),)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Text("Forgot password?",style: textStyleCustomWhite,),
                    ),
                    SizedBox(
                        height: he * 0.12
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text("Non hai ancora un account? ",style: textStyleCustomW800Grey),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return const Signup();
                              }
                              ));
                            },
                            child: Text("Sign up",style: textStyleCustomGreen),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}