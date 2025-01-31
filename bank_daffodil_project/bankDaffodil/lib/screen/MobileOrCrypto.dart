import 'package:bank_daffodil_project/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/Footer.dart';
import '../widgets/space.dart';

class MobileOrCrypto extends StatefulWidget {
  const MobileOrCrypto(
      {super.key,
      required this.balance,
      required this.statusBool,
      required this.hashOrNumber});

  final bool? statusBool;
  final String hashOrNumber;
  final double balance;

  @override
  State<MobileOrCrypto> createState() => _MobileOrCryptoState();
}

class _MobileOrCryptoState extends State<MobileOrCrypto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showAnimation = false; // Variable to control the visibility of Lottie
  late TextEditingController balanceController; // Declare the controller here

  @override
  void initState() {
    super.initState();
    balanceController = TextEditingController(); // Initialize it in initState
  }

  @override
  void dispose() {
    balanceController
        .dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }

  void toggleAnimation(bool value) {
    setState(() {
      showAnimation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        // Wrap the entire body in a scrollable widget
        child: Column(
          children: [
            header(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: swm(context, .05), vertical: shm(context, .02)),
              child: Container(
                padding: EdgeInsets.all(swm(context, .05)),
                clipBehavior: Clip.hardEdge,
                height: shm(context, .57),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xfffef9c6),
                ),
                child: Column(
                  children: [
                    confirmTransfer(
                      context,
                      _formKey,
                      widget.statusBool,
                      widget.hashOrNumber,
                      widget.balance,
                      balanceController,
                      toggleAnimation,
                      showAnimation,
                      widget.hashOrNumber,
                    )
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

Widget confirmTransfer(
  BuildContext ctx,
  GlobalKey<FormState> keyForForm,
  bool? status,
  String? hashOrNumber,
  double curBalance,
  TextEditingController balanceController,
  Function toggleAnimation,
  bool showAnimation,
  String HoN,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Text(
          "Usable Balance",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        ),
        SizedBox(
          height: shm(ctx, .01),
        ),
        Container(
          height: shm(ctx, .05),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xfff2e916),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              "${curBalance.toString()} taka",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: shm(ctx, .01),
        ),
        Text(
          "Enter amount",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: shm(ctx, .01),
        ),
        Form(
          key: keyForForm,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: balanceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount',
                  label: Text("Amount"),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (amount) {
                  if (amount == null || amount.isEmpty) {
                    return "Amount cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: shm(ctx, .02),
              ),
              (showAnimation)
                  ? Lottie.asset(
                      'assets/images/doneTwo.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                      repeat: false,
                    )
                  : Container(
                      height: 150,
                      width: 250,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            colors: [Color(0xffffef00), Color(0xffece43f)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'The amount will be transferred to',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            '$HoN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 22),
                          ),
                        ],
                      )),
                    ),
              SizedBox(
                height: shm(ctx, .01),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onLongPress: () {
                    if (keyForForm.currentState!.validate()) {
                      //after backend confirmation
                      toggleAnimation(true);
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text(
                              "${balanceController.text} taka transferred successfully."),
                        ),
                      ); // Show animation on long press start
                    }
                  },
                  onPressed: () {},
                  child: Text(
                    "Press and hold to transfer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
