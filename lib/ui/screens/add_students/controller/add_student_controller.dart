import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_project/utils/base_functions.dart';

class AddStudentController extends GetxController{
  TextEditingController studentName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController studentMobile = TextEditingController();
  TextEditingController dateOfJoining = TextEditingController();
  TextEditingController initialPayment = TextEditingController();
  TextEditingController seatNo = TextEditingController();

  addStudent(){
    FirebaseFirestore.instance.collection("a_one_students").add(
      {
        "student_name": studentName.text.trim(),
        "student_address": address.text.trim(),
        "student_mobile": studentMobile.text.trim(),
        "student_date_of_joining": dateOfJoining.text.trim(),
        "initial_payment": initialPayment.text.trim(),
        "allot_seat_number": seatNo.text.trim(),
      },
    ).then((val){
      Get.back();
    });
  }
}