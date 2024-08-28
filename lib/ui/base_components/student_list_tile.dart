import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_project/utils/base_assets.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_functions.dart';
import 'package:learning_project/utils/base_variables.dart';

import 'base_text.dart';

class StudentListTile extends StatelessWidget {
  final void Function(BuildContext context)? onDelete, onEdit;
  final String studentName, studentSeatNo, studentMobile, dateOfJoining, initialPayment, address;
  const StudentListTile({super.key, required this.studentName, required this.studentSeatNo, required this.studentMobile, required this.dateOfJoining, required this.initialPayment, required this.address, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            print("Hello");
          }),
          extentRatio: 0.4,
          children: [
            SlidableAction(
              backgroundColor: Colors.green.shade900,
              foregroundColor: Colors.white,
              icon: Icons.call,
              label: 'Call',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              onPressed: (context){
                callOnNumber(mobile: studentMobile);
              },
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            print("Hello");
          }),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              backgroundColor: Colors.grey.shade800,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              onPressed: onEdit,
            ),
            SlidableAction(
              backgroundColor: Colors.red.shade900,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
              onPressed: onDelete,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, top: 6),
          child: ClayContainer(
            color: BaseColors.cardColor,
            borderRadius: 10,
            depth: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
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
            ),
          ),
        ),
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
