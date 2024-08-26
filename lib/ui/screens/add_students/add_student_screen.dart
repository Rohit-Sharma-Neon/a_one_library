import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/animated_column.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_textfield.dart';

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
      body: AnimatedColumn(
        children: [
          BaseTextField(
            controller: controller.studentName,
            labelText: 'Student Name',
            hintText: 'Enter Student Name Here',
          ),
        ],
      ),
    );
  }
}
