import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/screens/add_students/add_student_screen.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_functions.dart';

class AddStudentFloatingButton extends StatelessWidget {
  const AddStudentFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        openBuilder: (BuildContext context, VoidCallback _) {
          return const AddStudentScreen();
        },
        closedElevation: 0.0,
        closedColor: Colors.transparent,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return FadeInUp(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ClayContainer(
                width: 50,
                height: 50,
                emboss: false,
                color: BaseColors.cardColor,
                customBorderRadius: BorderRadius.circular(10),
                child: Icon(Icons.add, color: Colors.grey.shade400),
              ),
            ),
          );
        });
  }
}
