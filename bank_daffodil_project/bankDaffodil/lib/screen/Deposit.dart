import 'package:bank_daffodil_project/screen/withdraw.dart';
import 'package:bank_daffodil_project/widgets/Footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';
import 'package:sizer/sizer.dart';
import '../widgets/EndDrawer.dart';
import '../widgets/header.dart';
import '../widgets/space.dart';

enum CryptoWallets { BitCoin, Etherium, BNB }

class Deposit extends StatefulWidget {
  Deposit({super.key, required this.currentBalance});

  double currentBalance;
  final String accountNumber = "109786552339784";
  final String accountHash = "jfgueiodcucxxjhdyhurjod0pop";

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _accountNumberController =
        TextEditingController(text: widget.accountNumber);
    final TextEditingController _accountHashController =
        TextEditingController(text: widget.accountHash);

    final _selectedCryptoValue = CryptoWallets.BitCoin;

    return Scaffold(
      appBar: AppBar(),
      endDrawer: EndDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: swm(context, .05), vertical: shm(context, .02)),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xfffef9c6),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: shm(context, .09),
                          width: swm(context, .5),
                          decoration: BoxDecoration(
                              color: Color(0xfff2e916),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "Deposit now",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Current Balance:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xfff2e916),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                "${widget.currentBalance.toString()} Taka",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(3.w),
                      child: Column(
                        spacing: .1.h,
                        children: [
                          Text(
                            "Account Number",
                            textAlign: TextAlign.center,
                          ),
                          TextField(
                            controller: _accountNumberController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: _accountNumberController.text));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Copied to clipboard"),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.copy),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/daffodil_flower.png',
                                  width: 15.h,
                                ),
                              ),
                              GlassContainer(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 23.h,
                                blurStrengthX: 4,
                                blurStrengthY: 4,
                                child: Column(
                                  children: [
                                    GlassContainer(
                                      height: 15.h,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 0.1.h,
                                        children: [
                                          Text(
                                            'Account holder name: Ragib Shahariar',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          Text(
                                            'Swift Code: BDBD',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          Text(
                                            'Routing Number: 1029384756',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          Text(
                                            'Branch: Dhaka, Bangladesh',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Bank Transfer"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text('Receive from Crypto'),
                          SizedBox(height: 1.h,),
                          TextField(
                            controller: _accountHashController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: _accountNumberController.text));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Copied to clipboard"),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.copy),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
