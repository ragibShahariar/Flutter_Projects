import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';
import 'package:sizer/sizer.dart';
import '../widgets/EndDrawer.dart';
import '../widgets/header.dart';
import '../widgets/space.dart';

class Deposit extends StatefulWidget {
  Deposit({super.key, required this.currentBalance});

  double currentBalance;
  final String accountNumber = "109786552339784";

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _accountNumberController =
        TextEditingController(text: widget.accountNumber);

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
                height: shm(context, .57),
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
                        children: [
                          TextField(
                            controller: _accountNumberController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: "Account Number",
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
                          SizedBox(height: 2.h,),
                          Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/daffodil_flower.png',
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                              GlassContainer(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 25.h,
                                blurStrengthX: 4,
                                blurStrengthY: 4,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Bank Transfer"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
