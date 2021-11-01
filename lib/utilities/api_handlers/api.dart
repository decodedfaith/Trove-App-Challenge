import 'dart:io';
import 'package:dio/dio.dart';
import 'package:trove_app_challenge/models/api_response.dart';
import 'package:trove_app_challenge/utilities/api_handlers/failures.dart';

abstract class Api {
  /// THIS IS THE API ABSTRACT CLASS FOR THIS
 
  // LOGIN SERVICE
  Future<dynamic> login(
      {required String email, required String password, token});

  // SIGNUP SERVICE
  Future<dynamic> signUp({
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String displayName,
      required String phoneNumber,
      required String token
    }
  );


  // THE SERVICE TO UPDATE IMAGE OF THE USER
  Future uploadImage(
    File image, {
    required String token,
    required String pluginId,
  });



 


  /// THE SERVICE TO SEND GET REQUEST
  sendGetRequest(endpoint);

  /// POSTS REQUEST SERVICE
  sendPostRequest(body, endpoint);

  /// PATCH REQUEST SERVICE
  sendPatchRequest(body, endpoint, userId);

  /// ERROR HANDLING SERVICE
  Failure handleApiError(DioError e);

 

  /// A SERVICE TO SEND PATCH REQUEST TO THE ENDPOINT
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token});

  Future<ApiResponse?> delete(String path,
      {Map<String, dynamic>? body, String? token});
}
