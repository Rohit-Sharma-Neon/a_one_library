import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_project/ui/screens/live_students/controller/live_student_controller.dart';

class AddStudentController extends GetxController{
  TextEditingController studentName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController studentMobile = TextEditingController();
  TextEditingController dateOfJoining = TextEditingController();
  TextEditingController initialPayment = TextEditingController(text: "600");
  List<int> availableSeatNumbers = <int>[];
  int selectedSeatNumber = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    dateOfJoining.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    initAvailableSeats();
    super.onInit();
  }

  addStudent(){
    if (formKey.currentState?.validate()??false) {
      FirebaseFirestore.instance.collection("a_one_students").add(
        {
          "student_name": studentName.text.trim(),
          "student_address": address.text.trim(),
          "student_mobile": studentMobile.text.trim(),
          "student_date_of_joining": dateOfJoining.text.trim(),
          "initial_payment": initialPayment.text.trim(),
          "allot_seat_number": selectedSeatNumber.toString(),
        },
      ).then((val){
        Get.back();
      });
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