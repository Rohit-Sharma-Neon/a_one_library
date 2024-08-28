import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_text.dart';
import 'package:learning_project/ui/screens/live_students/controller/live_student_controller.dart';
import 'package:learning_project/utils/base_variables.dart';

import 'components/blank_space_box.dart';
import 'components/seats_for_2d_view.dart';

class LibraryView2d extends StatefulWidget {
  const LibraryView2d({super.key});

  @override
  State<LibraryView2d> createState() => _LibraryView2dState();
}

class _LibraryView2dState extends State<LibraryView2d> {
  LiveStudentController liveStudentController = Get.find<LiveStudentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "2D View",
        actions: [
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(99)
              ),
            ),
          ),
          FadeInDown(
              duration: const Duration(milliseconds: 400),
              child: const BaseText(value: "Available", color: Colors.white, leftMargin: 5)),
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(99)
              ),
            ),
          ),
          FadeInDown(
              duration: const Duration(milliseconds: 400),
              child: const BaseText(value: "Booked", color: Colors.white, leftMargin: 5, rightMargin: horizontalScreenPadding,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SeatsFor2dView(seatNumber: 41),
                const Spacer(),
                SeatsFor2dView(seatNumber: 35),
                SeatsFor2dView(seatNumber: 29),
                const Spacer(),
                SeatsFor2dView(seatNumber: 22),
                SeatsFor2dView(seatNumber: 12),
                const Spacer(),
                SeatsFor2dView(seatNumber: 1),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 42),
                const Spacer(),
                SeatsFor2dView(seatNumber: 36),
                SeatsFor2dView(seatNumber: 30),
                const Spacer(),
                SeatsFor2dView(seatNumber: 23),
                SeatsFor2dView(seatNumber: 13),
                const Spacer(),
                SeatsFor2dView(seatNumber: 2),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 44),
                const Spacer(),
                SeatsFor2dView(seatNumber: 37),
                SeatsFor2dView(seatNumber: 31),
                const Spacer(),
                SeatsFor2dView(seatNumber: 24),
                SeatsFor2dView(seatNumber: 14),
                const Spacer(),
                SeatsFor2dView(seatNumber: 3),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 45),
                const Spacer(),
                SeatsFor2dView(seatNumber: 38),
                const BlankSpaceBox(),
                const Spacer(),
                SeatsFor2dView(seatNumber: 25),
                SeatsFor2dView(seatNumber: 15),
                const Spacer(),
                SeatsFor2dView(seatNumber: 4),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 46),
                const Spacer(),
                SeatsFor2dView(seatNumber: 39),
                SeatsFor2dView(seatNumber: 32),
                const Spacer(),
                SeatsFor2dView(seatNumber: 26),
                SeatsFor2dView(seatNumber: 16),
                const Spacer(),
                SeatsFor2dView(seatNumber: 5),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 47),
                const Spacer(),
                SeatsFor2dView(seatNumber: 40),
                SeatsFor2dView(seatNumber: 33),
                const Spacer(),
                SeatsFor2dView(seatNumber: 27),
                SeatsFor2dView(seatNumber: 17),
                const Spacer(),
                SeatsFor2dView(seatNumber: 6),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 48),
                const Spacer(),
                SeatsFor2dView(seatNumber: 41),
                SeatsFor2dView(seatNumber: 34),
                const Spacer(),
                SeatsFor2dView(seatNumber: 28),
                SeatsFor2dView(seatNumber: 18),
                const Spacer(),
                SeatsFor2dView(seatNumber: 7),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 49),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                SeatsFor2dView(seatNumber: 19),
                const Spacer(),
                SeatsFor2dView(seatNumber: 8),
              ],
            ),
            Row(
              children: [
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                SeatsFor2dView(seatNumber: 20),
                const Spacer(),
                SeatsFor2dView(seatNumber: 9),
              ],
            ),
            Row(
              children: [
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                SeatsFor2dView(seatNumber: 21),
                const Spacer(),
                SeatsFor2dView(seatNumber: 10),
              ],
            ),
            Row(
              children: [
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                SeatsFor2dView(seatNumber: 11),
              ],
            ),
            const Divider(height: 0, thickness: 2),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 50),
                const Spacer(),
                SeatsFor2dView(seatNumber: 58),
                SeatsFor2dView(seatNumber: 70),
                const Spacer(),
                SeatsFor2dView(seatNumber: 71),
                SeatsFor2dView(seatNumber: 84),
                const Spacer(),
                SeatsFor2dView(seatNumber: 85),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 51),
                const Spacer(),
                SeatsFor2dView(seatNumber: 59),
                SeatsFor2dView(seatNumber: 69),
                const Spacer(),
                SeatsFor2dView(seatNumber: 72),
                SeatsFor2dView(seatNumber: 83),
                const Spacer(),
                SeatsFor2dView(seatNumber: 86),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 52),
                const Spacer(),
                SeatsFor2dView(seatNumber: 60),
                SeatsFor2dView(seatNumber: 68),
                const Spacer(),
                SeatsFor2dView(seatNumber: 73),
                SeatsFor2dView(seatNumber: 82),
                const Spacer(),
                SeatsFor2dView(seatNumber: 87),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 53),
                const Spacer(),
                SeatsFor2dView(seatNumber: 61),
                SeatsFor2dView(seatNumber: 67),
                const Spacer(),
                SeatsFor2dView(seatNumber: 74),
                SeatsFor2dView(seatNumber: 81),
                const Spacer(),
                SeatsFor2dView(seatNumber: 88),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 54),
                const Spacer(),
                SeatsFor2dView(seatNumber: 62),
                const BlankSpaceBox(),
                const Spacer(),
                SeatsFor2dView(seatNumber: 75),
                SeatsFor2dView(seatNumber: 80),
                const Spacer(),
                SeatsFor2dView(seatNumber: 89),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 55),
                const Spacer(),
                SeatsFor2dView(seatNumber: 63),
                SeatsFor2dView(seatNumber: 66),
                const Spacer(),
                SeatsFor2dView(seatNumber: 76),
                SeatsFor2dView(seatNumber: 79),
                const Spacer(),
                SeatsFor2dView(seatNumber: 90),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 56),
                const Spacer(),
                SeatsFor2dView(seatNumber: 64),
                SeatsFor2dView(seatNumber: 65),
                const Spacer(),
                SeatsFor2dView(seatNumber: 77),
                SeatsFor2dView(seatNumber: 78),
                const Spacer(),
                SeatsFor2dView(seatNumber: 91),
              ],
            ),
            Row(
              children: [
                SeatsFor2dView(seatNumber: 57),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                const BlankSpaceBox(),
                const BlankSpaceBox(),
                const Spacer(),
                SeatsFor2dView(seatNumber: 92),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
