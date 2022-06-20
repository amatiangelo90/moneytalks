import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:chopper/chopper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_talks_app/moneytalks_swagger/swaggermodel.swagger.dart';
import 'package:money_talks_app/screens/registration/registration_user_screen.dart';
import 'package:provider/provider.dart';
import '../../keyboard.dart';
import '../../size_config.dart';
import '../../style.dart';
import '../landing_screen.dart';
import '../utils/fadeanimation.dart';
import 'login.dart';

enum Gender{
  Email,
  password,
  confirmpassword
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  Color deaible = Colors.grey;
  bool ispasswordev = true;
  Gender? selected;

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Consumer<DataBundleNotifier>(
        builder: (child, dataBundleNotifier, _){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: we,
                  height: he,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        height: he * 0.05,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: we * 0.04),
                          child: Icon(Icons.arrow_back_outlined,color: kAffPurple, size: 35.0,),
                        ),
                      ),
                      FadeAnimation(delay: 0.6,child: Image.asset('assets/images/1024.png', height: getProportionateScreenHeight(100)),),
                      FadeAnimation(
                        delay: 0.8,
                        child: Text('MONEY TALKS',
                            style: GoogleFonts.aleo(
                                color: kAffPurple,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 4
                            )),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Text("Create Account", style: GoogleFonts.heebo(
                            color: kAffPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            letterSpacing: 2
                        ),
                        ),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Text("Please fill the input blow here",style: GoogleFonts.heebo(
                            color: Colors.grey,
                            letterSpacing: 1),
                        ),
                      ),
                      Column(
                        children: [
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
                                onTap: (){
                                  setState(() {
                                    selected = Gender.Email;
                                  });
                                },
                                controller: _mailController,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border:InputBorder.none,
                                  prefixIcon: Icon(Icons.email_outlined, color: deaible,),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: deaible
                                  ),

                                ),
                                style:  textStyleCustomW800Grey,
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
                                controller: _confirmPassController,
                                onTap: (){
                                  setState(() {
                                    selected = Gender.confirmpassword;
                                  });
                                },
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border:InputBorder.none,
                                    prefixIcon: Icon(Icons.lock_open_outlined,color: deaible,),
                                    suffixIcon: IconButton(
                                      icon: ispasswordev ?  Icon(Icons.visibility_off, color: deaible,) : Icon(Icons.visibility, color: deaible,) ,
                                      onPressed: () => setState(() => ispasswordev = !ispasswordev ),
                                    ),
                                    hintText: 'Confirm Password',
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
                            height: he * 0.02,
                          ),
                        ],
                      ),

                      FadeAnimation(
                        delay: 1,
                        child: SizedBox(
                          width: getProportionateScreenWidth(330),
                          child: TextButton(
                              onPressed: () async {
                                KeyboardUtil.hideKeyboard(context);
                                try{
                                  final _auth = FirebaseAuth.instance;

                                  if(_mailController.text == ''){
                                    ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Error. Mail is missing!'));

                                  } else if(_passController.text == ''){
                                    ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Error. Password is missing!'));

                                  }else if(_confirmPassController.text == ''){
                                    ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Error. Confirmation password is missing!'));

                                  }else if(_passController.text != _confirmPassController.text){
                                    ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Error. Password doesn\'t match'));
                                  }else{
                                    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _mailController.text, password: _passController.text);
                                    if(userCredential != null){

                                      Response apiV1UserPost = await dataBundleNotifier.getAffServiceInstance().apiV1UserSavePost(userEntity: UserEntity(
                                        email: _mailController.text,
                                        name: '',
                                        branchEntities: []
                                      ));

                                      if(apiV1UserPost.statusCode == 200){
                                        Response response = await dataBundleNotifier.getAffServiceInstance().apiV1UserRetrieveEmailGet(email: _mailController.text);

                                        if(response.statusCode == 200 && response.body != null){
                                          dataBundleNotifier.setCurrentUserModel(response.body);

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationUserScreen(email: _mailController.text,),),);
                                        }else{
                                          await _auth.currentUser?.delete();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(buildErrorSnackBar('Error during registration. Retry in 2 minutes.'));
                                        }
                                      }else{
                                        await _auth.currentUser?.delete();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(buildErrorSnackBar('Error during registration. Retry in 2 minutes.'));
                                      }
                                    }else{
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(buildErrorSnackBar('Error during registration. Retry in 2 minutes.'));
                                    }
                                  }
                                }catch(e){
                                  final snackBar = SnackBar(
                                    elevation: 10.0,
                                    backgroundColor: kAffRed,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      e.toString().replaceAll('[firebase_auth/wrong-password] ', '').replaceAll('[firebase_auth/invalid-email] ', '').replaceAll('[firebase_auth/user-not-found] ', '').replaceAll('[firebase_auth/email-already-in-use] ', ''),
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
                              child: Text("SIGN UP",style: GoogleFonts.nunito(
                                  fontSize: getProportionateScreenHeight(20),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white
                              ),)
                          ),
                        ),
                      ),
                      SizedBox(
                          height: he * 0.13
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text("Already have a account? ",style: GoogleFonts.heebo(
                              color:   Colors.grey,
                              letterSpacing: 0.5,
                            )),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return LoginScreen();
                                }
                                ));
                              },
                              child: Text("Sign in",style: GoogleFonts.heebo(
                                color:  const Color(0xFF0DF5E4).withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}