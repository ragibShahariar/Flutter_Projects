import 'package:bank_daffodil_project/MainScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import 'package:bank_daffodil_project/widgets/space.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    accountNameController.dispose();
    accountNumberController.dispose();
    accountPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sw * .01,
              ),
              header(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: sh * .58,
                width: sw * .9,
                decoration: BoxDecoration(
                    color: Color(0xfffef9c6),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    SizedBox(
                      height: sh * .04,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        swm(context, .05),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfff2e916),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: sh * .05,
                            child: Center(
                              child: Text(
                                "Log in to your account",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black87),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: accountNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Account Name"),
                                    hintText: 'enter account holder name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (name) {
                                    if (name == null || name.isEmpty) {
                                      return "account name must be given";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: accountNumberController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Account Number"),
                                    hintText: 'enter account number ',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (number) {
                                    if (number == null ||
                                        number.isEmpty ||
                                        number.length < 8 ||
                                        !RegExp(r'^\d+$').hasMatch(number)) {
                                      return "8 digit account number must be given";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: accountPasswordController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Log in Password"),
                                    hintText: 'enter password ',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return "password can not be empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MainScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: shm(context, .02),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('forgot password?'),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Click here",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: shm(context, .03),
              ),
              Center(
                child: Column(
                  children: [
                    Text("helpline 𝟬𝟭𝟳𝟰𝟵𝟴𝟲𝟲𝟳𝟬𝟯", style: TextStyle(fontSize: 14),),
                    SizedBox(
                      height: shm(context, .01),
                    ),
                    Text("ⓒ copywrite 2027", style: TextStyle(color: Colors.grey),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

