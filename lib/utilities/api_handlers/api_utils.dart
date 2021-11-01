import 'package:dio/dio.dart';
import 'package:trove_app_challenge/models/api_response.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      statusMessage: res.statusMessage,
      data: res.data,
    );
  }
}