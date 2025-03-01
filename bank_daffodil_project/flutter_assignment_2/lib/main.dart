import 'dart:convert';
import 'package:api/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ProductCard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List users = [];

  Future<void> fetchUsers() async {
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    setState(() {
      users = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users on widget load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("API"),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(users[index]["name"][0]), // Show first letter
                ),
                title: Text(
                  "${users[index]["name"]}",
                  style:
                  TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text("Username: ${users[index]["username"]}",
                        style: TextStyle(color: Colors.black38)),
                    Text("Email: ${users[index]["email"]}",
                        style: TextStyle(color: Colors.black38)),
                    Text("Phone: ${users[index]["phone"]}",
                        style: TextStyle(color: Colors.black38)),
                    Text("Website: ${users[index]["website"]}",
                        style: TextStyle(color: Colors.black38)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
