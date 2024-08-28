import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/screens/live_students/models/student_data_model.dart';
import 'package:learning_project/utils/base_functions.dart';

class LiveStudentController extends GetxController{
  List<int> allottedSeatNumber = <int>[];
  List<StudentDataModel> liveStudentList = <StudentDataModel>[];
  deleteLiveStudent({required String seatNumber}){
    FirebaseFirestore.instance.collection("a_one_students").doc(seatNumber).delete();
    triggerHapticFeedback();
  }
}