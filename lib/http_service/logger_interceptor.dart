import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';

class LoggerInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    log("----- Request -----");
    log(data.toString());
    log(data.baseUrl);
    log(data.body);
    log("----- End Request -----");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log("----- Response -----");
    log(data.toString());
    log("----- End Response -----");
    return data;
  }
}
