import 'package:pdp_parsing/model/created_emp_model.dart';

class EmpCreate {
  String status;
  String message;
  CreatedEmp data;

  EmpCreate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = CreatedEmp.fromMap(json['data']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}
