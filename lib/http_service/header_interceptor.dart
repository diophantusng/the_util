import 'package:http_interceptor/http_interceptor.dart';

class HeaderInterceptor implements InterceptorContract {
  final String token;

  HeaderInterceptor(this.token);
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers = {
      "Content-Type": "application/json",
      'authorization': 'Bearer $token'
    };
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
