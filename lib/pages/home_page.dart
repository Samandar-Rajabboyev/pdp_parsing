import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_parsing/model/emp_model.dart';
import 'package:pdp_parsing/pages/details_page.dart';
import 'package:pdp_parsing/services/network_service.dart';

import '../model/emp_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = <Employee>[];
  void _apiEmployees() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) {
      showData(response);
    });
  }

  void showData(String? res) {
    if (res != null) {
      EmpList empList = Network.parseEmpList(res);
      setState(() {
        items = empList.data!;
      });
    } else {
      debugPrint("Try Again");
    }
  }

  @override
  void initState() {
    _apiEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) => itemOfList(items[i]),
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => DetailsPage(employee: emp)));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${emp.employee_name ?? ""}(${emp.employee_age})',
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              '${emp.employee_salary} \$',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
