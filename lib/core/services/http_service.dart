import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/util/constants.dart';

class HttpService {
  Uri _makeUrl(String uri) {
    return Uri.parse('${Api.baseUrl}$uri');
  }

  /// Gets the headers for the http request.
  Future<Map<String, String>> getHeaders() async {
    return <String, String>{
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };
  }

  // perform post requests
  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    return http.post(
      _makeUrl(url),
      headers: await getHeaders(),
      body: json.encode(body),
    );
  }

  // perform get requests
  Future<http.Response> get(String url) async {
    return http.get(_makeUrl(url), headers: await getHeaders());
  }

  // perform edit
  Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    return http.patch(
      _makeUrl(url),
      headers: await getHeaders(),
      body: json.encode(body),
    );
  }

  // perform delete
  Future<http.Response> delete(String url) async {
    return http.delete(_makeUrl(url), headers: await getHeaders());
  }

  // perform file upload requests
  Future<http.MultipartRequest> fileUpload(String url) async {
    return http.MultipartRequest('POST', _makeUrl(url));
  }

  // check if http.response is successful
  bool isSuccessful(http.Response r) =>
      r.statusCode >= 200 && r.statusCode < 400;
}
