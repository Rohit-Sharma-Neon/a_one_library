class StudentDataModel {
  String? studentReferenceId;
  String? studentName;
  String? allottedSeatNo;
  String? studentMobile;
  String? studentDateOfJoining;
  String? studentInitialPayment;
  String? studentAddress;

  StudentDataModel({
    required this.studentReferenceId,
    required this.allottedSeatNo,
    required this.studentMobile,
    required this.studentDateOfJoining,
    required this.studentInitialPayment,
    required this.studentAddress,
    required this.studentName,
  });

  StudentDataModel.fromJson(Map<String, dynamic> json) {
    studentReferenceId = json['student_reference_id'];
    studentName = json['student_name'];
    allottedSeatNo = json['allot_seat_number'];
    studentMobile = json['student_mobile'];
    studentDateOfJoining = json['student_date_of_joining'];
    studentInitialPayment = json['initial_payment'];
    studentAddress = json['student_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_reference_id'] = studentReferenceId;
    data['student_name'] = studentName;
    data['allot_seat_number'] = allottedSeatNo;
    data['student_mobile'] = studentMobile;
    data['student_date_of_joining'] = studentDateOfJoining;
    data['initial_payment'] = studentInitialPayment;
    data['student_address'] = studentAddress;
    return data;
  }
}