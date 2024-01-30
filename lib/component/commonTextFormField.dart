
import 'package:flutter/material.dart';

import '../utils/ThemeManager.dart';
import '../utils/appConst.dart';
import '../utils/textStyle.dart';

class CommonTextFormField extends StatefulWidget {
  final String txt;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obsecure;
  final TextInputType? inputType;
  const CommonTextFormField(
      {Key? key,
        required this.txt,
        required this.controller,
        this.validator,
        this.obsecure = false,
        this.inputType})
      : super(key: key);

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}
//------------------------COMMOM TEXTFORM FIELD--------------------------------
class _CommonTextFormFieldState extends State<CommonTextFormField> {
  ThemeManager themeManager=ThemeManager();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: aveNirLTProMedium.copyWith(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
            color: themeManager.getGrey1Color),
        keyboardType: widget.inputType,
        obscureText: widget.obsecure,
        controller: widget.controller,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none

          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: height*0.018,horizontal: width*0.06),
          hintText: widget.txt,
          hintStyle: aveNirLTProMedium.copyWith(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
              color: themeManager.getGrey2Color),

        ),
        validator: widget.validator,
      ),


    );
  }
}
