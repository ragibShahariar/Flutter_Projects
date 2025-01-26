import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_daffodil_project/widgets/space.dart';
import 'package:bank_daffodil_project/login_signup/login_signup.dart';

Widget EndDrawer(BuildContext ctx){
  BuildContext context = ctx;
  return  Drawer(
    backgroundColor: Color(0xfffef9c6),
    child: ListView(
      children: [
        SizedBox(
          height: shm(context, .05),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xfffef9c6)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff2e916),
                  border: Border.all(color: Colors.black54, width: 5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  // Add padding to create space between the image and the border
                  child: ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      height: 80,
                      "https://avatars.githubusercontent.com/u/132939355?v=4",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: shm(context, .02),
              ),
              Text(
                'Ragib Shahariar',
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: shm(context, .02),
              ),
            ],
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Color(0xfffef9c6),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                content: Text("Are you sure want to log out?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSignup()),
                                (Route<dynamic> route) => false);
                      },
                      child: Text("Log Out"))
                ],
              ),
            );
          },
          child: ListTile(
              title: Text(
                "Log out",
                style:
                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Log out from the account."),
              trailing: Icon(Icons.logout)),
        )
      ],
    ),
  );
}