import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:emend_web_app/data/Error/app_exception.dart';
import 'package:emend_web_app/data/Network/base_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future getPostApiResponse(String url, dynamic data, dynamic headers) async {
    if (kDebugMode) {
      print('POST Request: $url');
      print('Payload: $data');
    }

    dynamic responseJson;
    try {
      if (data is Map<String, dynamic> && data['file'] != null) {
        // Handle file uploads
        final fileBytes = data['file'] as Uint8List; // Ensure it's Uint8List
        final listName = data['listName'] as String? ?? '';

        final request = http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll(headers ?? {})
          ..fields['listName'] = listName
          ..files.add(http.MultipartFile.fromBytes('file', fileBytes,
              filename: 'upload.csv', contentType: MediaType('text', 'csv')));

        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        responseJson = returnResponse(response);
      } else {
        // Handle regular POST requests
        final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(data),
        );

        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request timed out');
    }

    if (kDebugMode) {
      print('Response: $responseJson');
    }
    return responseJson;
  }

  @override
  Future getGetApiResponse(String url, dynamic headers) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, dynamic data, dynamic headers) async {
    if (kDebugMode) {
      print('DELETE Request: $url');
    }

    dynamic responseJson;
    try {
      final response = await http
          .delete(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request timed out');
    }

    if (kDebugMode) {
      print('Response: $responseJson');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print('Response Status Code: ${response.statusCode}');
    }

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw CommunicationErrorException(response.body.toString());
      case 500:
        throw ServerErrorException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server, Status Code: ${response.statusCode}');
    }
  }

  @override
  Future getPutApiResponse(String url, data, headers) async {
    if (kDebugMode) {
      print('Update Request: $url');
    }

    dynamic responseJson;
    try {
      final response = await http
          .put(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request timed out');
    }

    if (kDebugMode) {
      print('Response: $responseJson');
    }

    return responseJson;
  }
}
