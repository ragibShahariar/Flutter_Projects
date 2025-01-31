import 'package:flutter/material.dart';

Widget header(){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/daffodil_flower.png',
        height: 94,
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        "Bank Daffodil",
        style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "end to end encrypted",
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}