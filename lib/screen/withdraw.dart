import 'package:bank_daffodil_project/screen/MobileOrCrypto.dart';
import 'package:bank_daffodil_project/widgets/space.dart';
import 'package:flutter/material.dart';
import '../widgets/EndDrawer.dart';
import '../widgets/Footer.dart';
import '../widgets/header.dart';

enum MobileBanking { Bkash, Nagad, Upay, Roket }

enum CryptoWallets { BitCoin, Etherium, BNB }

class Withdraw extends StatefulWidget {
  Withdraw({super.key, required this.currentBalance});

  double currentBalance;

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  MobileBanking? _selectedBanking = MobileBanking.Bkash;
  CryptoWallets? _selectedCrypto = CryptoWallets.BitCoin;

  final GlobalKey<FormState> mobileBankingFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cryptoWalletsFormKey = GlobalKey<FormState>();

  final TextEditingController _mobileBankingTextController =
      TextEditingController();
  final TextEditingController _cryptoWalletsTextController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mobileBankingTextController.clear();
    _cryptoWalletsTextController.clear();
  }

  void _onChangedMobileBanking(MobileBanking? value) {
    setState(() {
      _selectedBanking = value;
    });
  }

  void _onChangedCryptoWallets(CryptoWallets? value) {
    setState(() {
      _selectedCrypto = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double currentBalance = 200240;

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
                child: SingleChildScrollView(
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
                                  "${currentBalance.toString()} Taka",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Bank Transfer"),
                                  ),
                                ),
                                SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Use Card"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Color(0xfff2e916),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Withdraw to mobile banking",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Form(
                              key: mobileBankingFormKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black38,
                                                // Shadow color
                                                offset: Offset(0, 2),
                                                // Horizontal & Vertical offset
                                                blurRadius: 4,
                                                // Blur effect
                                                spreadRadius:
                                                    0, // Spread of the shadow
                                              )
                                            ],
                                            color: Color(0xfff2e916),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: DropdownButton(
                                          value: _selectedBanking,
                                          onChanged: (value) {
                                            _onChangedMobileBanking(value);
                                          },
                                          items:
                                              MobileBanking.values.map((value) {
                                            return DropdownMenuItem<
                                                MobileBanking>(
                                              value: value,
                                              child: Text(value.name),
                                            );
                                          }).toList(),
                                          dropdownColor: Color(0xfff2e916),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _mobileBankingTextController,
                                          decoration: InputDecoration(
                                            hintText:
                                                "type your ${_selectedBanking?.name} number",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xfffef9c6)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xfff2e916),
                                                  width: 2),
                                            ),
                                          ),
                                          validator: (number) {
                                            if (number!.isEmpty) {
                                              return "number field cannot be empty";
                                            }
                                            try {
                                              int.parse(number);
                                            } catch (e) {
                                              return "please enter digits";
                                            }
                                            if (number.length < 6) {
                                              return "please give a valid number";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (mobileBankingFormKey.currentState!
                                            .validate()) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MobileOrCrypto(
                                                  balance: currentBalance,
                                                  statusBool: true,
                                                  hashOrNumber:
                                                      _mobileBankingTextController
                                                          .text),
                                            ),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Proceed  "),
                                          Icon(Icons.start),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Color(0xfff2e916),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Withdraw to crypto wallets",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Form(
                              key: cryptoWalletsFormKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black38,
                                                // Shadow color
                                                offset: Offset(0, 2),
                                                // Horizontal & Vertical offset
                                                blurRadius: 4,
                                                // Blur effect
                                                spreadRadius:
                                                    0, // Spread of the shadow
                                              )
                                            ],
                                            color: Color(0xfff2e916),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: DropdownButton(
                                          value: _selectedCrypto,
                                          onChanged: (value) {
                                            _onChangedCryptoWallets(value);
                                          },
                                          items:
                                              CryptoWallets.values.map((value) {
                                            return DropdownMenuItem<
                                                CryptoWallets>(
                                              value: value,
                                              child: Text(value.name),
                                            );
                                          }).toList(),
                                          dropdownColor: Color(0xfff2e916),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              _cryptoWalletsTextController,
                                          decoration: InputDecoration(
                                            hintText:
                                                "type your ${_selectedCrypto?.name} hash code",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xfffef9c6)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xfff2e916),
                                                  width: 2),
                                            ),
                                          ),
                                          validator: (hash){
                                            if (hash!.isEmpty){
                                              return "please enter a hash code";
                                            }
                                            if (hash.length < 6){
                                              return "please enter a valid hash";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (cryptoWalletsFormKey.currentState!.validate()){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MobileOrCrypto(
                                                    balance: currentBalance,
                                                    statusBool: false,
                                                    hashOrNumber:
                                                    _cryptoWalletsTextController
                                                        .text,
                                                  ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Proceed  "),
                                          Icon(Icons.start),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
