import 'package:dukka/core/__core.dart';
import 'package:dukka/core/models/employee.dart';
import 'package:dukka/ui/crumbs/employee_entry.dart';
import 'package:dukka/ui/screens/employee/new.dart';
import 'package:dukka/ui/shared/button.dart';
import 'package:dukka/ui/shared/page.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeListing extends StatelessWidget {
  static final String uri = "/employees";

  const EmployeeListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScaffold(
        body: (Core.employeeController.employees.isEmpty)
            ? Core.employeeController.ready.value
                ? _NoEmployees(
                    key: key,
                  )
                : Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  Core.employeeController.fetch();
                },
                child: Stack(
                  children: [
                    ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      children: [
                        Space.Y(20),
                        Text(
                          "EMPLOYEES",
                          style: TextStyle(fontSize: 17),
                        ),
                        Space.Y(20),
                        for (Employee employee
                            in Core.employeeController.employees)
                          EmployeeEntry(
                            employee,
                            key: key,
                          ),
                        Space.Y(150),
                      ],
                    ),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          child: Row(
                            children: [
                              Expanded(
                                child: BTN(
                                  text: 'CREATE NEW EMPLOYEE',
                                  onPressed: () {
                                    Core.employeeController.reset();
                                    Get.toNamed(CreateNewEmployee.uri);
                                  },
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _NoEmployees extends StatelessWidget {
  const _NoEmployees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 70),
          Center(
            child: Text(
              "No Employees added yet!",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Space.Y(20),
          BTN(
            text: "Create new",
            onPressed: () {
              Core.employeeController.reset();
              Get.toNamed(CreateNewEmployee.uri);
            },
          )
        ],
      ),
    );
  }
}
