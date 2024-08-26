import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_project/utils/base_assets.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_variables.dart';

import 'base_text.dart';

class StudentListTile extends StatelessWidget {
  final String studentName, studentSeatNo, studentMobile, dateOfJoining, initialPayment, address;
  const StudentListTile({super.key, required this.studentName, required this.studentSeatNo, required this.studentMobile, required this.dateOfJoining, required this.initialPayment, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 10, right: horizontalScreenPadding, left: horizontalScreenPadding),
      decoration: BoxDecoration(
          color: BaseColors.cardColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          SvgPicture.asset(BaseAssets.icDummyReadingStudent, width: 80),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 13),
            height: 50,
            width: 1.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(5)
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailsWidget(label: 'Name: ', value: studentName),
                detailsWidget(label: 'Allotted Seat No: ', value: studentSeatNo),
                detailsWidget(label: 'Mobile: ', value: studentMobile),
                detailsWidget(label: 'Date Of Joining: ', value: dateOfJoining),
                detailsWidget(label: 'Initial Payment: ', value: initialPayment),
                detailsWidget(label: 'Address: ', value: address),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget detailsWidget({required String label, required String value}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseText(value: label, fontSize: 12, color: Colors.grey.shade500,),
        BaseText(value: value, fontSize: 12, color: Colors.grey.shade300,),
      ],
    );
  }
}
