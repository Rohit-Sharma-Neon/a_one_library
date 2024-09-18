import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/animated_list_builder.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_text.dart';
import 'package:learning_project/ui/base_components/base_textfield.dart';
import 'package:learning_project/ui/base_components/student_list_tile.dart';
import 'package:learning_project/ui/screens/add_students/add_student_screen.dart';
import 'package:learning_project/ui/screens/library_view_2d/library_view_2d.dart';
import 'package:learning_project/ui/screens/live_students/models/student_data_model.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_functions.dart';
import 'package:learning_project/utils/base_variables.dart';

import 'components/add_student_floating_button.dart';
import 'controller/live_student_controller.dart';

class LiveStudentsScreen extends StatefulWidget {
  const LiveStudentsScreen({super.key});

  @override
  State<LiveStudentsScreen> createState() => _LiveStudentsScreenState();
}

class _LiveStudentsScreenState extends State<LiveStudentsScreen> {
  LiveStudentController controller = Get.put(LiveStudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.cardColor,
      appBar: BaseAppBar(
        title: "Live Students",
        showBackButton: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const LibraryView2d());
            },
            child: ClayContainer(
              color: BaseColors.cardColor,
              width: 30,
              height: 30,
              borderRadius: 4,
              child: Icon(Icons.grid_on_sharp,
                  color: Colors.grey.shade500, size: 20),
            ).marginOnly(right: 20),
          )
        ],
        bottomChild: BaseTextField(
          controller: controller.searchStudentController,
          labelText: "",
          hintText: "Search Seat Number",
          topMargin: 0,
          rightMargin: horizontalScreenPadding,
          leftMargin: horizontalScreenPadding,
          textInputType: TextInputType.number,
          maxLength: 3,
          textInputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          onChanged: (val){
            setState(() {});
          },
        ),
        bottomWidgetHeight: 50,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("a_one_students").orderBy("allot_seat_number").startAt([controller.searchStudentController.text.trim()]).endAt(['${controller.searchStudentController.text.trim()}\uf8ff']).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Live Students Found\nPlease Add"));
          }

          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (context, index) {
                return AnimatedListBuilder(
                  index: index,
                  child: StudentListTile(
                    studentName: snapshot.data?.docs[index]['student_name'],
                    studentSeatNo: snapshot.data?.docs[index]['allot_seat_number'],
                    studentMobile: snapshot.data?.docs[index]['student_mobile'],
                    dateOfJoining: snapshot.data?.docs[index]['student_date_of_joining'],
                    initialPayment: snapshot.data?.docs[index]['initial_payment'],
                    address: snapshot.data?.docs[index]['student_address'],
                    onEdit: (context) {
                      Get.to(AddStudentScreen(
                        referenceId: snapshot.data?.docs[index].reference.id ?? "",
                        studentName: snapshot.data?.docs[index]['student_name'],
                        studentSeatNo: snapshot.data?.docs[index]['allot_seat_number'],
                        studentMobile: snapshot.data?.docs[index]['student_mobile'],
                        dateOfJoining: snapshot.data?.docs[index]['student_date_of_joining'],
                        initialPayment: snapshot.data?.docs[index]['initial_payment'],
                        address: snapshot.data?.docs[index]['student_address'],
                      ));
                    },
                    onDelete: (context) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const BaseText(
                              value: "Warning!",
                              fontSize: 20,
                            ),
                            content: const BaseText(value: "Are you sure you want to delete this Student ?"),
                            backgroundColor: BaseColors.cardColor,
                            actions: [
                              TextButton(
                                child: const BaseText(
                                  value: 'Cancel',
                                ),
                                onPressed: () {
                                  Get.back(canPop: false, closeOverlays: true);
                                },
                              ),
                              TextButton(
                                child: const BaseText(
                                  value: 'Delete',
                                ),
                                onPressed: () {
                                  String studentId = snapshot.data?.docs[index].reference.id ?? "";
                                  controller.deleteLiveStudent(seatNumber: studentId);
                                  Get.back(canPop: false, closeOverlays: true);
                                  triggerHapticFeedback();
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: const AddStudentFloatingButton(),
    );
  }
}
