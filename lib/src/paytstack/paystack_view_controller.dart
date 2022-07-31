import 'package:flutter/material.dart';
import 'paystack_models.dart';
import 'paystack_payment_repository.dart';

class PaymentViewController {
  final int amount;
  final String backendUrl;
  final String paystackPublicKey;
  final String token;
  late final _repo = PaystackPaymentRepository(
      backendUrl: backendUrl,
      paystackPublicKey: paystackPublicKey,
      token: token);

  PaymentViewController(
      {required this.amount,
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
      initResponse.value = await _repo.fetchAccessCodeFrmServer(amount);
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
}
