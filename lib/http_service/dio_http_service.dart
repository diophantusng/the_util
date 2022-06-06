// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'http_methods.dart';

// const baseUrl = "https://fakestoreapi.com/";

// class DioHttpService {
//   Dio? _dio;

//   static header() => {"Content-Type": "application/json"};

//   Future<DioHttpService> init() async {
//     _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));
//     initInterceptors();
//     return this;
//   }

//   void initInterceptors() {
//     _dio!.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (requestOptions, handler) {
//           log(
//               "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
//               "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}",
//               name: 'info');
//           return handler.next(requestOptions);
//         },
//         onResponse: (response, handler) {
//           log("RESPONSE[${response.statusCode}] => DATA: ${response.data}",
//               name: 'info');
//           return handler.next(response);
//         },
//         onError: (err, handler) {
//           log("Error[${err.response?.statusCode}]", name: 'info');
//           return handler.next(err);
//         },
//       ),
//     );
//   }

//   Future<dynamic> request(
//       {required String url,
//       required Method method,
//       Map<String, dynamic>? params}) async {
//     Response response;

//     try {
//       switch (method) {
//         case Method.post:
//           response = await _dio!.post(url, data: params);
//           break;
//         case Method.delete:
//           response = await _dio!.delete(url);
//           break;
//         case Method.patch:
//           response = await _dio!.patch(url);
//           break;
//         default:
//           response = await _dio!.get(url, queryParameters: params);
//       }

//       switch (response.statusCode) {
//         case 200:
//           return response;
//         case 400:
//           throw Exception("Bad request");
//         case 401:
//           throw Exception("Unauthorized");
//         case 500:
//           throw Exception("Server Error");
//         default:
//           throw Exception("Something does wen't wrong");
//       }
//     } on SocketException catch (e) {
//       log(e.toString(), name: 'error');
//       throw Exception("Not Internet Connection");
//     } on FormatException catch (e) {
//       log(e.toString(), name: 'error');
//       throw Exception("Bad response format");
//     } on DioError catch (e) {
//       log(e.toString(), name: 'error');
//       throw Exception(e);
//     } catch (e) {
//       log(e.toString(), name: 'error');
//       throw Exception("Something wen't wrong");
//     }
//   }
// }
