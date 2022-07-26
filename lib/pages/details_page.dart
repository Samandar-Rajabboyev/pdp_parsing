import 'package:flutter/material.dart';
import 'package:pdp_parsing/model/emp_model.dart';
import 'package:pdp_parsing/model/empone_model.dart';

import '../services/network_service.dart';

class DetailsPage extends StatefulWidget {
  Employee employee;
  DetailsPage({Key? key, required this.employee}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Employee? emp;
  void _apiEmployee(Employee employee) {
    Network.GET(Network.API_EMPLOYEE_BY_ID + employee.id.toString(), Network.paramsEmpty()).then((response) {
      showData(response);
    });
  }

  void showData(String? res) {
    if (res != null) {
      EmpOne data = Network.parseEmpOne(res);
      setState(() {
        emp = data.data;
      });
    } else {
      debugPrint("Try Again");
    }
  }

  @override
  void initState() {
    _apiEmployee(widget.employee);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${emp?.employee_name ?? ""}(${emp?.employee_age})',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                '${emp?.employee_salary} \$',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
