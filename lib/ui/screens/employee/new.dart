import 'package:dukka/core/__core.dart';
import 'package:dukka/ui/shared/button.dart';
import 'package:dukka/ui/shared/input.dart';
import 'package:dukka/ui/shared/page.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewEmployee extends StatelessWidget {
  static final String uri = "/employees/new";
  static final GlobalKey<FormState> _form = GlobalKey<FormState>();

  const CreateNewEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScaffold(
        body: Form(
          key: _form,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Space.Y(20),
              Text(
                "CREATE EMPLOYEE PROFILE",
                style: TextStyle(fontSize: 17),
              ),
              Space.Y(30),
              InputField(
                'Full Name',
                controller: Core.employeeController.name,
                capitalization: TextCapitalization.words,
              ),
              Space.Y(20),
              InputField(
                'Phone Number',
                controller: Core.employeeController.phone,
                inputType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => !value!.isPhoneNumber
                    ? "Phone number is poorly formatted"
                    : null,
              ),
              Space.Y(20),
              InputField(
                "Email",
                controller: Core.employeeController.email,
                inputType: TextInputType.emailAddress,
                validator: (value) =>
                    !value!.isEmail ? "Email is poorly formatted" : null,
              ),
              Space.Y(20),
              InputField(
                "Position",
                controller: Core.employeeController.position,
                capitalization: TextCapitalization.words,
              ),
              Space.Y(20),
              InputField(
                "Salary (USD)",
                controller: Core.employeeController.salary,
                inputType: TextInputType.number,
                action: TextInputAction.done,
                validator: (value) =>
                    !value!.isNumericOnly ? "Please enter valid amount" : null,
              ),
              Space.Y(30),
              BTN(
                text: "Save",
                processing: Core.employeeController.busy.value,
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    Core.employeeController.save().then((success) {
                      if (success) Get.back();
                    });
                  }
                },
              ),
              Space.Y(40)
            ],
          ),
        ),
      ),
    );
  }
}
