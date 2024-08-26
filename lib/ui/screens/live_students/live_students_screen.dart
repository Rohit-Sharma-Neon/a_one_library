import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/base_components/animated_list_builder.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/student_list_tile.dart';
import 'package:learning_project/ui/screens/add_students/add_student_screen.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_functions.dart';

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
      appBar: const BaseAppBar(title: "Live Students", showBackButton: false),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("a_one_students").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          controller.allottedSeatNumber.clear();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text("No Live Students Found\nPlease Add");
          }
          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: snapshot.data?.docs.length??0,
              itemBuilder: (context, index){
                if ((snapshot.data?.docs[index]['allot_seat_number']??"") != "") {
                  controller.allottedSeatNumber.add(int.parse(snapshot.data?.docs[index]['allot_seat_number']));
                }
                return AnimatedListBuilder(
                  index: index,
                  child: GestureDetector(
                    onLongPress: () async {
                      String studentId = snapshot.data?.docs[index].reference.id??"";
                      controller.deleteLiveStudent(seatNumber: studentId);
                    },
                    child: StudentListTile(
                      studentName: snapshot.data?.docs[index]['student_name'],
                      studentSeatNo: snapshot.data?.docs[index]['allot_seat_number'],
                      studentMobile: snapshot.data?.docs[index]['student_mobile'],
                      dateOfJoining: snapshot.data?.docs[index]['student_date_of_joining'],
                      initialPayment: snapshot.data?.docs[index]['initial_payment'],
                      address: snapshot.data?.docs[index]['student_address'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          triggerHapticFeedback();
          Get.to(const AddStudentScreen());
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: BaseColors.grey800,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(Icons.add, color: Colors.grey.shade400,),
        ),
      ),
    );
  }
}
