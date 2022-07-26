import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:pdp_parsing/model/emp_create_model.dart';
import 'package:pdp_parsing/model/emp_delete_model.dart';
import 'package:pdp_parsing/model/emp_list_model.dart';
import 'package:pdp_parsing/model/emp_update_model.dart';

import '../model/emp_model.dart';
import '../model/empone_model.dart';

class Network {
  Network._();

  static String BASE = 'dummy.restapiexample.com';
  static Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};

  /*  HTTP Apis  */

  static String API_LIST = "/api/v1/employees";
  static String API_EMPLOYEE_BY_ID = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  /*  HTTP Requests  */

  static Future<String?> GET(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    debugPrint("Status Code = ${response.statusCode}");
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    debugPrint("Status Code = ${response.statusCode}");
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    debugPrint("Status Code = ${response.statusCode}");
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    debugPrint("Status Code = ${response.statusCode}");
    return null;
  }

  /*  HTTP Params  */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Employee employee) {
    Map<String, String> params = {
      'name': employee.employee_name ?? "",
      'salary': employee.employee_salary.toString(),
      'age': employee.employee_age.toString(),
    };
    return params;
  }

  static Map<String, String> paramsUpdate(Employee employee) {
    Map<String, String> params = {
      'name': employee.employee_name ?? "",
      'salary': employee.employee_salary.toString(),
      'age': employee.employee_age.toString(),
    };
    return params;
  }

  /*  HTTP Parsing  */

  static EmpList parseEmpList(String response) {
    dynamic map = jsonDecode(response);
    EmpList data = EmpList.fromJson(map);
    return data;
  }

  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpCreate parseEmpCreate(String body) {
    dynamic json = jsonDecode(body);
    EmpCreate data = EmpCreate.fromJson(json);
    return data;
  }

  static EmpUpdate parseEmpUpdate(String body) {
    dynamic json = jsonDecode(body);
    EmpUpdate data = EmpUpdate.fromJson(json);
    return data;
  }

  static EmpDelete parseEmpDelete(String body) {
    dynamic json = jsonDecode(body);
    EmpDelete data = EmpDelete.fromJson(json);
    return data;
  }
}
