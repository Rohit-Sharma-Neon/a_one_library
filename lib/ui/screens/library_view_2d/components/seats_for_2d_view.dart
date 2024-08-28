import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/base_text.dart';
import 'package:learning_project/ui/screens/live_students/controller/live_student_controller.dart';
import 'package:learning_project/ui/screens/live_students/models/student_data_model.dart';
import 'package:learning_project/utils/base_assets.dart';
import 'package:super_tooltip/super_tooltip.dart';

class SeatsFor2dView extends StatelessWidget {
  final int seatNumber;
  SeatsFor2dView({super.key, required this.seatNumber});
  final LiveStudentController liveStudentController = Get.find<LiveStudentController>();
  final SuperTooltipController superTooltipController = SuperTooltipController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // if(!liveStudentController.allottedSeatNumber.contains(seatNumber)){
        //   Get.to( AddStudentScreen(studentSeatNo: seatNumber.toString()));
        // }
      },
      child: ZoomIn(
        child: AbsorbPointer(
          absorbing: !liveStudentController.allottedSeatNumber.contains(seatNumber),
          child: SuperTooltip(
            popupDirection: TooltipDirection.up,
            controller: superTooltipController,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(BaseAssets.icDummyReadingStudent, width: 80),
                const BaseText(value: "Hello"),
              ],
            ),
            backgroundColor: Colors.grey.shade600,
            child: Container(
              alignment: Alignment.center,
              width: Get.width/10,
              height: Get.width/10,
              decoration: BoxDecoration(
                  color: liveStudentController.allottedSeatNumber.contains(seatNumber) ? Colors.grey.shade900 : Colors.green.shade900,
                  border: Border.all(width: 0.4, color: Colors.black)
              ),
              child: BaseText(value: seatNumber.toString()),
            ),
          ),
        ),
      ),
    );
  }
  Future<Widget> popContent() async {
    StudentDataModel studentDataModel;
    liveStudentController.liveStudentList.forEach((val){
      if (val.allottedSeatNo == seatNumber.toString()) {
        studentDataModel = val;
      }
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(BaseAssets.icDummyReadingStudent, width: 80),
        const BaseText(value: "Hello"),
      ],
    );
  }
}
