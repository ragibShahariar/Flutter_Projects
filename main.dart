import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Add Employee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Salary'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add Employee"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
