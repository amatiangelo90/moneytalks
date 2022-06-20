import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../moneytalks_swagger/swaggermodel.swagger.dart';

class DataBundleNotifier extends ChangeNotifier {

  Swaggermodel affService = Swaggermodel.create(
    baseUrl: kUrl
  );
  late UserEntity currentUserEntity = UserEntity();

  Swaggermodel getAffServiceInstance(){
    if(affService == null){
      affService = Swaggermodel.create();
      return affService;
    }else{
      return affService;
    }
  }

  void setCurrentUserModel(UserEntity userEntity){
    currentUserEntity = userEntity;
    notifyListeners();
  }

}