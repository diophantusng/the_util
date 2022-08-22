import 'dart:io';

import 'package:flutter/foundation.dart';
import 'paystack_models.dart';
import 'paystack_payment_repository.dart';

class PaymentViewController {
  final int amount;
  final String type;
  final String backendUrl;
  final String paystackPublicKey;
  final String token;

  late final _repo = PaystackPaymentRepository(
      backendUrl: backendUrl,
      paystackPublicKey: paystackPublicKey,
      token: token);

  PaymentViewController(
      {required this.type,
      required this.amount,
      required this.backendUrl,
      required this.paystackPublicKey,
      required this.token}) {
    init();
  }

  final initResponse = ValueNotifier<PaystackInitResponse?>(null);
  final verifyResponse = ValueNotifier<PaystackVerifyResponse?>(null);
  final busy = ValueNotifier(false);

  init() async {
    try {
      busy.value = true;
      initResponse.value =
          await _repo.fetchAccessCodeFrmServer(amount, _getReference(), type);
      busy.value = false;
    } catch (e) {
      busy.value = false;
      rethrow;
    }
  }

  Future verify() async {
    try {
      busy.value = true;
      verifyResponse.value =
          await _repo.verifyFromServer(initResponse.value!.data!.reference!);
      busy.value = false;
    } catch (e) {
      busy.value = false;
      rethrow;
    }
  }

  String _getReference() {
    String platform;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'iOS';
      } else if (Platform.isLinux) {
        platform = 'Linux';
      } else if (Platform.isMacOS) {
        platform = 'MacOS';
      } else if (Platform.isFuchsia) {
        platform = 'Fuchsia';
      } else if (Platform.isWindows) {
        platform = 'Windows';
      } else {
        platform = 'Android';
      }
      // platform = 'Unknown';
    } else {
      platform = "WEB";
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }
}
