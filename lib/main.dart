import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 var _razorpay = Razorpay();

 @override
  void initState() {
    // TODO: implement initState
   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

 void _handlePaymentSuccess(PaymentSuccessResponse response) {
   // Do something when payment succeeds
 }

 void _handlePaymentError(PaymentFailureResponse response) {
   // Do something when payment fails
 }

 void _handleExternalWallet(ExternalWalletResponse response) {
   // Do something when an external wallet is selected
 }

 @override
  void dispose(){
   _razorpay.clear();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
            onPressed: (){
              var options = {
                'key': 'rzp_test_ichWp9a9vyAZm7',
                'amount': 50000, //in the smallest currency sub-unit.
                'name': 'Acme Corp.',
                'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                'description': 'Fine T-Shirt',
                'timeout': 60, // in seconds
              };
              _razorpay.open(options);
            },
            child: Text("Pay 100"),
        ),
      ),
    );
  }
}

