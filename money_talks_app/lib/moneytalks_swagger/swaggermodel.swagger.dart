import 'swaggermodel.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'swaggermodel.enums.swagger.dart' as enums;
export 'swaggermodel.enums.swagger.dart';
export 'swaggermodel.models.swagger.dart';

part 'swaggermodel.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Swaggermodel extends ChopperService {
  static Swaggermodel create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$Swaggermodel(client);
    }

    final newClient = ChopperClient(
        services: [_$Swaggermodel()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://212.227.203.79:8080/moneytalks-service');
    return _$Swaggermodel(newClient);
  }

  ///updateBranch
  ///@param branchEntity branchEntity
  Future<chopper.Response> apiV1BranchPut(
      {required BranchEntity? branchEntity}) {
    generatedMapping.putIfAbsent(
        BranchEntity, () => BranchEntity.fromJsonFactory);

    return _apiV1BranchPut(branchEntity: branchEntity);
  }

  ///updateBranch
  ///@param branchEntity branchEntity
  @Put(path: '/api/v1/branch')
  Future<chopper.Response> _apiV1BranchPut(
      {@Body() required BranchEntity? branchEntity});

  ///registerBranch
  ///@param branchEntity branchEntity
  Future<chopper.Response> apiV1BranchSavePost(
      {required BranchEntity? branchEntity}) {
    generatedMapping.putIfAbsent(
        BranchEntity, () => BranchEntity.fromJsonFactory);

    return _apiV1BranchSavePost(branchEntity: branchEntity);
  }

  ///registerBranch
  ///@param branchEntity branchEntity
  @Post(path: '/api/v1/branch/save')
  Future<chopper.Response> _apiV1BranchSavePost(
      {@Body() required BranchEntity? branchEntity});

  ///deleteUser
  ///@param branchId branchId
  Future<chopper.Response> apiV1BranchBranchIdDelete({required int? branchId}) {
    return _apiV1BranchBranchIdDelete(branchId: branchId);
  }

  ///deleteUser
  ///@param branchId branchId
  @Delete(path: '/api/v1/branch/{branchId}')
  Future<chopper.Response> _apiV1BranchBranchIdDelete(
      {@Path('branchId') required int? branchId});

  ///retrieveAllByBranchId
  ///@param branchId branchId
  Future<chopper.Response> apiV1ExpencesGetAllByBranchIdBranchIdGet(
      {required int? branchId}) {
    return _apiV1ExpencesGetAllByBranchIdBranchIdGet(branchId: branchId);
  }

  ///retrieveAllByBranchId
  ///@param branchId branchId
  @Get(path: '/api/v1/expences/getAllByBranchId{branchId}')
  Future<chopper.Response> _apiV1ExpencesGetAllByBranchIdBranchIdGet(
      {@Path('branchId') required int? branchId});

  ///registerBranch
  ///@param expenceEntity expenceEntity
  Future<chopper.Response> apiV1ExpencesSavePost(
      {required ExpenceEntity? expenceEntity}) {
    generatedMapping.putIfAbsent(
        ExpenceEntity, () => ExpenceEntity.fromJsonFactory);

    return _apiV1ExpencesSavePost(expenceEntity: expenceEntity);
  }

  ///registerBranch
  ///@param expenceEntity expenceEntity
  @Post(path: '/api/v1/expences/save')
  Future<chopper.Response> _apiV1ExpencesSavePost(
      {@Body() required ExpenceEntity? expenceEntity});

  ///deleteUser
  ///@param expendeId expendeId
  Future<chopper.Response> apiV1ExpencesExpendeIdDelete(
      {required int? expendeId}) {
    return _apiV1ExpencesExpendeIdDelete(expendeId: expendeId);
  }

  ///deleteUser
  ///@param expendeId expendeId
  @Delete(path: '/api/v1/expences/{expendeId}')
  Future<chopper.Response> _apiV1ExpencesExpendeIdDelete(
      {@Path('expendeId') required int? expendeId});

  ///retrieveAllByBranchId
  ///@param branchId branchId
  Future<chopper.Response> apiV1RecessedGetAllByBranchIdBranchIdGet(
      {required int? branchId}) {
    return _apiV1RecessedGetAllByBranchIdBranchIdGet(branchId: branchId);
  }

  ///retrieveAllByBranchId
  ///@param branchId branchId
  @Get(path: '/api/v1/recessed/getAllByBranchId{branchId}')
  Future<chopper.Response> _apiV1RecessedGetAllByBranchIdBranchIdGet(
      {@Path('branchId') required int? branchId});

  ///registerBranch
  ///@param recessedEntity recessedEntity
  Future<chopper.Response> apiV1RecessedSavePost(
      {required RecessedEntity? recessedEntity}) {
    generatedMapping.putIfAbsent(
        RecessedEntity, () => RecessedEntity.fromJsonFactory);

    return _apiV1RecessedSavePost(recessedEntity: recessedEntity);
  }

  ///registerBranch
  ///@param recessedEntity recessedEntity
  @Post(path: '/api/v1/recessed/save')
  Future<chopper.Response> _apiV1RecessedSavePost(
      {@Body() required RecessedEntity? recessedEntity});

  ///deleteUser
  ///@param recessedId recessedId
  Future<chopper.Response> apiV1RecessedRecessedIdDelete(
      {required int? recessedId}) {
    return _apiV1RecessedRecessedIdDelete(recessedId: recessedId);
  }

  ///deleteUser
  ///@param recessedId recessedId
  @Delete(path: '/api/v1/recessed/{recessedId}')
  Future<chopper.Response> _apiV1RecessedRecessedIdDelete(
      {@Path('recessedId') required int? recessedId});

  ///getUsersByEmail
  ///@param email email
  Future<chopper.Response<UserEntity>> apiV1UserRetrieveEmailGet(
      {required String? email}) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _apiV1UserRetrieveEmailGet(email: email);
  }

  ///getUsersByEmail
  ///@param email email
  @Get(path: '/api/v1/user/retrieve/{email}')
  Future<chopper.Response<UserEntity>> _apiV1UserRetrieveEmailGet(
      {@Path('email') required String? email});

  ///registerUser
  ///@param userEntity userEntity
  Future<chopper.Response> apiV1UserSavePost(
      {required UserEntity? userEntity}) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _apiV1UserSavePost(userEntity: userEntity);
  }

  ///registerUser
  ///@param userEntity userEntity
  @Post(path: '/api/v1/user/save')
  Future<chopper.Response> _apiV1UserSavePost(
      {@Body() required UserEntity? userEntity});

  ///updateUser
  ///@param userEntity userEntity
  Future<chopper.Response> apiV1UserUpdatePut(
      {required UserEntity? userEntity}) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _apiV1UserUpdatePut(userEntity: userEntity);
  }

  ///updateUser
  ///@param userEntity userEntity
  @Put(path: '/api/v1/user/update')
  Future<chopper.Response> _apiV1UserUpdatePut(
      {@Body() required UserEntity? userEntity});

  ///deleteUser
  ///@param userId userId
  Future<chopper.Response> apiV1UserUserIdDelete({required int? userId}) {
    return _apiV1UserUserIdDelete(userId: userId);
  }

  ///deleteUser
  ///@param userId userId
  @Delete(path: '/api/v1/user/{userId}')
  Future<chopper.Response> _apiV1UserUserIdDelete(
      {@Path('userId') required int? userId});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
