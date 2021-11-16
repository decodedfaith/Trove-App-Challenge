// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.logger.dart';
import 'package:trove_app_challenge/models/api_response.dart';
import 'package:dio/src/dio_error.dart';
import 'dart:io';
import 'package:trove_app_challenge/utilities/api_handlers/api.dart';
import 'package:trove_app_challenge/utilities/api_handlers/api_utils.dart';
import 'package:trove_app_challenge/utilities/api_handlers/dio_interceptors.dart';
import 'package:trove_app_challenge/utilities/api_handlers/failures.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/enums.dart';

class AppApi implements Api {
  final log = getLogger('AppApi');
  final dio = Dio();
  final snackbar = locator<SnackbarService>();


  AppApi(baseUrl) {
      dio.interceptors.add(DioInterceptor());
      dio.options.sendTimeout = 60000;
      dio.options.receiveTimeout = 60000;
      dio.options.baseUrl = baseUrl;
      log.i('App Api constructed and DIO setup register');
  }

  Future<dynamic> post(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.post(string,
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response!.data!['message'] == String) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: e.response!.data!['message'],
        );
      } else if (e.response!.data!['message'] != String) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: e.response!.data!['message'] ??
              e.response!.data['error'] ??
              errorOccurred,
        );
      }
      log.w(e.toString());
      handleApiError(e);
    } on SocketException {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 10),
          variant: SnackbarType.failure,
          message: 'Please check your internet');
    }
  }


  @override
  Future<ApiResponse?> delete(String path,
      {Map<String, dynamic>? body, String? token}) {
    // ignore: todo
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Failure handleApiError(DioError e) {
    // ignore: todo
    // TODO: implement handleApiError
    throw UnimplementedError();
  }

  @override
  Future login({required String email, required String password, token}) {
    // ignore: todo
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token}) {
    // ignore: todo
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  sendGetRequest(endpoint) {
    // ignore: todo
    // TODO: implement sendGetRequest
    throw UnimplementedError();
  }

  @override
  sendPatchRequest(body, endpoint, userId) {
    // ignore: todo
    // TODO: implement sendPatchRequest
    throw UnimplementedError();
  }

  @override
  sendPostRequest(body, endpoint) {
    // ignore: todo
    // TODO: implement sendPostRequest
    throw UnimplementedError();
  }

  @override
  Future signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String displayName,
      required String phoneNumber,
      required String token}) {
    // ignore: todo
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future uploadImage(File image,
      {required String token, required String pluginId}) {
    // ignore: todo
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
