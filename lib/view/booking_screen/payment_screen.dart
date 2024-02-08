import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorpayScreeen extends StatefulWidget {
  const RazorpayScreeen({super.key});

  @override
  State<RazorpayScreeen> createState() => _RazorpayScreeenState();
}

class _RazorpayScreeenState extends State<RazorpayScreeen> {
  late Razorpay _razorepay;
  TextEditingController amtcontroller = TextEditingController();

  void openamount(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_mMbA6UvMUpGXUl',
      'amount': amount,
      'name': "Our_Dinny",
      'prefill': {"contact": '1234567890', 'email': 'text@gmail.com'},
      'external': {
        'Wallets': ['paytm']
      }
    };
    try {
      _razorepay.open(options);
    } catch (e) {
      debugPrint('Error:');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment successful${response.paymentId!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment fail${response.message!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: " External wallet${response.walletName!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorepay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorepay = Razorpay();
    _razorepay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorepay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorepay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Advance Bill'),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 242, 242),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 100),
          Image.asset('lib/assets/payment screeen.jpg', width: 200),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Pay advance payment to Confirm your booking ',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                cursorColor: Color.fromARGB(255, 134, 131, 131),
                autofocus: false,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: const InputDecoration(
                  labelText: 'Enter Amount to be paid',
                  labelStyle: TextStyle(
                      fontSize: 15.0, color: Color.fromARGB(255, 22, 21, 21)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 8, 8, 8), width: 1.0)),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                controller: amtcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Amount to be paid';
                  }
                  return null;
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (amtcontroller.text.toString().isNotEmpty) {
                setState(() {
                  int amount = int.parse(amtcontroller.text.toString());
                  openamount(amount);
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(123, 20, 77, 14)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Make payment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
