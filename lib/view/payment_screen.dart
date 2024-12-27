import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/service/stripe_service.dart';
import 'package:getx_basics/view/news_page.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String amount = "50000";
  String currency = "USD";

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await StripeService.initPaymentSheet(amount, currency);
                  await StripeService.presentPaymentSheet();
                  Get.snackbar('Success', "Payment Successful!");
                  Get.offAll(() => const NewsPage());
                } catch (e) {
                  print('Payment error: ${e.toString()}');
                }
              },
              child: const Text("Pay now"),
            ),
          ),
        ],
      ),
    );
  }
}
