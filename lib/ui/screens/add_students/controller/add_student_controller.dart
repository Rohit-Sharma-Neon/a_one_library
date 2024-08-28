import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_project/ui/screens/live_students/controller/live_student_controller.dart';

class AddStudentController extends GetxController{
  TextEditingController studentNameStr = TextEditingController();
  TextEditingController addressStr = TextEditingController();
  TextEditingController studentMobileStr = TextEditingController();
  TextEditingController dateOfJoiningStr = TextEditingController();
  TextEditingController initialPaymentStr = TextEditingController(text: "600");
  List<int> availableSeatNumbers = <int>[];
  int selectedSeatNumber = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    dateOfJoiningStr.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    initAvailableSeats();
    super.onInit();
  }

  setData({required String referenceId, required String studentName, required String studentSeatNo, required String studentMobile,  required String dateOfJoining, required String initialPayment, required String address }){
    if(referenceId.isNotEmpty){
      studentNameStr.text = studentName;
      addressStr.text = address;
      studentMobileStr.text = studentMobile;
      dateOfJoiningStr.text = dateOfJoining;
      initialPaymentStr.text = initialPayment;
      selectedSeatNumber = int.parse(studentSeatNo??"0");
    }
  }

  addStudent(){
    if (formKey.currentState?.validate()??false) {
      FirebaseFirestore.instance.collection("a_one_students").add(
        {
          "student_name": studentNameStr.text.trim(),
          "student_address": addressStr.text.trim(),
          "student_mobile": studentMobileStr.text.trim(),
          "student_date_of_joining": dateOfJoiningStr.text.trim(),
          "initial_payment": initialPaymentStr.text.trim(),
          "allot_seat_number": selectedSeatNumber.toString(),
        },
      ).then((val){
        Get.back();
      });
    }
  }

  editStudent({required String referenceId}){
    if (formKey.currentState?.validate()??false) {
      if (referenceId.isNotEmpty) {
        FirebaseFirestore.instance.collection("a_one_students").doc(referenceId).update(
            {
              "student_name": studentNameStr.text.trim(),
              "student_address": addressStr.text.trim(),
              "student_mobile": studentMobileStr.text.trim(),
              "student_date_of_joining": dateOfJoiningStr.text.trim(),
              "initial_payment": initialPaymentStr.text.trim(),
              "allot_seat_number": selectedSeatNumber.toString(),
            }
        ).then((val){
          Get.back();
        });
      }
    }
  }

  initAvailableSeats(){
    for(int i=1; i<101; i+=1){
      if(!(Get.find<LiveStudentController>().allottedSeatNumber.contains(i))){
        availableSeatNumbers.add(i);
      }
    }
  }
}