//Generated code

part of 'swaggermodel.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Swaggermodel extends Swaggermodel {
  _$Swaggermodel([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Swaggermodel;

  @override
  Future<Response<dynamic>> _apiV1BranchPut(
      {required BranchEntity? branchEntity}) {
    final $url = '/api/v1/branch';
    final $body = branchEntity;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1BranchSavePost(
      {required BranchEntity? branchEntity}) {
    final $url = '/api/v1/branch/save';
    final $body = branchEntity;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1BranchBranchIdDelete(
      {required int? branchId}) {
    final $url = '/api/v1/branch/${branchId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ExpencesGetAllByBranchIdBranchIdGet(
      {required int? branchId}) {
    final $url = '/api/v1/expences/getAllByBranchId${branchId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ExpencesSavePost(
      {required ExpenceEntity? expenceEntity}) {
    final $url = '/api/v1/expences/save';
    final $body = expenceEntity;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ExpencesExpendeIdDelete(
      {required int? expendeId}) {
    final $url = '/api/v1/expences/${expendeId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1RecessedGetAllByBranchIdBranchIdGet(
      {required int? branchId}) {
    final $url = '/api/v1/recessed/getAllByBranchId${branchId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1RecessedSavePost(
      {required RecessedEntity? recessedEntity}) {
    final $url = '/api/v1/recessed/save';
    final $body = recessedEntity;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1RecessedRecessedIdDelete(
      {required int? recessedId}) {
    final $url = '/api/v1/recessed/${recessedId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserEntity>> _apiV1UserRetrieveEmailGet(
      {required String? email}) {
    final $url = '/api/v1/user/retrieve/${email}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserEntity, UserEntity>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserSavePost(
      {required UserEntity? userEntity}) {
    final $url = '/api/v1/user/save';
    final $body = userEntity;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserUpdatePut(
      {required UserEntity? userEntity}) {
    final $url = '/api/v1/user/update';
    final $body = userEntity;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1UserUserIdDelete({required int? userId}) {
    final $url = '/api/v1/user/${userId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
