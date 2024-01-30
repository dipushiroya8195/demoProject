import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import '../component/bottomNavigationBar.dart';
import '../component/commonButton.dart';
import '../component/commonTextFormField.dart';
import '../component/routes.dart';
import '../component/validation.dart';
import '../utils/ThemeManager.dart';
import '../utils/appConst.dart';
import '../utils/textConst.dart';
import '../utils/textStyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key ?key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool passwordVisible = false;
  bool passwordIcon = false;
  final List<dynamic>  sliderImageView=[
    "assets/images/loginImage.jpg",
    "assets/images/foodBigImage.png",
    "assets/images/loginImage.jpg"
  ];
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
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              //------------------------------CarouselSlider View------------------------
              Container(
                margin: EdgeInsets.only(top: height*0.0,bottom: height*0.02),
                height: height * 0.4,
                width: width,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  itemCount: sliderImageView.length,
                  slideBuilder: (item) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.softLight),
                              image: AssetImage( sliderImageView[item]),
                              fit: BoxFit.cover
                          )
                      ),
                    );
                  },
                  slideTransform:  DefaultTransform(),
                  slideIndicator: CircularSlideIndicator(
                    indicatorRadius: 5,
                    itemSpacing: 15,
                    currentIndicatorColor: ThemeManager().getWhiteColor,
                    indicatorBackgroundColor: ThemeManager().getGrey1Color,
                    padding: EdgeInsets.only(bottom: height * 0.05),
                  ),
                ),
              ),
              Positioned(
                  left:width*0.04,
                  top: height*0.06,
                  child:GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, Routes.SPLASH);
                      },
                      child: Icon(Icons.arrow_back,color: ThemeManager().getWhiteColor,)) ),

              //-------------------------------welcome back bottom view-----------------------
              Container(
                height: height*0.7,
                width: width,

                margin: EdgeInsets.only(top: height*0.37),
                decoration: BoxDecoration(
                  color: ThemeManager().getWhiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      width * 0.05,
                    ),
                    topLeft: Radius.circular(
                      width * 0.05,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: width*0.08,right: width*0.08),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: height*0.05),
                          child: Text(TextConst.welcomeBack, style: AvenirLTProBlack.copyWith(
                              fontSize: width * 0.075,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager().getBlueColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(TextConst.loginAccount, style: AvenirLTProRoman.copyWith(
                              fontSize: width * 0.04,
                              color: ThemeManager().getGrey2Color),
                          ),
                        ),
                        Column(
                          children: [
                            //-----------------------email---------------------
                            Container(
                              margin: EdgeInsets.only(top: height*0.05),
                              child: CommonTextFormField(
                                controller: emailController,
                                txt: TextConst.email,
                                validator:isValidEmail,
                              ),
                            ),
                            //-----------------------password-----------------
                            Container(
                              margin: EdgeInsets.only(top: height * 0.015,bottom: height*0.06),
                              child: TextFormField(
                                style: AvenirLTProMedium.copyWith(
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
                                  hintStyle: AvenirLTProMedium.copyWith(
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
                            //-------------------------login button view--------------------
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    onTapLogin();
                                  });
                                },
                                child: CommonButton(name: TextConst.loginText)),

                            //-----------------------forgot your password----------------------
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, Routes.FORGOT);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top:height*0.05,),
                                alignment: Alignment.center,
                                child: Text(TextConst.forgotYourPassword, style: AvenirLTProRoman.copyWith(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeManager().getBlackColor),
                                ),
                              ),
                            ),

                            //--------------------------don't have an account-------------------
                            Container(
                              margin: EdgeInsets.only(top:height*0.03),
                              alignment: Alignment.center,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: TextConst.doNotHaveAccount,
                                  style: AvenirLTProRoman.copyWith(
                                      fontSize: width * 0.042,
                                      color: ThemeManager().getGrey2Color),

                                  children: [
                                    TextSpan(
                                      text:TextConst.signUp,
                                      style: AvenirLTProRoman.copyWith(
                                          fontSize: width * 0.04,
                                          color: ThemeManager().getOrangeColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(context, Routes.SIGNUP);
                                        },
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
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
  void onTapLogin() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationbarScreen()));
    }
  }
}