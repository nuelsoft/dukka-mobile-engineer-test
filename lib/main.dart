import 'package:dukka/core/__core.dart';
import 'package:dukka/ui/screens/employee/listing.dart';
import 'package:dukka/ui/screens/employee/new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Core.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Samasys',
      theme: ThemeData(
          visualDensity: VisualDensity.standard,
          textTheme: GoogleFonts.latoTextTheme(),
          primaryColor: Colors.white,
          accentColor: Colors.black),
      initialRoute: EmployeeListing.uri,
      routes: {
        EmployeeListing.uri: (context) => EmployeeListing(),
        CreateNewEmployee.uri: (context) => CreateNewEmployee()
      },
    );
  }
}
