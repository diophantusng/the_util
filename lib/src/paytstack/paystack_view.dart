import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'paystack_view_controller.dart';
import 'paystack_models.dart';

class PaystackView extends StatelessWidget {
  PaystackView(
      {super.key,
      required this.type,
      required int amount,
      required this.backendUrl,
      required this.paystackPublicKey,
      required this.token})
      : _amount = amount;

  final int _amount;
  final String backendUrl;
  final String paystackPublicKey;
  final String token;
  final String type;

  late final controller = PaymentViewController(
      type: type,
      amount: _amount,
      backendUrl: backendUrl,
      paystackPublicKey: paystackPublicKey,
      token: token);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          PaystackVerifyResponse result = await pay(context, 'Generic Payment');
          debugPrint(result.status.toString());
        },
        child: const Text('Pay'),
      ),
    );
  }

  Future pay(BuildContext context, String title) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 400,
            height: 600,
            child: ValueListenableBuilder(
              valueListenable: controller.busy,
              builder: ((context, value, child) => controller.busy.value
                  ? const Center(child: Text('Loading ...'))
                  : WebView(
                      initialUrl: controller
                          .initResponse.value!.data!.authorization_url!,
                      javascriptMode: JavascriptMode.unrestricted,
                      userAgent: 'Flutter;Webview',
                    )),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                controller.verify().then((value) =>
                    Navigator.of(context).pop(controller.verifyResponse.value));
              },
            ),
          ],
        );
      },
    );
  }
}
