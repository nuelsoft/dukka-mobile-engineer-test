import 'package:dukka/core/__core.dart';
import 'package:dukka/core/models/employee.dart';
import 'package:dukka/core/services/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController salary = TextEditingController();

  RxBool ready = false.obs;
  RxBool busy = false.obs;
  RxList<Employee> employees = RxList<Employee>();
  Rx<Employee?> current = Rx<Employee?>(null);

  void fetch() {
    employees.value = Core.store.all();
  }

  Future<bool> save() async {
    busy.value = true;
    Employee e = (current.value ?? Employee())
      ..fullName = name.text
      ..phone = phone.text
      ..email = email.text
      ..position = position.text
      ..salary = salary.text;

    if (Core.store.findByEmailOrPhone(e.email!, e.phone!) != null) {
      busy.value = false;
      Logger.error("Employee with specified data already exists!");
      return false;
    }

    await (current.value == null
        ? Core.store.create(e)
        : Core.store.update(e.id!, e));

    fetch();
    busy.value = false;
    return true;
  }

  Future<void> delete() async {
    busy.value = true;
    await Core.store.delete(current.value!.id!);
    fetch();
    busy.value = false;
  }

  void reset() {
    name.clear();
    phone.clear();
    email.clear();
    position.clear();
    salary.clear();
    current.value = null;
  }

  @override
  void onInit() {
    Core.store.initialize().then((_) {
      fetch();
      ready.value = true;
    });
    super.onInit();
  }
}
