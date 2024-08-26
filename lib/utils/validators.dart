class Validators {
  String? mobileValidator(String? val){
    if((val??"").trim().isEmpty){
      return "Please Enter Student's Mobile Number";
    } else if((val??"").trim().length != 10){
      return "Please Enter Valid Mobile Number";
    }
    return null;
  }
}