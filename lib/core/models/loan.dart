class Loan {
  String month;
  String borrowed;
  String receivable;

  Loan(
      {required this.month, required this.borrowed, required this.receivable});
}

class LoanRecord {
  String year;
  List<Loan> record;

  LoanRecord({required this.year, required this.record});

  static List<LoanRecord> mock() {
    return <LoanRecord>[
      LoanRecord(year: "2021", record: [
        Loan(month: "FEB", borrowed: "USD1,000", receivable: "USD20,000"),
        Loan(month: "JAN", borrowed: "USD4,000", receivable: "USD25,000")
      ]),
      LoanRecord(year: "2019", record: [
        Loan(month: "DEC", borrowed: "USD13,000", receivable: "USD60,000"),
        Loan(month: "NOV", borrowed: "USD9,000", receivable: "USD28,000")
      ])
    ];
  }
}
