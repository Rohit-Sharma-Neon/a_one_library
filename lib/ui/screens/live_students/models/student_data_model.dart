class StudentDataModel {
  final String studentReferenceId;
  final String studentName;
  final String allottedSeatNo;
  final String studentMobile;
  final String studentDateOfJoining;
  final String studentInitialPayment;
  final String studentAddress;

  StudentDataModel({
    required this.studentReferenceId,
    required this.allottedSeatNo,
    required this.studentMobile,
    required this.studentDateOfJoining,
    required this.studentInitialPayment,
    required this.studentAddress,
    required this.studentName,
  });
}