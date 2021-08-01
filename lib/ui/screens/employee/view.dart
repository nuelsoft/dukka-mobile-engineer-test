import 'package:dukka/core/__core.dart';
import 'package:dukka/core/models/loan.dart';
import 'package:dukka/ui/crumbs/employee_entry.dart';
import 'package:dukka/ui/crumbs/loan_record_entry.dart';
import 'package:dukka/ui/shared/page.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';

class EmployeeView extends StatelessWidget {
  static final String uri = "/employee/{id}/view";

  const EmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Space.Y(20),
          EmployeeEntry(
            Core.employeeController.current.value!,
            clickable: false,
          ),
          Space.Y(20),
          Text(
            "LOAN RECORD",
            style: TextStyle(fontSize: 17),
          ),
          Space.Y(20),
          for (LoanRecord loanRecord in LoanRecord.mock())
            LoanRecordEntry(loanRecord),
          Space.Y(50),
        ],
      ),
    );
  }
}
