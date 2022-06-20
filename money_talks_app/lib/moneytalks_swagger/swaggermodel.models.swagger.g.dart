// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swaggermodel.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenceEntity _$ExpenceEntityFromJson(Map<String, dynamic> json) =>
    ExpenceEntity(
      amount: json['amount'] as num?,
      branch: json['branch'] == null
          ? null
          : BranchEntity.fromJson(json['branch'] as Map<String, dynamic>),
      description: json['description'] as String?,
      expenceDate: json['expenceDate'] as String?,
      expenxeId: json['expenxe_id'] as num?,
    );

Map<String, dynamic> _$ExpenceEntityToJson(ExpenceEntity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'branch': instance.branch?.toJson(),
      'description': instance.description,
      'expenceDate': instance.expenceDate,
      'expenxe_id': instance.expenxeId,
    };

BranchEntity _$BranchEntityFromJson(Map<String, dynamic> json) => BranchEntity(
      address: json['address'] as String?,
      branchId: json['branch_id'] as num?,
      cap: json['cap'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      email: json['email'] as String?,
      expenceEntityList: (json['expenceEntityList'] as List<dynamic>?)
              ?.map((e) => ExpenceEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] as String?,
      passwordVatProvider: json['passwordVatProvider'] as String?,
      phone: json['phone'] as String?,
      piva: json['piva'] as String?,
      prefixphone: json['prefixphone'] as String?,
      recessedEntityList: (json['recessedEntityList'] as List<dynamic>?)
              ?.map((e) => RecessedEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      userkeyVatProvider: json['userkeyVatProvider'] as String?,
      vatProviderType:
          branchEntityVatProviderTypeFromJson(json['vatProviderType']),
    );

Map<String, dynamic> _$BranchEntityToJson(BranchEntity instance) =>
    <String, dynamic>{
      'address': instance.address,
      'branch_id': instance.branchId,
      'cap': instance.cap,
      'city': instance.city,
      'country': instance.country,
      'email': instance.email,
      'expenceEntityList':
          instance.expenceEntityList?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'passwordVatProvider': instance.passwordVatProvider,
      'phone': instance.phone,
      'piva': instance.piva,
      'prefixphone': instance.prefixphone,
      'recessedEntityList':
          instance.recessedEntityList?.map((e) => e.toJson()).toList(),
      'user': instance.user?.toJson(),
      'userkeyVatProvider': instance.userkeyVatProvider,
      'vatProviderType':
          branchEntityVatProviderTypeToJson(instance.vatProviderType),
    };

RecessedEntity _$RecessedEntityFromJson(Map<String, dynamic> json) =>
    RecessedEntity(
      amount: json['amount'] as num?,
      branch: json['branch'] == null
          ? null
          : BranchEntity.fromJson(json['branch'] as Map<String, dynamic>),
      description: json['description'] as String?,
      recessedDate: json['recessedDate'] as String?,
      recessedId: json['recessed_id'] as num?,
    );

Map<String, dynamic> _$RecessedEntityToJson(RecessedEntity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'branch': instance.branch?.toJson(),
      'description': instance.description,
      'recessedDate': instance.recessedDate,
      'recessed_id': instance.recessedId,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      age: json['age'] as int?,
      branchEntities: (json['branchEntities'] as List<dynamic>?)
              ?.map((e) => BranchEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cf: json['cf'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      lastname: json['lastname'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      prefixphone: json['prefixphone'] as String?,
      userid: json['userid'] as num?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'age': instance.age,
      'branchEntities':
          instance.branchEntities?.map((e) => e.toJson()).toList(),
      'cf': instance.cf,
      'dob': _dateToJson(instance.dob),
      'email': instance.email,
      'gender': instance.gender,
      'lastname': instance.lastname,
      'name': instance.name,
      'phone': instance.phone,
      'prefixphone': instance.prefixphone,
      'userid': instance.userid,
    };
