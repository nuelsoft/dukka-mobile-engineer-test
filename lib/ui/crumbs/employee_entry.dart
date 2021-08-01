import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukka/core/models/employee.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';

class EmployeeEntry extends StatelessWidget {
  final Employee employee;

  const EmployeeEntry(this.employee, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Container(
              width: .3.timesWidth,
              height: 150,
              child: (employee.image != null)
                  ? CachedNetworkImage(
                      imageUrl: employee.image!,
                      fit: BoxFit.cover,
                      placeholder: (context, _) => Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            "...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(Icons.account_circle),
                    )),
          Space.X(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.fullName!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Space.Y(20),
                Text(
                  employee.position!,
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                ),
                Space.Y(5),
                Text(
                  employee.phone!,
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                ),
                Space.Y(5),
                Text(
                  employee.email!,
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
