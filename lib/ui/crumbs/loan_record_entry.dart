import 'package:dukka/core/models/loan.dart';
import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';

class LoanRecordEntry extends StatelessWidget {
  final LoanRecord loan;

  const LoanRecordEntry(this.loan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(loan.year),
              Space.X(10),
              Expanded(
                  child: Divider(
                thickness: 1,
              ))
            ],
          ),
          for (Loan record in loan.record)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      width: .23.timesWidth,
                      height: 80,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.today,
                              color: Colors.grey,
                              size: 30,
                            ),
                            Space.Y(5),
                            Text(
                              record.month,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Space.X(20),
                    Expanded(
                        child: Column(
                      children: [
                        for (Map<String, dynamic> data in [
                          {"title": "BORROWED", "value": record.borrowed},
                          {"title": "RECEIVABLE", "value": record.receivable}
                        ]) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Expanded(child: Text("${data["title"]}:")),
                                Expanded(child: Text(data["value"]))
                              ],
                            ),
                          ),
                          if (data["title"] != "RECEIVABLE")
                            Divider(
                              height: 0,
                            )
                        ]
                      ],
                    ))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
