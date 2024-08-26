import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_project/ui/base_components/animated_list_builder.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_text.dart';
import 'package:learning_project/ui/base_components/student_list_tile.dart';
import 'package:learning_project/utils/base_assets.dart';
import 'package:learning_project/utils/base_colors.dart';
import 'package:learning_project/utils/base_variables.dart';

class LiveStudentsScreen extends StatefulWidget {
  const LiveStudentsScreen({super.key});

  @override
  State<LiveStudentsScreen> createState() => _LiveStudentsScreenState();
}

class _LiveStudentsScreenState extends State<LiveStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Live Students"),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("a_one_students").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text("No Live Students Added\nPlease Add");
          }
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: snapshot.data?.docs.length??0,
              itemBuilder: (context, index){
                return AnimatedListBuilder(
                  index: index,
                  child: StudentListTile(
                    studentName: snapshot.data?.docs[index]['student_name'],
                    studentSeatNo: snapshot.data?.docs[index]['allot_seat_number'],
                    studentMobile: snapshot.data?.docs[index]['student_mobile'],
                    dateOfJoining: snapshot.data?.docs[index]['student_date_of_joining'],
                    initialPayment: snapshot.data?.docs[index]['initial_payment'],
                    address: snapshot.data?.docs[index]['student_address'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
