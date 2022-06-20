import 'package:money_talks_app/screens/landing_screen.dart';
import 'package:money_talks_app/screens/registration/login.dart';
import 'package:money_talks_app/screens/splash_screen.dart';
import 'package:money_talks_app/screens/registration/registration_branch_screen.dart';
import 'package:money_talks_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'databundlenotifier/databundlenotifier.dart';
import 'screens/home_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => DataBundleNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AFF',
        initialRoute: SplashScreen.routeName,
        routes: {
          Home.routeName: (context) => Home(),
          SplashScreen.routeName: (context) => SplashScreen(),
          RegistrationBranchScreen.routeName: (context) => RegistrationBranchScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          LandingScreen.routeName: (context) => LandingScreen(),
        },
        //builder: EasyLoading.init(),
      ),
    );
  }
}


