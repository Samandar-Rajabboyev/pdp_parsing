import 'package:pdp_parsing/model/emp_model.dart';

class EmpOne {
  String status;
  String message;
  Employee data;

  EmpOne.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Employee.fromMap(json['data']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}
