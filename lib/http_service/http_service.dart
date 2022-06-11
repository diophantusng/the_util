import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

enum Method { post, get, put, delete, patch }

class HttpService {
  HttpService(this.client);
  final http.Client client;

  Future<http.Response> request(
      {required String url_,
      required Method method,
      Map<String, String>? headers,
      dynamic body,
      Map<String, dynamic>? params}) async {
    http.Response response;

    var url = Uri.parse(url_);

    try {
      switch (method) {
        case Method.post:
          response = await client.post(url, headers: headers, body: body);
          break;
        case Method.delete:
          response = await client.delete(url, headers: headers, body: body);
          break;
        case Method.patch:
          response = await client.patch(url, headers: headers, body: body);
          break;
        default:
          response = await client.get(url, headers: headers);
      }

      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          throw Exception('Bad Request');
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Server Error");
        default:
          throw Exception("Something does wen't wrong..");
      }
    } on SocketException catch (e) {
      log(e.toString(), name: 'error');
      throw Exception("Check your internet connection");
    } on FormatException catch (e) {
      log(e.toString(), name: 'error');
      throw Exception("Bad response format");
    } on HttpException catch (e) {
      log(e.toString(), name: 'error');
      throw Exception(e);
    } catch (e) {
      log(e.toString(), name: 'error');
      throw Exception("");
    }
  }
}
