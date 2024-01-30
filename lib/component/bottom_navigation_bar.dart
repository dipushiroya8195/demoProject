import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/common_function.dart';

import '../homeScreen.dart';
import '../orderScreen.dart';
import '../utils/ThemeManager.dart';
import '../utils/app_const.dart';
import '../utils/text_const.dart';
import '../utils/text_style.dart';

class BottomNavigationbarScreen  extends StatefulWidget {
  const BottomNavigationbarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationbarScreenState createState() => _BottomNavigationbarScreenState();
}

class _BottomNavigationbarScreenState extends State<BottomNavigationbarScreen> {

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> viewContainer = [
    HomeScreen(),
    orderScreen(),
    Container(
     child: Text("Coming Soon....",
          textAlign: TextAlign.center,
          style: aveNirLTProBlack.copyWith(
              fontSize: width * 0.033,
              fontWeight: FontWeight.w600,
              color: ThemeManager().getBlackColor)),

    ),
    Container(
      child: Text("Coming Soon....",
          textAlign: TextAlign.center,
          style: aveNirLTProBlack.copyWith(
              fontSize: width * 0.033,
              fontWeight: FontWeight.w600,
              color: ThemeManager().getBlackColor)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: width,
          margin: EdgeInsets.only(left: width*0.06, right: width*0.06),
          height: kIsWeb ?height*0.07 :height*0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Container(
                  color:ThemeManager().getWhiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/images/compassIcon.png"),
                          height:height * 0.030,
                          color:currentIndex==0? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.01),
                        child: Text(TextConst.explore,textAlign: TextAlign.center, style: aveNirLTProRoman.copyWith(
                            fontSize: textFontSize(width),
                            fontWeight: FontWeight.w400,
                            color: currentIndex==0? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Container(
                  color:ThemeManager().getWhiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/images/myOrderIcon.png"),
                          height: height * 0.030,
                          color:currentIndex==1? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.01),
                        child: Text(TextConst.myOrder,textAlign: TextAlign.center, style: aveNirLTProRoman.copyWith(
                            fontSize: textFontSize(width),
                            fontWeight: FontWeight.w400,
                            color:currentIndex==1? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Container(
                  color:ThemeManager().getWhiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/images/favoriteIcon.png"),
                          height: height * 0.030,
                          color:currentIndex==2? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.01),
                        child: Text(TextConst.favourite,textAlign: TextAlign.center, style: aveNirLTProRoman.copyWith(
                            fontSize: textFontSize(width),
                            fontWeight: FontWeight.w400,
                            color: currentIndex==2? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/images/profileIcon.png"),
                          height: height * 0.030,
                          color:currentIndex==3? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.01),
                        child: Text(TextConst.profile,textAlign: TextAlign.center, style: aveNirLTProRoman.copyWith(
                            fontSize: textFontSize(width),
                            fontWeight: FontWeight.w400,
                            color:currentIndex==3? ThemeManager().getOrangeColor:ThemeManager().getGrey2Color)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),

      ),
      body: viewContainer[currentIndex],
    );
  }
}