import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
    int completedDays = daysBetween(from: DateFormat("dd/MM/yyyy").parse(dateOfJoining), to: DateTime.now());
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dragDismissible: false,
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
          dragDismissible: false,
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
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClayContainer(
                color: completedDays >= 30 ? Colors.grey.shade800 : BaseColors.cardColor,
                borderRadius: 10,
                depth: completedDays >= 30 ? 0 : 20,
                spread: completedDays >= 30 ? 0 : null,
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
                            detailsWidget(label: 'Mobile: ', value: studentMobile),
                            detailsWidget(label: 'Date Of Joining: ', value: dateOfJoining),
                            detailsWidget(label: 'Remaining Days: ', value: (30 - completedDays).toString()),
                            detailsWidget(label: 'Initial Payment: ', value: initialPayment),
                            detailsWidget(label: 'Address: ', value: address),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 7, bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), topLeft: Radius.circular(10)),
                ),
                child: BaseText(value: studentSeatNo, height: 0, leftMargin: 6.5, topMargin: 3, fontSize: 12,),
              ),
              Visibility(
                visible: completedDays >= 28,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.only(right: 7, bottom: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    ),
                    child: BaseText(value: completedDays >= 30 ? "Please Renew" : "Renew Soon", height: 0, leftMargin: 6.5, topMargin: 3, fontSize: 12,),
                  ),
                ),
              )
            ],
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
