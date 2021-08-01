import 'package:dukka/core/controllers/employee.dart';
import 'package:dukka/core/models/employee.dart';
import 'package:dukka/core/services/store.dart';
import 'package:get/get.dart';

class Core {
  /// Initialize the core. This Injects services and controllers in to the GET DI system.
  static initialize() {
    Get.put(Store<Employee>(
        namespace: "employees",
        serializer: (Map<String, dynamic> json) {
          return Employee.from(json);
        }));

    Get.put(EmployeeController());
  }

  static Store<Employee> get store => Get.find();

  static EmployeeController get employeeController => Get.find();
}
