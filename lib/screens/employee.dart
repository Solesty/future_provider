import 'package:flutter/material.dart';
import 'package:future_provider/models/employee.dart';
import 'package:future_provider/services/employee_service.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatelessWidget {
  final EmployeeService employeeService = new EmployeeService();

  final int id;
  final String name;

  EmployeePage({Key key, @required this.id, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureProvider<Employee>(
        create: (context) => employeeService.fetchEmployee(id),
        child: Center(
          child: Consumer<Employee>(builder: (context, employee, widget) {
            return (employee != null)
                ? Text("Employee Phone: ${employee.phone}")
                : CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
