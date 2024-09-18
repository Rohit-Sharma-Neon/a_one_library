import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/screens/live_students/models/student_data_model.dart';
import 'package:learning_project/utils/base_functions.dart';

class LiveStudentController extends GetxController{
  List<int> allottedSeatNumber = <int>[];
  List<StudentDataModel> liveStudentList = <StudentDataModel>[];
  TextEditingController searchStudentController = TextEditingController();

  @override
  onInit() {
    initAllottedSeat();
    super.onInit();
  }

  deleteLiveStudent({required String seatNumber}){
    FirebaseFirestore.instance.collection("a_one_students").doc(seatNumber).delete();
    triggerHapticFeedback();
    initAllottedSeat();
  }

  initAllottedSeat() async {
    allottedSeatNumber = [];
    CollectionReference collection = FirebaseFirestore.instance.collection('a_one_students');
    QuerySnapshot querySnapshot = await collection.orderBy("allot_seat_number").startAt([searchStudentController.text.trim()]).endAt(['${searchStudentController.text.trim()}\uf8ff']).get();
    List<Map<String, dynamic>> tempItems = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
    tempItems.forEach((val){
      allottedSeatNumber.add(int.parse(val['allot_seat_number']));
    });
  }
}