import 'package:flutter/cupertino.dart';

double shm(BuildContext context, double sh) {
  final screenHeight = MediaQuery.of(context).size.height;
  return screenHeight * sh;
}

double swm(BuildContext context, double sw) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * sw;
}