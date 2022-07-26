class CreatedEmp {
  String? name;
  String? salary;
  String? age;
  int? id;

  CreatedEmp({required this.id, required this.name, required this.salary, required this.age});

  CreatedEmp.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        salary = map['salary'],
        age = map['age'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'salary': salary,
        'age': age,
      };
}
