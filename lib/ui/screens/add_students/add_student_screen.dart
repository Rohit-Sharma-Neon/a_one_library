import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/animated_column.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_button.dart';
import 'package:learning_project/ui/base_components/base_textfield.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_variables.dart';

import 'controller/add_student_controller.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  AddStudentController controller = Get.put(AddStudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Add Student"),
      body: SingleChildScrollView(
        child: AnimatedColumn(
          children: [
            BaseTextField(
              topMargin: 10,
              controller: controller.studentName,
              labelText: 'Student Name',
              hintText: 'Enter Student Name Here',
              textInputType: TextInputType.name,
            ),
            BaseTextField(
              topMargin: 20,
              controller: controller.address,
              labelText: 'Student Full Address',
              hintText: 'Enter Student Full Address Here',
              textInputType: TextInputType.streetAddress,
            ),
            BaseTextField(
              topMargin: 20,
              controller: controller.studentMobile,
              labelText: 'Student Mobile',
              hintText: 'Enter Student Mobile Here',
              textInputType: TextInputType.phone,
              maxLength: 10,
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            BaseTextField(
              topMargin: 20,
              controller: controller.dateOfJoining,
              labelText: 'Date Of Joining',
              hintText: 'Select Date Of Joining',
              textInputType: TextInputType.datetime,
            ),
            BaseTextField(
              topMargin: 20,
              controller: controller.initialPayment,
              labelText: 'Initial Payment (Optional)',
              hintText: 'Enter Initial Payment',
              textInputType: TextInputType.number,
              maxLength: 4,
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            BaseTextField(
              topMargin: 20,
              controller: controller.seatNo,
              labelText: 'Seat Number',
              hintText: 'Select Seat Number',
              textInputType: TextInputType.number,
              maxLength: 3,
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BaseButton(
        title: "Add Student",
        rightMargin: horizontalScreenPadding,
        leftMargin: horizontalScreenPadding,
        bottomMargin: horizontalScreenPadding,
        onPressed: (){
          controller.addStudent();
        },
      ),
    );
  }
}
