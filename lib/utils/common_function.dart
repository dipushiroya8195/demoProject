import 'package:flutter/foundation.dart';
///Write all common function here
double buttonFontSize(width) {
  return  kIsWeb? width*0.022 : width * 0.042;
}

double textFontSize(width) {
  return  kIsWeb? width*0.019 : width * 0.036;
}