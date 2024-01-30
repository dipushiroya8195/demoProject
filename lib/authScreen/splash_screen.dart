

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/common_function.dart';
import '../utils/text_style.dart';
import 'package:permission_handler/permission_handler.dart';

import '../component/bottom_navigation_bar.dart';
import '../component/common_button.dart';
import '../component/routes.dart';
import '../utils/ThemeManager.dart';
import '../utils/app_const.dart';
import '../utils/text_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key ?key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //-------------------------------check enable location----------------------
  PermissionStatus? status;
  Future<PermissionStatus> checkStatus()async{
    status = await Permission.locationWhenInUse.status;
    if(status==PermissionStatus.denied){
      takePermissionPopUp();
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>BottomNavigationbarScreen()));
    }
    return status!;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle
      (
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light)
    );
  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          //------------------------------image-----------------------------
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashImage.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.center,
                colors: [ ThemeManager().getBlackColor.withOpacity(0.5), ThemeManager().getBlackColor.withOpacity(0.4),ThemeManager().getBlackColor.withOpacity(0.2)],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          //--------------------------------------------text View--------------------------
          Container(
            margin: EdgeInsets.only(left: width*0.06,right: width*0.06,top: height*0.32),
            child: ListView(
              children: [
                Text(TextConst.Discover, style: aveNirLTProMedium.copyWith(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w400,
                    color: ThemeManager().getWhiteColor),
                ),
                Text(TextConst.Nearby, style: aveNirLTProMedium.copyWith(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w400,
                    color: ThemeManager().getWhiteColor),
                ),
                Text(TextConst.Shops, style: aveNirLTProMedium.copyWith(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w400,
                    color: ThemeManager().getWhiteColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: height*0.015),
                  child: Text(TextConst.setLocationText, style: aveNirLTProRoman.copyWith(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w400,
                      color: ThemeManager().getWhiteColor),
                  ),
                ),

                //-------------------------------------loginButton View-----------------------
                GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.pushReplacementNamed(context, Routes.LOGIN);
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: height*0.09,bottom: height*0.015),
                        child: CommonButton(name:TextConst.loginText))),

                //-------------------------------------SignupButton View---------------------
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, Routes.SIGNUP);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height:  height*0.063,
                    width: width,
                    decoration: BoxDecoration(
                        color: ThemeManager().getWhiteColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child:  Text(TextConst.signUp, style: aveNirLTProRoman.copyWith(
                        fontSize: buttonFontSize(width),
                        fontWeight: FontWeight.w500,
                        color: ThemeManager().getOrangeColor),
                    ),
                  ),
                ),

                //------------------------------------Explore as Guest View---------------------
                GestureDetector(
                  onTap: (){
                    checkStatus();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: height*0.08),
                    alignment: Alignment.center,
                    height: height*0.063,
                    width: width,
                    decoration: BoxDecoration(
                        color: ThemeManager().getGreyButtonColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child:  Text(TextConst.Explore, style: aveNirLTProRoman.copyWith(
                        fontSize:buttonFontSize(width),
                        fontWeight: FontWeight.w500,
                        color: ThemeManager().getGrey1Color),
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),

    );
  }
  //---------------------------take permission popup------------------
  takePermissionPopUp() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context,) {
          return WillPopScope( onWillPop:()async=> false,child:AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              margin: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height*0.25,
                    width: width*0.25,
                    child: Image.asset("assets/images/locationImage.png",fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width*0.03,right: width*0.03),
                    child: Text(TextConst.Explore, style: aveNirLTProMedium.copyWith(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w500,
                        color: ThemeManager().getBlueColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width*0.05,right: width*0.05,top: height*0.03),
                    child: Text(TextConst.allowUseLoction, style: aveNirLTProRoman.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getBlueColor),
                    ),
                  ),
                  GestureDetector(
                      onTap: ()  {
                        _checkPermission();
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: height*0.03,bottom: height*0.03,left: width*0.05,right: width*0.05),
                          child: CommonButton(name: TextConst.enableLocation))),
                ],
              ),
            ),
          ));
        });
  }
  //-----------------------------check prmission -----------------------------
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
      Navigator.push(context, MaterialPageRoute(builder:(context)=>BottomNavigationbarScreen()));
    } else if (status == PermissionStatus.denied) {
      print('Permission denied. Show a dialog and again ask for the permission');
      Navigator.pop(context);
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
    if (!isGpsOn) {
      print('Turn on location services before requesting permission.');
      return;
    }
  }
}

