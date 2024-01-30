import '../utils/textConst.dart';

String? isValidEmail(String? email) {
  RegExp regex = RegExp(r'\w+@\w+\.\w+');
  if (email!.isEmpty)
    return TextConst.enterText;
  else if (!regex.hasMatch(email))
    return TextConst.validEmailText;
  else
    return null;
}
//-----------------------name validation------------------------------
String? validateName(String? name) {
  RegExp regex = RegExp("[a-zA-Z]");
  if (name!.isEmpty) {
    return TextConst.enterName;
  } else if (!regex.hasMatch(name)) {
    return TextConst.validName;
  } else {
    return null;
  }
}
//--------------------mobile validation--------------------------
String? validateMobile(String? mbno) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (mbno!.isEmpty) {
    return TextConst.enterMobileNo;
  } else if (mbno.length > 10) {
    return TextConst.enter10DigitNumber;
  } else if (!regExp.hasMatch(mbno)) {
    return TextConst.validNumber;
  } else {
    return null;
  }
}
//----------------------------password validation---------------
String? validatePassword(String? value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern as String);
  print(value);
  if (value!.isEmpty) {
    return TextConst.enterPassword;
  } else {
    if (!regex.hasMatch(value))
      return TextConst.validPassword;
    else
      return null;
  }
}