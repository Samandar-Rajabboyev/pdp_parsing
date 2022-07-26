class Employee {
  int? id;
  String? employee_name;
  num? employee_salary;
  int? employee_age;
  String? profile_image;

  Employee(
      {required this.id,
      required this.employee_name,
      required this.employee_salary,
      required this.employee_age,
      required this.profile_image});

  Employee.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        employee_name = map['employee_name'],
        employee_salary = map['employee_salary'],
        employee_age = map['employee_age'],
        profile_image = map['profile_image'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'employee_name': employee_name,
        'employee_salary': employee_salary,
        'employee_age': employee_age,
        'profile_image': profile_image,
      };
}
