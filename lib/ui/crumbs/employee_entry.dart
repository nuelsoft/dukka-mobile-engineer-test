import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukka/core/__core.dart';
import 'package:dukka/core/models/employee.dart';
import 'package:dukka/core/services/logger.dart';
import 'package:dukka/ui/screens/employee/view.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum EmployeeEntryOption { edit, delete }

class EmployeeEntry extends StatefulWidget {
  final Employee employee;
  final bool clickable;

  const EmployeeEntry(this.employee, {Key? key, this.clickable = true})
      : super(key: key);

  @override
  _EmployeeEntryState createState() => _EmployeeEntryState();
}

class _EmployeeEntryState extends State<EmployeeEntry> {
  Offset? _tapPosition;

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _showCustomMenu() {
    final RenderBox? overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    showMenu(
            context: context,
            items: <PopupMenuEntry<EmployeeEntryOption>>[
              PopupMenuItem(
                value: EmployeeEntryOption.edit,
                child: ListTile(
                  title: Text("Edit"),
                  leading: Icon(Icons.edit),
                ),
              ),
              PopupMenuItem(
                value: EmployeeEntryOption.delete,
                child: ListTile(
                  title: Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: Icon(Icons.delete, color: Colors.red),
                ),
              )
            ],
            position: RelativeRect.fromRect(_tapPosition! & const Size(40, 40),
                Offset.zero & overlay!.size))
        .then((value) {
      if (value != null) {
        if (value == EmployeeEntryOption.delete) {
          Core.employeeController.current.value = widget.employee;
          Core.employeeController.delete();
        } else
          Logger.info("This feature isn't supported yet", title: "Unsupported");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: InkWell(
        onLongPress: !widget.clickable
            ? null
            : () {
                _showCustomMenu();
              },
        onTap: !widget.clickable
            ? null
            : () {
                Core.employeeController.current.value = widget.employee;
                Get.toNamed(EmployeeView.uri);
              },
        onTapDown: !widget.clickable ? null : _storePosition,
        child: Row(
          children: [
            Container(
                width: .3.timesWidth,
                height: 150,
                child: (widget.employee.image != null)
                    ? CachedNetworkImage(
                        imageUrl: widget.employee.image!,
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
                    widget.employee.fullName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Space.Y(20),
                  Text(
                    widget.employee.position!,
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                  Space.Y(5),
                  Text(
                    widget.employee.phone!,
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                  Space.Y(5),
                  Text(
                    widget.employee.email!,
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
