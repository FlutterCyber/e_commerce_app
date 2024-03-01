import 'package:e_commerce_app/service/logger_service.dart';
import 'package:e_commerce_app/service/shared_pref_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  static const String id = "messages_page";

  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void saveInfo() {
    String name = nameController.text.trim();
    int age = int.parse(ageController.text.trim());
    if (name.isNotEmpty && age != null) {
      SharedPrefService.storeInfo(name: name, age: age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Shared pref",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(hintText: "Age"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveInfo();
                  },
                  child: Text("Save")),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    SharedPrefService.getInfo("myName", "myAge");
                  },
                  child: Text("Load info")),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                   SharedPrefService.removeInfo("myName", "myAge");
                  },
                  child: Text("Remove info")),

            ],
          ),
        ),
      ),
    );
  }
}
