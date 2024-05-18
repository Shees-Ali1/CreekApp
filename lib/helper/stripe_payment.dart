import 'dart:convert';
import 'package:creekapp/const/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

import '../controller/wallet_controller.dart';

class StripePaymentMethod {
  final WalletController walletController = Get.put(WalletController());

  Map<String, dynamic>? paymentIntents;
  String secretKey="sk_test_51OnVQyCQaWi7YOjCkjZPjAVIcYc3WwAh5tUjx0NiTrVEMj0AcicGqxFoS7wrHWN4Y6fXiubOYcD53Uc6DDBXOICH00xTSJHCGr";
  String calculateAmount(String amount) {
    try {
      // Trim any leading or trailing whitespaces
      amount = amount.trim();

      // Remove any non-numeric characters
      amount = amount.replaceAll(RegExp(r'[^0-9.]'), '');

      // Parse the amount as a double
      final doubleAmount = double.parse(amount);

      // Convert the amount to cents (multiply by 100)
      final result = (doubleAmount * 100).toInt().toString();

      return result;
    } catch (e) {
      print('Error parsing amount: $e');
      // Handle the error appropriately (e.g., return a default value or throw an exception)
      return '0';
    }
  }

  Future<void> payment(String amount) async {
    print('payment method call here');

    /// creating payments intent
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': 'USD',
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $secretKey', //here will be the secret keys
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body);

      paymentIntents = jsonDecode(response.body);
      print("payment intents here");
      print(paymentIntents);
    } catch (e) {
      throw Exception(e.toString());
    }

    ///initialize payments sheet
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                setupIntentClientSecret: secretKey,
                paymentIntentClientSecret: paymentIntents!['client_secret'],
                style: ThemeMode.light,
                merchantDisplayName: 'Creek',
                // billingDetails: const BillingDetails(
                //     address: Address(city: 'London', country: 'GB', line1: '', line2: 'line2', postalCode: '', state: 'United Kingdom')
                // ),
                appearance: const PaymentSheetAppearance(
                    primaryButton: PaymentSheetPrimaryButtonAppearance(
                        colors: PaymentSheetPrimaryButtonTheme(
                      dark: PaymentSheetPrimaryButtonThemeColors(
                          background: primaryColor, text: whiteColor),
                      light: PaymentSheetPrimaryButtonThemeColors(
                          background: primaryColor, text: whiteColor),
                    )),
                    colors: PaymentSheetAppearanceColors(
                      background: whiteColor,
                    ),
                    shapes: PaymentSheetShape(
                      borderRadius: BorderSide.strokeAlignCenter,
                    ))))
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    ///Display payment sheet

    try {
      await Stripe.instance.presentPaymentSheet().then((value) async{

     int newamount =   walletController.walletbalance.value + int.parse(amount);
     walletController.walletbalance.value = newamount;
     await walletController.storetopup(newamount);
     await walletController.storetransactionhistory(int.parse(amount),'topup','Topup');
     await walletController.transactionfetch();
     print('newamount $newamount');
     print('newamount ${walletController.walletbalance.value }');
        Get.snackbar("Paid Successfully",'Amount is transferred to your wallet');

      });
    } catch (e) {
      if (kDebugMode) {
        print('payment Error $e');
      }
      Get.snackbar("Error", 'Payment Cancelled');
      throw Exception(e.toString());
    }
  }
}
