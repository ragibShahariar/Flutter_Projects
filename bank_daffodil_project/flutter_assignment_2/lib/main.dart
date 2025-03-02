/*
Assalamualikum brother Taufiq.
I am using some code suggestion which was enabled by AI editor (idx) suggestions can not be off.
"pertialy developed in google project idx" but i did not use promt codding though
my pc had some issues and my semester mid
term exam of Daffodil university is running so its difficult to 
went store right now.
I will try to make the ui better later inshaAllah.
Thank you.
*/

import 'package:myapp/Presentation/UI/screens/ProductCards.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const ProductCard(),
    );
  }
}
