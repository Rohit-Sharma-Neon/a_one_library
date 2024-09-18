import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_project/ui/base_components/animated_column.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';
import 'package:learning_project/ui/base_components/base_button.dart';
import 'package:learning_project/ui/base_components/base_text.dart';
import 'package:learning_project/ui/base_components/base_textfield.dart';
import 'package:learning_project/ui/screens/live_students/controller/live_student_controller.dart';
import 'package:learning_project/utils/base_functions.dart';
import 'package:learning_project/utils/base_variables.dart';
import 'package:learning_project/utils/validators.dart';

import 'controller/add_student_controller.dart';

class AddStudentScreen extends StatefulWidget {
  final String? referenceId, studentName, studentSeatNo, studentMobile, dateOfJoining, initialPayment, address;
  const AddStudentScreen({super.key, this.referenceId, this.studentName, this.studentSeatNo, this.studentMobile, this.dateOfJoining, this.initialPayment, this.address, });

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  AddStudentController controller = Get.put(AddStudentController());

  @override
  void initState() {
    super.initState();
    Get.find<LiveStudentController>().initAllottedSeat();
    controller.setData(
      referenceId: widget.referenceId??"",
      studentName: widget.studentName??"",
      studentSeatNo: widget.studentSeatNo??"0",
      studentMobile: widget.studentMobile??"",
      dateOfJoining: widget.dateOfJoining??"",
      initialPayment: widget.initialPayment??"",
      address: widget.address??"",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "${(widget.referenceId??"").isEmpty ? "Add" : "Edit"} Student"),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: AnimatedColumn(
            children: [
              BaseTextField(
                topMargin: 10,
                controller: controller.studentNameStr,
                labelText: 'Student Name',
                hintText: 'Enter Student Name Here',
                textInputType: TextInputType.name,
                maxLength: 50,
                validator: (val){
                  if((val??"").trim().isEmpty){
                    return "Please Enter Student's Name";
                  }
                  return null;
                },
              ),
              BaseTextField(
                topMargin: 20,
                controller: controller.addressStr,
                labelText: 'Student Full Address',
                hintText: 'Enter Student Full Address Here',
                textInputType: TextInputType.streetAddress,
                maxLength: 200,
                validator: (val){
                  if((val??"").trim().isEmpty){
                    return "Please Enter Student's Full Address";
                  }
                  return null;
                },
              ),
              BaseTextField(
                topMargin: 20,
                controller: controller.studentMobileStr,
                labelText: 'Student Mobile',
                hintText: 'Enter Student Mobile Here',
                textInputType: TextInputType.phone,
                maxLength: 10,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: Validators().mobileValidator,
              ),
              BaseTextField(
                topMargin: 20,
                controller: controller.dateOfJoiningStr,
                readOnly: true,
                labelText: 'Date Of Joining',
                hintText: 'Select Date Of Joining',
                textInputType: TextInputType.datetime,
                validator: (val){
                  if((val??"").trim().isEmpty){
                    return "Please Select Date Of Joining";
                  }
                  return null;
                },
                onTap: (){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year, DateTime.now().month - 3),
                    lastDate: DateTime(DateTime.now().year, DateTime.now().month + 4),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                                onPrimary: Colors.black, // selected text color
                                onSurface: Colors.amberAccent, // default text color
                                primary: Colors.amberAccent // circle color
                            ),
                            dialogBackgroundColor: Colors.black54,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.amber, textStyle: const TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand'), // color of button's letters
                                    backgroundColor: Colors.black54, // Background color
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(50))))),
                        child: child!,
                      );
                    },
                  ).then((val){
                    if(val != null){
                      controller.dateOfJoiningStr.text = DateFormat("dd/MM/yyyy").format(val);
                    }
                  });
                },
              ),
              BaseTextField(
                topMargin: 20,
                bottomMargin: 20,
                controller: controller.initialPaymentStr,
                labelText: 'Initial Payment (Optional)',
                hintText: 'Enter Initial Payment',
                textInputType: TextInputType.number,
                maxLength: 4,
                suffixIcon: BaseText(value: "₹", fontSize: 15, color: Colors.grey.shade700, rightMargin: 18,),
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
              DropdownButtonFormField<int>(
                isExpanded: true,
                hint: BaseText(value: controller.selectedSeatNumber == 0 ? "Select Seat Number" : controller.selectedSeatNumber.toString(), color: controller.selectedSeatNumber == 0 ? Colors.grey.shade500 : Colors.grey.shade300, fontSize: 15),
                style: TextStyle(color: Colors.grey.shade300, fontSize: 15),
                dropdownColor: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.only(top: 6, bottom: 6, left: 0, right: 10.0),
                  isDense: true,
                  hintMaxLines: 1,
                  hintText: "Select Seat Number",
                  labelText: "Select Seat Number",
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  counter: const SizedBox.shrink(),
                  counterStyle: const TextStyle(fontSize: 0,color: Colors.transparent),
                  counterText: "",
                  semanticCounterText: "",
                  suffixIconConstraints: const BoxConstraints(maxHeight: 45),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 45),
                  filled: false,
                  fillColor: Colors.transparent,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC2C2C2), width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC2C2C2), width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC2C2C2), width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC2C2C2), width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC2C2C2), width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                items: controller.availableSeatNumbers.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    triggerHapticFeedback();
                    controller.selectedSeatNumber = val;
                  }
                },
                validator: (val){
                  if(controller.selectedSeatNumber == 0){
                    return "Please Select Seat Number";
                  }
                  return null;
                },
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseButton(
        title: "${(widget.referenceId??"").isEmpty ? "Add" : "Edit"} Student",
        rightMargin: horizontalScreenPadding,
        leftMargin: horizontalScreenPadding,
        bottomMargin: horizontalScreenPadding,
        onPressed: (){
          if ((widget.referenceId??"").isEmpty) {
            controller.addStudent();
          }else{
            controller.editStudent(referenceId: widget.referenceId??"");
          }
        },
      ),
    );
  }
}
