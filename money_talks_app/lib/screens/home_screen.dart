import 'package:google_fonts/google_fonts.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:money_talks_app/screens/registration/login.dart';
import 'package:money_talks_app/screens/registration/registration_branch_screen.dart';
import 'package:money_talks_app/screens/settings/settings.dart';
import 'package:money_talks_app/screens/utils/fadeanimation.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_talks_app/size_config.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class Home extends StatefulWidget {

  static String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  var currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundleNotifier, _){
        return Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                FadeAnimation(
                  delay: 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.pushNamed(context, RegistrationBranchScreen.routeName);
                  }, icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(dataBundleNotifier.currentUserEntity.branchEntities!.isEmpty ? Icons.add : Icons.home, color: kAffPurple, size: getProportionateScreenHeight(35),),
                  )),
                ),
              ],
              centerTitle: true,
              elevation: 0,
              leading: FadeAnimation(
                delay: 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('assets/images/1024.png',
                      height: 15.0,
                      width: 15.0,
                    ),
                  ),
                ),
              ),
              title: FadeAnimation(
                delay: 0.8,
                child: Text('MONEY TALKS',
                    style: GoogleFonts.aleo(
                        color: kAffPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4
                    )),
              ),
            ),
            bottomNavigationBar: FadeAnimation(
              delay: 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                height: size.width * .155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: size.width * .024),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                          currentIndex = index;
                        },
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: EdgeInsets.only(
                            bottom: index == currentIndex ? 0 : size.width * .029,
                            right: size.width * .0422,
                            left: size.width * .0422,
                          ),
                          width: size.width * .128,
                          height: index == currentIndex ? size.width * .014 : 0,
                          decoration: BoxDecoration(
                            color: kAffPurple,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                        ),
                        getIconByIndex(index),
                        SizedBox(height: size.width * .03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: buildCurrentWidgetByIndexNavigationBar(currentIndex, context, dataBundleNotifier),
        );
      },
    );
  }

  buildCurrentWidgetByIndexNavigationBar(int currentBottomBarIndex, context, DataBundleNotifier dataBundleNotifier) {
    switch(currentBottomBarIndex) {
      case 0:
        return Text('');
      case 1:
        return Text('');
      case 2:
        return Text('');
      case 3:
        return SettingsWidget();

    }
  }

  getIconByIndex(int index) {
    switch(index){
      case 0:
        return Icon(Icons.upload, size: getProportionateScreenHeight(35), color: currentIndex == index ? kAffPurple : Colors.grey.shade400,);
      case 1:
        return Icon(Icons.download, size: getProportionateScreenHeight(35), color: currentIndex == index ? kAffPurple : Colors.grey.shade400,);
      case 2:
        return Icon(Icons.line_axis, size: getProportionateScreenHeight(35), color: currentIndex == index ? kAffPurple : Colors.grey.shade400,);
      case 3:
        return Icon(Icons.settings, size: getProportionateScreenHeight(35), color: currentIndex == index ? kAffPurple : Colors.grey.shade400,);

    }
  }
}

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return _buildStepper(StepperType.vertical);
          case Orientation.landscape:
            return _buildStepper(StepperType.horizontal);
          default:
            throw UnimplementedError(orientation.toString());
        }
      },
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < 3; ++i)
          _buildStep(
            title: Text('Step ${i + 1}'),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep ? StepState.complete : StepState.indexed,
          ),
        _buildStep(
          title: Text('Error'),
          state: StepState.error,
        ),
        _buildStep(
          title: Text('Disabled'),
          state: StepState.disabled,
        )
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(color: CupertinoColors.systemGrey),
      ),
    );
  }

}
