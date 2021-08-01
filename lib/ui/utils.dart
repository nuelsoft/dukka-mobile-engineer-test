import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Space extends StatelessWidget {
  final double y;
  final double x;

  const Space.X(this.x, {Key? key})
      : this.y = 0,
        super(key: key);

  const Space.Y(this.y, {Key? key})
      : this.x = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: y,
      width: x,
    );
  }
}


extension screenCalculator on double {
  double get timesHeight => MediaQuery.of(Get.context!).size.height * this;
  double get timesWidth => MediaQuery.of(Get.context!).size.width * this;

}