import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/commonButton.dart';
import '../component/commonTextFormField.dart';
import '../component/routes.dart';
import '../component/validation.dart';
import '../utils/ThemeManager.dart';
import '../utils/appConst.dart';
import '../utils/textConst.dart';
import '../utils/textStyle.dart';
import 'loginScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key ?key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle
      (
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark)
    );
  }
  var formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, Routes.LOGIN);
                },
                child: Container(
                    margin: EdgeInsets.only(top: height*0.05,left: width*0.05),
                    child: Icon(Icons.arrow_back))),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: height*0.05,left: width*0.08,right: width*0.08),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //--------------------------forgot password text---------------
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: height*0.05),
                          child: Text(TextConst.forgotPassword, style: AvenirLTProBlack.copyWith(
                              fontSize: width * 0.075,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager().getBlueColor),
                          ),
                        ),

                        //----------------------------long text-------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.03),
                          child: Text(TextConst.longTextForgot,textAlign: TextAlign.center, style: AvenirLTProRoman.copyWith(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager().getBlackColor),
                          ),
                        ),
                        //---------------------------email-----------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.05,bottom: height*0.0),
                          child: CommonTextFormField(
                            controller: emailController,
                            txt: "Your email",
                            validator:isValidEmail,
                          ),
                        ),
                        //--------------------------send button view----------------------
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              onTapSend();
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: height*0.07),
                              child: CommonButton(name: TextConst.send,)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void onTapSend() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      addYourPasswordPopUp();
    }
  }


  //--------------------------ADD PASSWORD POPUP---------------------
  addYourPasswordPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context,) {
          return WillPopScope( onWillPop:()async=> false,child: AlertDialog(
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
                    margin: EdgeInsets.only(top:height*0.04,bottom: height*0.04),
                    alignment: Alignment.center,
                    height: height*0.15,
                    width: height*0.15,
                    child: Image.asset("assets/images/lockoverturning.png",fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width*0.03,right: width*0.03),
                    child: Text(TextConst.yourPassword, style: AvenirLTProMedium.copyWith(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w500,
                        color: ThemeManager().getBlueColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width*0.05,right: width*0.05,top: height*0.03),
                    child: Text(TextConst.setupNewPwd,textAlign: TextAlign.center ,style: AvenirLTProRoman.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getBlueColor),
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: height*0.03,bottom: height*0.03,left: width*0.08,right: width*0.08),
                          child: CommonButton(name: TextConst.done))),

                ],
              ),
            ),
          ));
        });

  }

}
