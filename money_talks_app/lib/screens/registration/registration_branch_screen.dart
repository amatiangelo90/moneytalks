import 'package:chopper/chopper.dart';
import 'package:money_talks_app/constants.dart';
import 'package:money_talks_app/databundlenotifier/databundlenotifier.dart';
import 'package:money_talks_app/moneytalks_swagger/swaggermodel.swagger.dart';
import 'package:money_talks_app/size_config.dart';
import 'package:money_talks_app/style.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
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
  Address,
  Cap,
  City,
  Country
}

class RegistrationBranchScreen extends StatefulWidget {

  static String routeName = 'registration_branch_screen';
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<RegistrationBranchScreen> {

  int activeStep = 0;
  int upperBound = 3;

  TextEditingController _nameController = TextEditingController(text: '');
  TextEditingController _phoneController = TextEditingController(text: '');
  TextEditingController _addressController = TextEditingController(text: '');
  TextEditingController _capController = TextEditingController(text: '');
  TextEditingController _cityController = TextEditingController(text: '');

  String _meetThrought = 'Seleziona provider fatturazione';
  TextEditingController _vatProviderUserController = TextEditingController(text: '');
  TextEditingController _vatProviderPasswordController = TextEditingController(text: '');

  String _country = '';
  String _prefixPhone = '';
  bool selfieTaken = false;
  bool docImageTaken = false;
  Gender? selected;

  buildListTileWidget(String s) {
    return ListTile(leading: Text(s, style: textStyleCustom,),
      onTap: (){
        setState(() {
          _vatProviderUserController.clear();
          _vatProviderPasswordController.clear();
          _meetThrought = s;
        });
        Navigator.of(context).pop();
      },
    );
  }

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
            bottomSheet: Container(
              color: Colors.white,
              child: FadeAnimation(
                delay: 1,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SizedBox(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(500),
                    child: TextButton(
                        onPressed: () async {
                          KeyboardUtil.hideKeyboard(context);
                          switch(activeStep){
                            case 0:
                              if(_nameController.text == ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il nome attività'));
                              }else if(_phoneController.text == ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserire il numero di telefono'));
                              }else{
                                nextStep();
                              }
                              break;
                            case 1:

                              if(_addressController.text == ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserisci l\'indirizzo'));
                              }else if(_cityController.text == ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserisci la città'));
                              }else if(_capController.text == ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Inserisci il cap'));
                              }else if (_country != ''){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errore. Seleziona la nazione'));
                              }else{
                                nextStep();
                              }
                              break;
                            case 2:
                              if (_meetThrought == 'Seleziona provider fatturazione'){
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Please, tell us how you find this app'));
                              }
                              BranchEntity branchEntity = BranchEntity(
                                  email: databundleNotifier.currentUserEntity.email,
                                  name: _nameController.text,
                                  branchId: 0,
                                  cap: _capController.text,
                                  address: _addressController.text,
                                  phone: _phoneController.text,
                                  prefixphone: _prefixPhone,
                                  country: _country,
                                  city: _cityController.text,
                                  user: databundleNotifier.currentUserEntity,
                                  piva: '',
                                  expenceEntityList: [],
                                  recessedEntityList: [],
                                  vatProviderType: BranchEntityVatProviderType.fattureInCloud,
                                  passwordVatProvider: '',
                                  userkeyVatProvider: '');

                              Response responeUpdateProfile = await databundleNotifier.getAffServiceInstance().apiV1BranchSavePost(branchEntity: branchEntity);

                              if(responeUpdateProfile.statusCode == 200){
                                Navigator.pushNamed(context, Home.routeName);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar('Errors during update profile. Retry in 2 minute.'));
                              }
                              break;
                          }
                        },
                        style:  TextButton.styleFrom(
                            backgroundColor: kAffPurple,
                            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            )
                        ),
                        child: Text(activeStep == 2 ? 'CREA ATTIVITA\'' : 'NEXT' ,style: textStyleCustomW800White,)
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text('REGISTRA ATTIVITA\'', style: textStyleCustomW800Purple,),

            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeAnimation(
                delay: 2,
                child: Column(
                  children: [
                    IconStepper(
                      activeStepBorderPadding: 2,
                      activeStepBorderWidth: 3,
                      stepColor: Colors.grey,
                      lineLength: getProportionateScreenHeight(50),
                      enableNextPreviousButtons: false,
                      direction: Axis.horizontal,
                      activeStepBorderColor: kAffPurple,
                      activeStepColor: kAffPurple,
                      lineColor: kAffPurple,
                      enableStepTapping: false,
                      icons: const [
                        Icon(Icons.info, color: Colors.white),
                        Icon(Icons.home, color: Colors.white),
                        Icon(Icons.question_mark_rounded, color: Colors.white),
                      ],
                      activeStep: activeStep,
                    ),
                    getWidgetPageByIndexId(activeStep),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getWidgetPageByIndexId(int activeStep) {

    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    switch(activeStep){
      case 0:
        return FadeAnimation(
          delay: 1,
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
                    hintText: 'Nome Attività',
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
        );
      case 1:
        return FadeAnimation(
          delay: 2,
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
                      selected = Gender.Address;
                    });
                  },
                  textCapitalization: TextCapitalization.words,
                  controller: _addressController,
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    prefixIcon: Icon(Icons.home, color: selected == Gender.Address ? kAffPurple : Colors.grey),
                    hintText: 'Address',
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
                      selected = Gender.City;
                    });
                  },
                  controller: _cityController,
                  cursorColor: kAffPurple,
                  decoration: InputDecoration(
                    border:InputBorder.none,

                    prefixIcon: Icon(Icons.location_city, color: selected == Gender.City ? kAffPurple : Colors.grey),
                    hintText: 'City',
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
                  keyboardType: TextInputType.number,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  textCapitalization: TextCapitalization.words,
                  onTap: (){
                    setState(() {
                      _capController.text = '';
                      selected = Gender.Cap;
                    });
                  },
                  onChanged: (string){
                    if(string.length == 5){
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                    if(string.length > 5){
                      _capController.text = string.substring(0, 4);
                    }
                  },
                  controller: _capController,
                  cursorColor: kAffPurple,

                  decoration: InputDecoration(
                    border:InputBorder.none,
                    prefixIcon: Icon(Icons.numbers_sharp, color: selected == Gender.Cap ? kAffPurple : Colors.grey),
                    hintText: 'Cap',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  style:  textStyleCustomW800Purple,
                ),
              ),
            ],
          ),
        );
      case 2:
        return FadeAnimation(
          delay: 2,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      height: 50,
                      width: getProportionateScreenWidth(500),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ), onPressed: (){
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                height: getProportionateScreenHeight(500),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    buildListTileWidget('Fatture in Cloud'),
                                    buildListTileWidget('Aruba'),
                                  ],
                                )
                            );
                          },
                        );

                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_meetThrought, style: textStyleCustom,),
                          Icon(Icons.keyboard_arrow_down_outlined, color: kAffPurple, size: getProportionateScreenHeight(30),)
                        ],
                      )),
                    ),
                  ),
                ],
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
                  controller: _vatProviderUserController,
                  cursorColor: kAffPurple,
                  decoration: InputDecoration(
                    border:InputBorder.none,

                    prefixIcon: Icon(Icons.key, color: selected == Gender.City ? kAffPurple : Colors.grey),
                    hintText: 'ApyKey/User',
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
                  keyboardType: TextInputType.text,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _vatProviderPasswordController,
                  cursorColor: kAffPurple,

                  decoration: InputDecoration(
                    border:InputBorder.none,
                    prefixIcon: Icon(Icons.password, color: selected == Gender.Cap ? kAffPurple : Colors.grey),
                    hintText: 'Apy/Password',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  style:  textStyleCustomW800Purple,
                ),
              ),
            ],
          ),
        );
      default:
        return Text('Page under working');
    }
  }


  void nextStep() {
    if (activeStep < upperBound) {
      setState(() {
        activeStep++;
      });
    }
  }
}