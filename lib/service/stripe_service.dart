import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  static String apiBase = "https://api.stripe.com/v1";
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret =
      "sk_test_51MWx8OAVMyklfe3C3gP4wKOhTsRdF6r1PYhhg1PqupXDITMrV3asj5Mmf0G5F9moPL6zNfG3juK8KHgV9XNzFPlq00wmjWwZYA";
  static Map<String, String> headers = {
    "Authorization": 'Bearer ${StripeService.secret}',
    'Content-type': 'application/x-www-form-urlencoded',
  };

  static init() {
    Stripe.publishableKey =
        "pk_test_51MWx8OAVMyklfe3CsjEzA1CiiY0XBTlHYbZ8jQlGtVFIwQi4aNeGv8J1HUw4rgSavMTLzTwgn0XRlwoTVRFXyu2h00mRUeWmAf";
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.instance.applySettings();
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(Uri.parse(StripeService.paymentApiUrl),
          body: body, headers: StripeService.headers);

      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent');
      }

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception("Error creating payment intent: ${e.toString()}");
    }
  }

  static Future<void> initPaymentSheet(String amount, String currency) async {
    try {
      final paymentIntent = await createPaymentIntent(amount, currency);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: "Dear Programmer",
          style: ThemeMode.light,
        ),
      );
    } catch (e) {
      throw Exception("Error initializing payment sheet: ${e.toString()}");
    }
  }

  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception("Error presenting payment sheet: ${e.toString()}");
    }
  }
}
