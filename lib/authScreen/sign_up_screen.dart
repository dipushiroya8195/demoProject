import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../component/bottom_navigation_bar.dart';
import '../component/common_button.dart';
import '../component/commom_text_form_field.dart';
import '../component/routes.dart';
import '../component/validation.dart';
import '../notifire/auth_noti_fire.dart';
import '../utils/ThemeManager.dart';
import '../utils/app_const.dart';
import '../utils/text_const.dart';
import '../utils/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key ?key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordIcon = false;
  var formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  bool passwordVisible = false;
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
  @override
  Widget build(BuildContext context) {
    AuthNotifire authNotifire = Provider.of<AuthNotifire>(context, listen: false);
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: height*0.05,left: width*0.05),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, Routes.SPLASH);
                  },
                  child: Icon(Icons.arrow_back)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: height*0.02,left: width*0.065,right: width*0.08),
                    child: Column(
                      children: [
                        //-----------------------create account text--------------
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: height*0.06),
                          child: Text(TextConst.createAccount, style: aveNirLTProBlack.copyWith(
                              fontSize: width * 0.075,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager().getBlueColor),
                          ),
                        ),
                        //---------------------------full name---------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.07),
                          child: CommonTextFormField(
                            controller: nameController,
                            txt: TextConst.fullName,
                            validator:validateName,
                          ),
                        ),
                        //-----------------------------email--------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.015,bottom: height*0.0),
                          child: CommonTextFormField(
                            controller: emailController,
                            txt: TextConst.email,
                            validator:isValidEmail,
                          ),
                        ),
                        //----------------------------phone------------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.015,bottom: height*0.0),
                          child: CommonTextFormField(
                            controller: phoneController,
                            txt: TextConst.phone,
                            validator:validateMobile,
                            inputType: TextInputType.phone,

                          ),
                        ),//-----------------------password-------------------------

                        Container(
                          margin: EdgeInsets.only(top: height * 0.015),
                          child: TextFormField(
                            style: aveNirLTProMedium.copyWith(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: ThemeManager().getGrey1Color),
                            controller: passwordController,

                            validator: validatePassword,
                            onChanged: (password) {
                              setState(() {
                                password == ""
                                    ? passwordIcon = false
                                    : passwordIcon = true;
                              });
                            },
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              filled: true,
                              errorMaxLines: 3,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: height*0.018,horizontal: width*0.06),
                              hintText: "Enter your password",
                              hintStyle: aveNirLTProMedium.copyWith(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeManager().getGrey2Color),


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
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    passwordVisible=!passwordVisible;
                                  });
                                },
                                child: Container(
                                  child: Icon(passwordVisible==true? Icons.visibility
                                      : Icons.visibility_off,
                                    size: 20,
                                    color: passwordIcon == true
                                        ? ThemeManager().getGrey2Color
                                        : ThemeManager()
                                        .getGrey2Color,
                                  ),
                                ),
                              ),
                            ),

                          ),
                        ),


                        //---------------------------signupbutton view---------------------
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              authNotifire.fullName=nameController.text;
                              authNotifire.email=emailController.text;
                              authNotifire.phNo=phoneController.text;
                              authNotifire.password=passwordController.text;
                              onTapSignUp();
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: height*0.1),
                              child: CommonButton(name: TextConst.signUp,)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height*0.05),
                          child: Text(TextConst.byClickingSignupText,textAlign: TextAlign.center, style: aveNirLTProRoman.copyWith(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager().getGrey1Color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onTapSignUp() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationbarScreen()));
    }
  }
}