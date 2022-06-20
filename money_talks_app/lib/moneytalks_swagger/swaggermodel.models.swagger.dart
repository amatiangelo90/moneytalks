// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';
import 'swaggermodel.enums.swagger.dart' as enums;

part 'swaggermodel.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ExpenceEntity {
  ExpenceEntity({
    this.amount,
    this.branch,
    this.description,
    this.expenceDate,
    this.expenxeId,
  });

  factory ExpenceEntity.fromJson(Map<String, dynamic> json) =>
      _$ExpenceEntityFromJson(json);

  @JsonKey(name: 'amount')
  final num? amount;
  @JsonKey(name: 'branch')
  final BranchEntity? branch;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'expenceDate')
  final String? expenceDate;
  @JsonKey(name: 'expenxe_id')
  final num? expenxeId;
  static const fromJsonFactory = _$ExpenceEntityFromJson;
  static const toJsonFactory = _$ExpenceEntityToJson;
  Map<String, dynamic> toJson() => _$ExpenceEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenceEntity &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.branch, branch) ||
                const DeepCollectionEquality().equals(other.branch, branch)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.expenceDate, expenceDate) ||
                const DeepCollectionEquality()
                    .equals(other.expenceDate, expenceDate)) &&
            (identical(other.expenxeId, expenxeId) ||
                const DeepCollectionEquality()
                    .equals(other.expenxeId, expenxeId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(branch) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(expenceDate) ^
      const DeepCollectionEquality().hash(expenxeId) ^
      runtimeType.hashCode;
}

extension $ExpenceEntityExtension on ExpenceEntity {
  ExpenceEntity copyWith(
      {num? amount,
      BranchEntity? branch,
      String? description,
      String? expenceDate,
      num? expenxeId}) {
    return ExpenceEntity(
        amount: amount ?? this.amount,
        branch: branch ?? this.branch,
        description: description ?? this.description,
        expenceDate: expenceDate ?? this.expenceDate,
        expenxeId: expenxeId ?? this.expenxeId);
  }
}

@JsonSerializable(explicitToJson: true)
class BranchEntity {
  BranchEntity({
    this.address,
    this.branchId,
    this.cap,
    this.city,
    this.country,
    this.email,
    this.expenceEntityList,
    this.name,
    this.passwordVatProvider,
    this.phone,
    this.piva,
    this.prefixphone,
    this.recessedEntityList,
    this.user,
    this.userkeyVatProvider,
    this.vatProviderType,
  });

  factory BranchEntity.fromJson(Map<String, dynamic> json) =>
      _$BranchEntityFromJson(json);

  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'branch_id')
  final num? branchId;
  @JsonKey(name: 'cap')
  final String? cap;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'expenceEntityList', defaultValue: <ExpenceEntity>[])
  final List<ExpenceEntity>? expenceEntityList;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'passwordVatProvider')
  final String? passwordVatProvider;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'piva')
  final String? piva;
  @JsonKey(name: 'prefixphone')
  final String? prefixphone;
  @JsonKey(name: 'recessedEntityList', defaultValue: <RecessedEntity>[])
  final List<RecessedEntity>? recessedEntityList;
  @JsonKey(name: 'user')
  final UserEntity? user;
  @JsonKey(name: 'userkeyVatProvider')
  final String? userkeyVatProvider;
  @JsonKey(
      name: 'vatProviderType',
      toJson: branchEntityVatProviderTypeToJson,
      fromJson: branchEntityVatProviderTypeFromJson)
  final enums.BranchEntityVatProviderType? vatProviderType;
  static const fromJsonFactory = _$BranchEntityFromJson;
  static const toJsonFactory = _$BranchEntityToJson;
  Map<String, dynamic> toJson() => _$BranchEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BranchEntity &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.branchId, branchId) ||
                const DeepCollectionEquality()
                    .equals(other.branchId, branchId)) &&
            (identical(other.cap, cap) ||
                const DeepCollectionEquality().equals(other.cap, cap)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.expenceEntityList, expenceEntityList) ||
                const DeepCollectionEquality()
                    .equals(other.expenceEntityList, expenceEntityList)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.passwordVatProvider, passwordVatProvider) ||
                const DeepCollectionEquality()
                    .equals(other.passwordVatProvider, passwordVatProvider)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.piva, piva) ||
                const DeepCollectionEquality().equals(other.piva, piva)) &&
            (identical(other.prefixphone, prefixphone) ||
                const DeepCollectionEquality()
                    .equals(other.prefixphone, prefixphone)) &&
            (identical(other.recessedEntityList, recessedEntityList) ||
                const DeepCollectionEquality()
                    .equals(other.recessedEntityList, recessedEntityList)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.userkeyVatProvider, userkeyVatProvider) ||
                const DeepCollectionEquality()
                    .equals(other.userkeyVatProvider, userkeyVatProvider)) &&
            (identical(other.vatProviderType, vatProviderType) ||
                const DeepCollectionEquality()
                    .equals(other.vatProviderType, vatProviderType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(branchId) ^
      const DeepCollectionEquality().hash(cap) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(expenceEntityList) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(passwordVatProvider) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(piva) ^
      const DeepCollectionEquality().hash(prefixphone) ^
      const DeepCollectionEquality().hash(recessedEntityList) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(userkeyVatProvider) ^
      const DeepCollectionEquality().hash(vatProviderType) ^
      runtimeType.hashCode;
}

extension $BranchEntityExtension on BranchEntity {
  BranchEntity copyWith(
      {String? address,
      num? branchId,
      String? cap,
      String? city,
      String? country,
      String? email,
      List<ExpenceEntity>? expenceEntityList,
      String? name,
      String? passwordVatProvider,
      String? phone,
      String? piva,
      String? prefixphone,
      List<RecessedEntity>? recessedEntityList,
      UserEntity? user,
      String? userkeyVatProvider,
      enums.BranchEntityVatProviderType? vatProviderType}) {
    return BranchEntity(
        address: address ?? this.address,
        branchId: branchId ?? this.branchId,
        cap: cap ?? this.cap,
        city: city ?? this.city,
        country: country ?? this.country,
        email: email ?? this.email,
        expenceEntityList: expenceEntityList ?? this.expenceEntityList,
        name: name ?? this.name,
        passwordVatProvider: passwordVatProvider ?? this.passwordVatProvider,
        phone: phone ?? this.phone,
        piva: piva ?? this.piva,
        prefixphone: prefixphone ?? this.prefixphone,
        recessedEntityList: recessedEntityList ?? this.recessedEntityList,
        user: user ?? this.user,
        userkeyVatProvider: userkeyVatProvider ?? this.userkeyVatProvider,
        vatProviderType: vatProviderType ?? this.vatProviderType);
  }
}

@JsonSerializable(explicitToJson: true)
class RecessedEntity {
  RecessedEntity({
    this.amount,
    this.branch,
    this.description,
    this.recessedDate,
    this.recessedId,
  });

  factory RecessedEntity.fromJson(Map<String, dynamic> json) =>
      _$RecessedEntityFromJson(json);

  @JsonKey(name: 'amount')
  final num? amount;
  @JsonKey(name: 'branch')
  final BranchEntity? branch;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'recessedDate')
  final String? recessedDate;
  @JsonKey(name: 'recessed_id')
  final num? recessedId;
  static const fromJsonFactory = _$RecessedEntityFromJson;
  static const toJsonFactory = _$RecessedEntityToJson;
  Map<String, dynamic> toJson() => _$RecessedEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RecessedEntity &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.branch, branch) ||
                const DeepCollectionEquality().equals(other.branch, branch)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.recessedDate, recessedDate) ||
                const DeepCollectionEquality()
                    .equals(other.recessedDate, recessedDate)) &&
            (identical(other.recessedId, recessedId) ||
                const DeepCollectionEquality()
                    .equals(other.recessedId, recessedId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(branch) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(recessedDate) ^
      const DeepCollectionEquality().hash(recessedId) ^
      runtimeType.hashCode;
}

extension $RecessedEntityExtension on RecessedEntity {
  RecessedEntity copyWith(
      {num? amount,
      BranchEntity? branch,
      String? description,
      String? recessedDate,
      num? recessedId}) {
    return RecessedEntity(
        amount: amount ?? this.amount,
        branch: branch ?? this.branch,
        description: description ?? this.description,
        recessedDate: recessedDate ?? this.recessedDate,
        recessedId: recessedId ?? this.recessedId);
  }
}

@JsonSerializable(explicitToJson: true)
class UserEntity {
  UserEntity({
    this.age,
    this.branchEntities,
    this.cf,
    this.dob,
    this.email,
    this.gender,
    this.lastname,
    this.name,
    this.phone,
    this.prefixphone,
    this.userid,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  @JsonKey(name: 'age')
  final int? age;
  @JsonKey(name: 'branchEntities', defaultValue: <BranchEntity>[])
  final List<BranchEntity>? branchEntities;
  @JsonKey(name: 'cf')
  final String? cf;
  @JsonKey(name: 'dob', toJson: _dateToJson)
  final DateTime? dob;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'prefixphone')
  final String? prefixphone;
  @JsonKey(name: 'userid')
  final num? userid;
  static const fromJsonFactory = _$UserEntityFromJson;
  static const toJsonFactory = _$UserEntityToJson;
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserEntity &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.branchEntities, branchEntities) ||
                const DeepCollectionEquality()
                    .equals(other.branchEntities, branchEntities)) &&
            (identical(other.cf, cf) ||
                const DeepCollectionEquality().equals(other.cf, cf)) &&
            (identical(other.dob, dob) ||
                const DeepCollectionEquality().equals(other.dob, dob)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.prefixphone, prefixphone) ||
                const DeepCollectionEquality()
                    .equals(other.prefixphone, prefixphone)) &&
            (identical(other.userid, userid) ||
                const DeepCollectionEquality().equals(other.userid, userid)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(branchEntities) ^
      const DeepCollectionEquality().hash(cf) ^
      const DeepCollectionEquality().hash(dob) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(prefixphone) ^
      const DeepCollectionEquality().hash(userid) ^
      runtimeType.hashCode;
}

extension $UserEntityExtension on UserEntity {
  UserEntity copyWith(
      {int? age,
      List<BranchEntity>? branchEntities,
      String? cf,
      DateTime? dob,
      String? email,
      String? gender,
      String? lastname,
      String? name,
      String? phone,
      String? prefixphone,
      num? userid}) {
    return UserEntity(
        age: age ?? this.age,
        branchEntities: branchEntities ?? this.branchEntities,
        cf: cf ?? this.cf,
        dob: dob ?? this.dob,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        lastname: lastname ?? this.lastname,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        prefixphone: prefixphone ?? this.prefixphone,
        userid: userid ?? this.userid);
  }
}

String? branchEntityVatProviderTypeToJson(
    enums.BranchEntityVatProviderType? branchEntityVatProviderType) {
  return enums.$BranchEntityVatProviderTypeMap[branchEntityVatProviderType];
}

enums.BranchEntityVatProviderType branchEntityVatProviderTypeFromJson(
  Object? branchEntityVatProviderType, [
  enums.BranchEntityVatProviderType? defaultValue,
]) {
  if (branchEntityVatProviderType is String) {
    return enums.$BranchEntityVatProviderTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                branchEntityVatProviderType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.BranchEntityVatProviderType.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$BranchEntityVatProviderTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.BranchEntityVatProviderType.swaggerGeneratedUnknown;
}

List<String> branchEntityVatProviderTypeListToJson(
    List<enums.BranchEntityVatProviderType>? branchEntityVatProviderType) {
  if (branchEntityVatProviderType == null) {
    return [];
  }

  return branchEntityVatProviderType
      .map((e) => enums.$BranchEntityVatProviderTypeMap[e]!)
      .toList();
}

List<enums.BranchEntityVatProviderType> branchEntityVatProviderTypeListFromJson(
  List? branchEntityVatProviderType, [
  List<enums.BranchEntityVatProviderType>? defaultValue,
]) {
  if (branchEntityVatProviderType == null) {
    return defaultValue ?? [];
  }

  return branchEntityVatProviderType
      .map((e) => branchEntityVatProviderTypeFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
