import 'package:e_commerce_app/model/student.dart';
import 'package:e_commerce_app/service/logger_service.dart';
import 'package:e_commerce_app/service/shared_pref_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String id = "search_page";

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  Future<void> saveObject() async {
    String id = idController.text.trim();
    String name = nameController.text.trim();
    int age = int.parse(ageController.text.trim());
    int course = int.parse(courseController.text.trim());
    if (id.isNotEmpty && name.isNotEmpty && age != null && course != null) {
      Student student = Student(id: id, name: name, age: age, course: course);

      bool isSaved = await SharedPrefService.storeObject(
          myObject: student, objKey: "studentKey");
      LoggerService.warningLogger(isSaved.toString());
    }
  }

  getObject() async {
    Student student = await SharedPrefService.getObject("studentKey");
    LoggerService.warningLogger(student.course.toString());
    // LoggerService.warningLogger(studetnMap['name']);
    // LoggerService.warningLogger(studetnMap['age'].toString());
    // LoggerService.warningLogger(studetnMap['course'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Shared pref OBJECT",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(hintText: "Id"),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                TextField(
                  controller: courseController,
                  decoration: const InputDecoration(hintText: "Course"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await saveObject();
                    },
                    child: Text("Save")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await getObject();
                    },
                    child: Text("Get Object")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Remove info")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
