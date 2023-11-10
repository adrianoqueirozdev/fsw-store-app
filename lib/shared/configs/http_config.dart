import 'dart:async';
import 'dart:convert';
import 'package:fsw_store/shared/constants/environment.dart';
import 'package:http/http.dart' as http;

class HttpConfig {
  final String _baseUrl;

  HttpConfig(this._baseUrl);

  Future<Map<String, String>>? _getHeaders() async {
    return {
      'Authorization': 'Bearer ${Environment.stripeSecretKey}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
  }

  Future<dynamic> get(String url, [Map<String, dynamic>? queryParameters]) async {
    final uri = Uri.parse("$_baseUrl$url").replace(
      queryParameters: queryParameters,
    );
    dynamic responseJson;

    try {
      final response = await http.get(uri, headers: await _getHeaders());
      responseJson = _returnResponse(response);
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  Future<dynamic> post(String url, [dynamic body]) async {
    final uri = Uri.parse("$_baseUrl$url");
    dynamic responseJson;

    try {
      final response = await http.post(uri, body: body, headers: await _getHeaders());
      responseJson = _returnResponse(response);
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  Future<dynamic> put(String url, [dynamic body]) async {
    final bodyEncode = body != null ? jsonEncode(body) : body;
    final uri = Uri.parse("$_baseUrl$url");
    dynamic responseJson;

    try {
      final response = await http.put(uri, body: bodyEncode, headers: await _getHeaders());
      responseJson = _returnResponse(response);
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    final uri = Uri.parse("$_baseUrl$url");
    dynamic apiResponse;

    try {
      final response = await http.delete(uri, headers: await _getHeaders());
      apiResponse = _returnResponse(response);
    } catch (e) {
      rethrow;
    }

    return apiResponse;
  }
}

_returnResponse(http.Response response) async {
  late dynamic responseJson;

  switch (response.statusCode) {
    case 200:
      responseJson = response.body.isNotEmpty ? jsonDecode(response.body) : null;
      return responseJson;
    case 201:
      responseJson = response.body.isNotEmpty ? jsonDecode(response.body) : null;
      return responseJson;
    case 400:
    case 401:
    case 403:
    case 404:
    case 500:
      throw jsonDecode(response.body);

    default:
      throw jsonDecode(response.body);
  }
}
