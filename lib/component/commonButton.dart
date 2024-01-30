import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/common_function.dart';

import '../utils/ThemeManager.dart';
import '../utils/appConst.dart';
import '../utils/textStyle.dart';

class CommonButton extends StatefulWidget {
  final String name;
  const CommonButton({Key ?key,required this.name}) : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: height*0.063,
      width: width,
      decoration: BoxDecoration(
          color: ThemeManager().getOrangeColor,
          borderRadius: BorderRadius.circular(50)
      ),
      child:Text(widget.name, style: aveNirLTProRoman.copyWith(
          fontSize: buttonFontSize(width),
          fontWeight: FontWeight.w500,
          color: ThemeManager().getWhiteColor),
      ),
    );
  }
}
