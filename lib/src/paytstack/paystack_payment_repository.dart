import 'dart:convert';

import 'package:http/http.dart' as http;
import 'paystack_models.dart';

// String backendUrl = 'http://127.0.0.1:8087/front-office/paystack/transaction';
// // Set this to a public key that matches the secret key you supplied while creating the heroku instance
// String paystackPublicKey = 'pk_test_e0d25350c7bb2c88e79a040dd9db97fa478d247f';
// String token =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiemVlZCJdLCJ1c2VyX25hbWUiOiJPZHVuYm95ZUBnbWFpbC5jb20iLCJqdGkiOiJsNHJMWElwc0xaNEtVRnA4OVd1emltbHZsT28iLCJjbGllbnRfaWQiOiJ6ZWVkIiwic2NvcGUiOlsicHJvZmlsZSJdfQ.4q9wnd1qEqiRajW-TTuEER-m5hKGCtqXn5TfibFVo-w';

class PaystackPaymentRepository {
  final String backendUrl;
  final String paystackPublicKey;
  final String token;

  PaystackPaymentRepository(
      {required this.backendUrl,
      required this.paystackPublicKey,
      required this.token});

  verifyFromServer(String reference) async {
    String url = '$backendUrl/verify/$reference';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });

      return PaystackVerifyResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAccessCodeFrmServer(int amount, String via, String type) async {
    String url = '$backendUrl/initialize/$amount/$via/$type';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      return PaystackInitResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  // String _getReference() {
  //   String platform;
  //   if (!kIsWeb) {
  //     if (Platform.isIOS) {
  //       platform = 'iOS';
  //     } else {
  //       platform = 'Android';
  //     }
  //   } else {
  //     platform = "WEB";
  //   }

  //   return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  // }
}
