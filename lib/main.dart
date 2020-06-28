import 'package:flutter/material.dart';
import 'package:future_provider/models/employee.dart';
import 'package:future_provider/screens/home.dart';
import 'package:future_provider/services/employee_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final EmployeeService employeeService = EmployeeService();

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Employee>>(
      create: (context) => employeeService.fetchEmployees(),
      catchError: (context, error) {
        print(error.toString());
      },
      child: MaterialApp(
          title: 'Employees',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home()),
    );
  }
}
