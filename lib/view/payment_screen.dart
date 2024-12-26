import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/service/stripe_service.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String amount = "5000";
  String currency = "USD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe payment"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                await StripeService.initPaymentSheet(amount, currency);
                await StripeService.presentPaymentSheet();
              } catch (e) {
                Get.snackbar('error', "Error:${e.toString()}");
                print(e);
              }
            },
            child: const Text("Pay"),
          ),
        ],
      ),
    );
  }
}
