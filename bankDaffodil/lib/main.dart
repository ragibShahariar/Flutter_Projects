import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'MainScreen.dart';
import 'login_signup/login_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType){
      return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: Color(0xfff2e916),
                foregroundColor: Colors.black87,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              floatingLabelStyle: TextStyle(color: Colors.black54),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff2e916)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: Base(
            LoggedIn: false,
          ));
    },);
  }
}

class Base extends StatefulWidget {
  const Base({required this.LoggedIn, super.key});

  final LoggedIn;

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return widget.LoggedIn ? MainScreen() : LoginSignup();
  }
}
