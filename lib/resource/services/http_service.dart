import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:test_application/resource/services/errors/error_response.dart';
import 'package:test_application/resource/services/errors/network_error.dart';
import 'package:test_application/resource/services/errors/request_error.dart';

class HttpService {
  final Client _client;

  final bool isHttps = true;

  final String _baseUrl = 'http://localhost/login-api';

  static final HttpService _httpService = HttpService._constructor();

  factory HttpService() => _httpService;
  final String _networkErrorMsg = 'Please check your internet connection';

  HttpService._constructor() : _client = Client();

  Future<Map<String, dynamic>> postFormData(
      String path, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    debugPrint("Post request called");
    try {
      final response =
          await _client.post(_getUrl(path), headers: headers, body: body);

      if (response.statusCode == 200) {
        var decodedBody = jsonDecode(response.body);
        return decodedBody;
      } else {
        Map<String, dynamic> map = jsonDecode(response.body);
        throw ErrorResponse.fromJson(map);
      }
    } on SocketException catch (e) {
      debugPrint("$e");
      throw NetworkError("Socket Exception");
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

  Uri _getUrl(String path, [Map<String, String>? queryParameters]) {
    if (isHttps) {
      return Uri.https(_baseUrl, _getPath(path), queryParameters);
    } else {
      return Uri.http(_baseUrl, _getPath(path), queryParameters);
    }
  }

  String _getPath(String path) {
    return path;
  }
}
