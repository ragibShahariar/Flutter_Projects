import 'package:flutter/material.dart';

class Contact{
  Icon image;
  String name;
  String number;
  Contact(this.number, this.name): image = Icon(Icons.person);
}