import 'package:flutter/material.dart';

import '../widgets/EndDrawer.dart';
import '../widgets/header.dart';
import '../widgets/space.dart';

class Deposit extends StatefulWidget {
  Deposit({super.key, required this.currentBalance});

  double currentBalance;

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {

  @override
  Widget build(BuildContext context) {
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
                              "Withdraw now",
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
                              "Usable Balance:",
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
