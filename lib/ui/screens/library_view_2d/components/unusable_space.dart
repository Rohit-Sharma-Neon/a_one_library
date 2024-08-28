import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/base_text.dart';

class UnusableSpace extends StatelessWidget {
  final int seatNumber;
  const UnusableSpace({super.key, required this.seatNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width/10,
      height: Get.width/10,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0.4, color: Colors.black)
      ),
      child: BaseText(value: seatNumber.toString()),
    );
  }
}
