import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:test_application/resource/services/errors/error_response.dart';
import 'package:test_application/resource/services/errors/network_error.dart';
import 'package:test_application/resource/services/errors/request_error.dart';
import 'package:test_application/resource/services/logging_interceptor.dart';

class HttpService {
  final Client _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  final bool isHttps = false;

  final String _baseUrl = 'http://localhost:8080/login-api/';

  static final HttpService _httpService = HttpService._constructor();

  factory HttpService() => _httpService;
  final String _networkErrorMsg = 'Please check your internet connection';

  HttpService._constructor();

  Future<Map<String, dynamic>> postFormData(
      String path, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    debugPrint("Post request called");
    try {
      final response = await _client.post(
          Uri.parse('http://localhost:8080/login-api/login.php'),
          headers: headers,
          body: body);
      if (response.statusCode == 200) {
        var decodedBody = jsonDecode(response.body);
        return decodedBody;
      } else {
        Map<String, dynamic> map = jsonDecode(response.body);
        throw ErrorResponse.fromJson(map);
      }
    } on SocketException catch (e) {
      debugPrint("$e");
      throw NetworkError(_networkErrorMsg);
    } on ErrorResponse catch (e) {
      debugPrint("on ErrorResponse catch $e");
      rethrow;
    } catch (e) {
      debugPrint("on Catch $e");
      throw RequestError(handleError(e.toString()));
    }
  }

  String handleError(String error) {
    if (error.contains('Operation timed out')) return _networkErrorMsg;
    if (error.contains('No route to host')) return _networkErrorMsg;
    if (error.contains('ClientException')) {
      return 'Your network connection is unstable. Please try again.';
    }
    return error;
  }
}
