import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/model/payment.dart';

class WalletController extends ChangeNotifier {
  PaymentMethod _paymentType = paymentMethod[0];
  final TextEditingController naira = TextEditingController();
  TextEditingController _token = TextEditingController();
  // getter to get the selected paymentType
  PaymentMethod get paymentType => _paymentType;

  TextEditingController get tokenRate => _token;
  // Add PaymentMethod
  void selectPaymentMethod(PaymentMethod paymentType, context) {
    _paymentType = paymentType;
    notifyListeners();
    Navigator.pop(context);
  }

  void tokenEquivalent() {
    if (naira.text.isEmpty) {
      _token.clear();
    } else {
      var token = int.parse(naira.text) / 0.554;
      _token = TextEditingController(text: token.toStringAsFixed(3));
    }
    notifyListeners();
  }

//
}
