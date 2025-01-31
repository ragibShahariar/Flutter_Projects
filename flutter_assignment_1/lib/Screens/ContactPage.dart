import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../model/Contact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<Contact> contactList = [];

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> contactKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          children: [
            Form(
              key: contactKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact name must be given";
                      }
                      if (value.length > 20) {
                        return "Contact name cannot be more than 20 characters";
                      }
                      if (value.contains(RegExp(r'\d'))) {
                        return "Name cannot contain numbers";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact number must be given";
                      }
                      if (value.length > 12) {
                        return "Contact number cannot be more than 12 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (contactKey.currentState!.validate()) {
                          setState(() {
                            Contact newContact = Contact(
                                numberController.text, nameController.text);
                            contactList.add(newContact);
                            nameController.clear(); // text fields will be clear
                            numberController.clear();
                          });
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              // Wrap ListView.builder in Expanded to avoid layout issues
              child: ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, idx) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.w),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      tileColor: Colors.white,
                      leading: Container(
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Color(0xff667c89), Color(0xff83c8f1)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      // Replace with a proper icon
                      title: Text(
                        contactList[idx].name,
                        style: TextStyle(
                            color: Color(0xffFF6347),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contactList[idx].number),
                      trailing: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "Confirmation",
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Are you sure want to delete?"),
                                Text(
                                  "${contactList[idx].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Contact newContact = contactList[idx];
                                    contactList.remove(newContact);
                                    Navigator.pop(context); // Close the dialog
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            const Text('Contact is removed'),
                                        action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              setState(() {
                                                contactList.add(newContact);
                                              });
                                            }),
                                      ),
                                    );
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
