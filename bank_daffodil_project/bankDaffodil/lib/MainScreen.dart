import 'package:bank_daffodil_project/login_signup/login_signup.dart';
import 'package:bank_daffodil_project/screen/Deposit.dart';
import 'package:bank_daffodil_project/screen/Transactions.dart';
import 'package:bank_daffodil_project/screen/UseCard.dart';
import 'package:bank_daffodil_project/screen/withdraw.dart';
import 'package:bank_daffodil_project/widgets/EndDrawer.dart';
import 'package:bank_daffodil_project/widgets/Footer.dart';
import 'package:flutter/material.dart';
import 'package:bank_daffodil_project/widgets/space.dart';
import 'package:bank_daffodil_project/widgets/header.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  double currentBalance = 200560;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        endDrawer: EndDrawer(context),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: swm(context, .05),
                right: swm(context, .05),
                bottom: swm(context, .05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  header(),
                  SizedBox(
                    height: shm(context, .015),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xfff2e916),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Image.network(
                                height: shm(context, .08),
                                "https://avatars.githubusercontent.com/u/132939355?v=4"),
                          ),
                          Text(
                            "Ragib Shahariar",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text("status: active "),
                              Container(
                                height: 13,
                                width: 13,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightGreenAccent,
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Center(
                                  child: Text(
                                    "✓",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: swm(context, .05),
                      ),
                      Container(
                        padding: EdgeInsets.all(14),
                        height: shm(context, .13),
                        width: swm(context, .5),
                        decoration: BoxDecoration(
                          color: Color(0xfffef9c6),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 2,
                            color: Color(0xfff2e916),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Usable Balance: ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(shm(context, .005)),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        // Shadow color
                                        offset: Offset(0, 2),
                                        // Horizontal & Vertical offset
                                        blurRadius: 4,
                                        // Blur effect
                                        spreadRadius: 0, // Spread of the shadow
                                      )
                                    ],
                                    color: Color(0xfff2e916),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  " ${widget.currentBalance.toString()} taka ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xfffef9c6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Withdraw(currentBalance: widget.currentBalance),
                                  ),
                                );
                              },
                              child: Text("Withdraw"),
                            ),
                          ),
                          SizedBox(width: 18,),
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Deposit(currentBalance: widget.currentBalance,),
                                  ),
                                );
                              },
                              child: Text("Deposit"),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UseCard(),
                                  ),
                                );
                              },
                              child: Text("Use Card"),
                            ),
                          ),
                          SizedBox(width: 18,),
                          SizedBox(
                            width: 140,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Transactions(),
                                  ),
                                );
                              },
                              child: Text("transaction history", style: TextStyle(fontSize: 15),),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 6,),
                      Image.asset('assets/images/card.png'),
                      Footer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
