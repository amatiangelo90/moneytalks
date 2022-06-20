import 'package:chopper/chopper.dart';
import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:money_talks_app/size_config.dart';
import 'package:money_talks_app/style.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../keyboard.dart';
import '../../moneytalks_swagger/swaggermodel.models.swagger.dart';
import '../home_screen.dart';
import '../utils/fadeanimation.dart';

enum Gender{
  Name,
  Lastname,
  Phone,
  FiscalCode,
  PrefixPhone,
  BirthDate,
}

class RegistrationUserScreen extends StatefulWidget {
  const RegistrationUserScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  static String routeName = 'registration_branch_screen';
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<RegistrationUserScreen> {

  TextEditingController _nameController = TextEditingController(text: '');
  TextEditingController _lastNameController = TextEditingController(text: '');
  TextEditingController _phoneController = TextEditingController(text: '');
  TextEditingController _cfController = TextEditingController(text: '');

  String _prefixPhone = '';
  String _dateBirth = '';

  late DateTime _currentBirthDate = DateTime.now();

  bool selfieTaken = false;
  bool docImageTaken = false;

  Gender? selected;

  buildColumn(String s, String t, double time) {
    return FadeAnimation(
      delay: time,
      child: SizedBox(height: 30, width: 9,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child:
                  Text('  ' + t, style: GoogleFonts.aleo(
                      color: Colors.white,
                      fontSize: 3,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
                  ),
                ),Text(s, style: GoogleFonts.aleo(
                    color: Colors.white,
                    fontSize: 6,
                    fontWeight: FontWeight.w700
                )),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer<DataBundleNotifier>(
        builder: (child, databundleNotifier, _){
          return Scaffold(
            backgroundColor: Colors.white,
            bottomSheet: FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(500),
                  child: TextButton(
                      onPressed: () async {
                        if(_nameController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il nome!'));
                        }else if(_lastNameController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il cognome!'));
                        }else if(_phoneController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il cellulare!'));
                        }else if(_cfController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il codice fiscale!'));
                        }else if (_dateBirth == ''){
                          ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire la data di nascita!'));
                        }else{
                          UserEntity userEntity = UserEntity(
                              email: databundleNotifier.currentUserEntity.email,
                              lastname: _lastNameController.text,
                              name: _nameController.text,
                              dob: _currentBirthDate,
                              prefixphone: _prefixPhone,
                              phone: _phoneController.text,
                              branchEntities: [],
                              age: 0,
                              gender: '',
                              cf: _cfController.text
                          );

                          Response responeUpdateProfile = await databundleNotifier.getAffServiceInstance().apiV1UserUpdatePut(userEntity: userEntity);

                          if(responeUpdateProfile.statusCode == 200){
                            databundleNotifier.setCurrentUserModel(userEntity);
                            Navigator.pushNamed(context, Home.routeName);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errors during update profile. Retry in 2 minute.'));
                          }
                        }
                        KeyboardUtil.hideKeyboard(context);
                      },
                      style:  TextButton.styleFrom(
                          backgroundColor: kAffPurple,
                          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          )
                      ),
                      child: Text('CONFERMA' ,style: textStyleCustomW800White,)
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text('Completa il profilo', style: textStyleCustomW800Purple,),

            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeAnimation(
                delay: 2,
                child: getRegistrationWidget(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getRegistrationWidget() {

    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return FadeAnimation(
      delay: 1,
      child: Center(
        child: Column(

          children: [
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                cursorColor: kAffPurple,
                onTap: (){
                  setState(() {
                    selected = Gender.Name;
                  });
                },
                textCapitalization: TextCapitalization.words,
                controller: _nameController,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.person, color: selected == Gender.Name ? kAffPurple : Colors.grey),
                  hintText: 'Nome',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                textCapitalization: TextCapitalization.words,
                onTap: (){
                  setState(() {
                    selected = Gender.Lastname;
                  });
                },
                controller: _lastNameController,
                cursorColor: kAffPurple,
                decoration: InputDecoration(
                  border:InputBorder.none,

                  prefixIcon: Icon(Icons.person, color: selected == Gender.Lastname ? kAffPurple : Colors.grey),
                  hintText: 'Cognome',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                textCapitalization: TextCapitalization.words,
                onTap: (){
                  setState(() {
                    selected = Gender.FiscalCode;
                  });
                },
                controller: _cfController,
                cursorColor: kAffPurple,
                decoration: InputDecoration(
                  border:InputBorder.none,

                  prefixIcon: Icon(Icons.person, color: selected == Gender.FiscalCode ? kAffPurple : Colors.grey),
                  hintText: 'Codice Fiscale',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                textCapitalization: TextCapitalization.words,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    selected = Gender.BirthDate;
                  });
                  DateTime? datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    backgroundColor: Colors.white,
                    textColor: kAffPurple,
                    confirmText: 'Confirm',
                    titleText: 'Data di Nascita',
                    initialDate: DateTime(1990),
                    firstDate: DateTime(1970),
                    lastDate: DateTime.now().subtract(const Duration(days: 365*18)),
                    dateFormat: "dd-MMMM-yyyy",
                    locale: DateTimePickerLocale.en_us,
                    looping: true,
                  );
                  setState(() {
                    _currentBirthDate = datePicked!;
                    _dateBirth = DateFormat('dd/MM/yyyy').format(datePicked);
                  });
                },
                controller: TextEditingController(text: _dateBirth),
                cursorColor: kAffPurple,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_today, color: selected == Gender.BirthDate ? kAffPurple : Colors.grey),
                  hintText: 'Data di Nascita',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                textCapitalization: TextCapitalization.words,
                onTap: (){
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country c) {
                      setState(() {
                        _prefixPhone = c.phoneCode;
                      });
                    },
                  );
                  setState(() {
                    selected = Gender.PrefixPhone;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                controller: TextEditingController(text: _prefixPhone),
                cursorColor: kAffPurple,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.add, color: selected == Gender.PrefixPhone ? kAffPurple : Colors.grey),
                  hintText: 'Prefisso telefonico',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Container(
              width: we * 0.9,
              height: he * 0.071,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                textCapitalization: TextCapitalization.words,
                onTap: (){

                  setState(() {
                    selected = Gender.Phone;
                  });
                },
                controller: _phoneController,
                cursorColor: kAffPurple,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.phone_android_rounded, color: selected == Gender.Phone ? kAffPurple : Colors.grey),
                  hintText: 'Cellulare',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style:  textStyleCustomW800Purple,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(120),
            ),
          ],
        ),
      ),
    );
  }
}