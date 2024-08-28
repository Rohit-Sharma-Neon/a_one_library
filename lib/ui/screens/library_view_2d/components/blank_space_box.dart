import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlankSpaceBox extends StatelessWidget {
  final double? size;
  final Color? boxColor;
  const BlankSpaceBox({super.key, this.size, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/(size??10),
      height: Get.width/(size??10),
      color: boxColor??Colors.transparent,
    );
  }
}
