import 'package:flutter/material.dart';

class AuthNotifire extends ChangeNotifier{

  String fullName="";
  String email="";
  String password="";
  String phNo="";
//--------------------full name------------
  set setName(String value){
    fullName=value;
    notifyListeners();
  }
  get getName=>fullName;
//--------------------email---------------
  set setEmail(String value){
    email=value;
    notifyListeners();
  }
  get getEmail=>email;
//------------------password---------------
  set setPassword(String value){
    password=value;
    notifyListeners();
  }
  get getPassword=>password;
//-----------------phone number-----------
  set setPhNo(String value){
    phNo=value;
    notifyListeners();
  }
  get getPhNo=>phNo;


}