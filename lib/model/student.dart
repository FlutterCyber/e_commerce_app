class Student {
  String? id;
  String? name;
  int? age;
  int? course;

  Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.course});

  Student.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        age = map['age'],
        course = map['course'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'course': course,
      };
}
