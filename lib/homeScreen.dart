

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:food/utils/ThemeManager.dart';
import 'package:food/utils/app_const.dart';
import 'package:food/utils/text_const.dart';
import 'package:food/utils/text_style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'component/common_button.dart';
import 'notifire/auth_noti_fire.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _ExtraScreenState createState() => _ExtraScreenState();
}

class _ExtraScreenState extends State<HomeScreen> {
  bool isLoad=true;
  PermissionStatus? status;
  Future<PermissionStatus> checkStatus()async{
    status = await Permission.locationWhenInUse.status;
    if(status==PermissionStatus.denied){
      enablePermissionPopUp();
    }
    return status!;
  }
  setShimmerTime(){
    Future.delayed(Duration(seconds: 2)).then((value)async{
      setState(() {
        isLoad=false;
      });
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
    setShimmerTime();
    SystemChrome.setSystemUIOverlayStyle
      (
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark)
    );
  }
  //--------------------------------caresoul slider---------------------
  List sliderImageView=[
    {
      "foodImage": "assets/images/foodBigImage.png",
      "foodName":"Andy & Cindy's Diner",
      "address":"87 Botsford Circle Apt"
    },
    {
      "foodImage": "assets/images/foodBigImage.png",
      "foodName":"The Garage Bar & Grill",
      "address":"87 Botsford Circle Apt"
    },
    {
      "foodImage": "assets/images/foodBigImage.png",
      "foodName":"Andy Cafe",
      "address":"87 Botsford Circle Apt"
    }

  ];

  //-----------------------------top Categories Detail-------------------------
  List topCategoriesDetail=[
    {
      "foodImage":"assets/images/burgerImage.png",
      "foodName":" Burgers",
      "places":" 1126 places",
      "color":ThemeManager().getOrangeColor
    },
    {
      "foodImage":"assets/images/americanImage.png",
      "foodName":" American",
      "places":" 142 places",
      "color":ThemeManager().getSkyColor
    },
    {
      "foodImage":"assets/images/pizzaImage.png",
      "foodName":" Pizza",
      "places":" 365 places",
      "color":ThemeManager().getPurpleColor
    },
    {
      "foodImage":"assets/images/barbequeImage.png",
      "foodName":" Barbecue",
      "places":" 523 places",
      "color":ThemeManager().getPinkColor
    }
  ];
//--------------------------------------discover Detail----------------------------
  List discoverDetail=[
    {
      "discoverImage":"assets/images/cupCakeImage.png",
      "name":"Andy & Cindy's Diner",
      "subtitle":"87 Botsford Circle Apt",
      "starImage":"assets/images/starImage.png",
      "starcount":"4.8",
      "rating":"(233 ratings)",
      "Category":"Category"
    },
    {
      "discoverImage":"assets/images/garagebarImage.png",
      "name":"The Garage Bar & Grill",
      "subtitle":"1175 Gislason Shore Apt. 658",
      "starImage":"assets/images/starImage.png",
      "starcount":"4.3",
      "rating":"(135 ratings)",
      "Category":"Category"
    }
  ];
  //-----------------------------recent Offer------------------------------
  List recentOffer=[
    {
      "recentImage":"assets/images/cupCakeImage.png",
      "offer":"Offer 01",
      "name":"87 Botsford Circle Apt"
    },
    {
      "recentImage":"assets/images/garagebarImage.png",
      "offer":"Offer 02",
      "name":"1175 Gislason Shore Apt. 658"
    }
  ];
  var formKey=GlobalKey<FormState>();
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthNotifire getDetail = Provider.of<AuthNotifire>(context, listen: false);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: height*0.05,left: width*0.05,),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //---------------------------appbar---------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height*0.005),
                    child: Row(
                      children: [
                        Container(child: Image.asset("assets/images/lisaImage.png",scale: 4.0,),),
                        Text("Hi,  ",textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w600,
                            color: ThemeManager().getBlackColor),
                        ),
                        Text(getDetail.getName.isEmpty?"guest":getDetail.getName,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w600,
                            color: ThemeManager().getBlackColor),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width*0.07),
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/bellIcon.png",scale: 4.0,),)
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        //-----------------------search textformfield-----------------------
                        Container(
                          margin: EdgeInsets.only(bottom: height*0.025,top: height*0.01),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  style: aveNirLTProMedium.copyWith(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeManager().getGrey1Color),
                                  controller:searchController ,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),
                                    suffixIcon: Icon(Icons.search,size:width*0.05, color: ThemeManager().getGrey2Color),
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.06),
                                    hintText: "Search...",
                                    hintStyle: aveNirLTProRoman.copyWith(
                                        fontSize: width * 0.045,
                                        color: ThemeManager().getGrey2Color),

                                  ),
                                  // validator: widget.validator,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: width*0.09,right: width*0.05),
                                height: height*0.065,
                                width: height*0.065,
                                decoration: BoxDecoration(
                                    color: ThemeManager().getGreyButtonColor.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Image.asset("assets/images/filterIcon.png",scale: 5.0,),
                              )
                            ],
                          ),
                        ),
                        //-------------------------CarouselSlider view-------------------
                        isLoad==true?Shimmer.fromColors(
                          baseColor: ThemeManager().getGreyButtonColor,
                          highlightColor: Colors.grey,
                          direction: ShimmerDirection.ltr,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: height*0.0,bottom: height*0.02,right: width*0.05),
                                height: height * 0.28,
                                width: width,
                                child: CarouselSlider.builder(
                                  unlimitedMode: true,
                                  itemCount: sliderImageView.length,
                                  slideBuilder: (item) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ThemeManager().getGrey2Color
                                      ),
                                    );
                                  },
                                  slideTransform: const DefaultTransform(),
                                  slideIndicator: CircularSlideIndicator(
                                    currentIndicatorColor: ThemeManager().getOrangeColor,
                                    indicatorBackgroundColor: ThemeManager().getGreyButtonColor,
                                    padding: EdgeInsets.only(bottom: height * 0.02),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ):
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: height*0.02,right: width*0.05),
                              height: kIsWeb ? height* 0.50:height * 0.28,
                              width: width,
                              child: CarouselSlider.builder(
                                unlimitedMode: true,
                                itemCount: sliderImageView.length,
                                slideBuilder: (index) {
                                  return Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(sliderImageView[index]["foodImage"].toString()),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),

                                          Container(
                                            height: height,
                                            width: width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                begin: Alignment.center,
                                                end: Alignment.center,
                                                colors: [ ThemeManager().getBlackColor.withOpacity(0.5), ThemeManager().getBlackColor.withOpacity(0.4),ThemeManager().getBlackColor.withOpacity(0.2)],
                                                tileMode: TileMode.repeated,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: height*0.18,left: width*0.05),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(sliderImageView[index]["foodName"],textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.w600,
                                                color: ThemeManager().getWhiteColor),
                                            ),
                                            Text(sliderImageView[index]["address"],textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.w600,
                                                color: ThemeManager().getGreyButtonColor),
                                            ),
                                          ],),
                                      ),
                                    ],
                                  );
                                },
                                slideTransform: const DefaultTransform(),
                                slideIndicator: CircularSlideIndicator(
                                  indicatorRadius: 5,
                                  itemSpacing: 15,
                                  currentIndicatorColor: ThemeManager().getOrangeColor,
                                  indicatorBackgroundColor: ThemeManager().getGreyButtonColor,
                                  padding: EdgeInsets.only(bottom: height * 0.02),
                                ),
                              ),
                            ),


                          ],
                        ),
                        //------------------------topCategories title---------------------
                        Container(
                          margin: EdgeInsets.only(right: width*0.03),
                          child: Row(
                            children: [
                              Text(TextConst.topCategories,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager().getBlackColor),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(TextConst.showAll,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeManager().getOrangeColor),
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right,color: ThemeManager().getOrangeColor)
                            ],
                          ),
                        ),
                        //------------------------topCategories view---------------------

                        Container(
                          margin: EdgeInsets.only(top: height*0.015,left: width*0.0),
                          height: kIsWeb ? height *0.4: height*0.2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: topCategoriesDetail.length,
                              itemBuilder: (BuildContext context,int index){
                                return  isLoad==true? Shimmer.fromColors(
                                    baseColor: ThemeManager().getGreyButtonColor,
                                    highlightColor: Colors.grey,
                                    direction: ShimmerDirection.ltr,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: width*0.03,bottom: height*0.01),
                                          height: height*0.13,
                                          width: width*0.25,
                                          color: ThemeManager().getGreyButtonColor,
                                        ),
                                        Container(
                                          height: height*0.02,
                                          width:width*0.2,
                                          decoration: BoxDecoration(
                                              color: ThemeManager().getGreyButtonColor,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: height*0.003),
                                          height: height*0.01,
                                          width:width*0.15,
                                          decoration: BoxDecoration(
                                              color: ThemeManager().getGreyButtonColor,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                        ),
                                      ],
                                    )
                                ):Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: width*0.03,bottom: height*0.012),
                                      height: height*0.13,
                                      width: width*0.25,
                                      decoration: BoxDecoration(
                                        color: topCategoriesDetail[index]["color"],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(topCategoriesDetail[index]["foodImage"],scale:4.0,),
                                    ),
                                    Text(topCategoriesDetail[index]["foodName"],style: aveNirLTProMedium.copyWith(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeManager().getBlackColor),
                                    ),
                                    Text(topCategoriesDetail[index]["places"],style: aveNirLTProMedium.copyWith(
                                        fontSize: width * 0.032,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeManager().getGrey2Color),
                                    ),
                                  ],
                                );
                              }),
                        ),

                        //-----------------------discoverPlaces title-----------------------------
                        Container(
                          margin: EdgeInsets.only(left: width*0.0,right: width*0.02,top: height*0.01),
                          child: Row(
                            children: [
                              Text(TextConst.discoverPlaces,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager().getBlackColor),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(TextConst.showAll,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeManager().getOrangeColor),
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right,color: ThemeManager().getOrangeColor,)
                            ],
                          ),
                        ),
                        //-----------------------discoverPlaces view-----------------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.018,left: width*0.0),
                          height: kIsWeb? height*0.75:height*0.35,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: discoverDetail.length,
                              itemBuilder: (BuildContext context,int index){
                                return isLoad==true? Shimmer.fromColors(
                                  baseColor: ThemeManager().getGreyButtonColor,
                                  highlightColor: Colors.grey,
                                  direction: ShimmerDirection.ltr,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: width*0.04,bottom: height*0.015),
                                        height: height*0.25,
                                        width:height*0.29,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ThemeManager().getGreyButtonColor,
                                        ),
                                      ),
                                      Container(
                                        height: height*0.015,
                                        width:width*0.4,
                                        decoration: BoxDecoration(
                                            color: ThemeManager().getGreyButtonColor,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: height*0.003),
                                        height: height*0.01,
                                        width:width*0.3,
                                        decoration: BoxDecoration(
                                            color: ThemeManager().getGreyButtonColor,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: height*0.00),
                                            height: height*0.01,
                                            width:width*0.2,
                                            decoration: BoxDecoration(
                                                color: ThemeManager().getGreyButtonColor,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: height*0.003),
                                            height: height*0.01,
                                            width:width*0.2,
                                            decoration: BoxDecoration(
                                                color: ThemeManager().getGreyButtonColor,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ): Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: width * 0.04,
                                          bottom: height * 0.015),
                                      height: height * 0.25,
                                      width: height * 0.28,
                                      child: Image.asset(discoverDetail[index]["discoverImage"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          discoverDetail[index]["name"],
                                          style: aveNirLTProMedium.copyWith(
                                              fontSize: width * 0.045,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeManager().getBlackColor),
                                        ),
                                        Text(
                                          discoverDetail[index]["subtitle"],
                                          style:
                                          aveNirLTProMedium.copyWith(
                                              fontSize: width * 0.036,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeManager().getGrey2Color),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: height*0.003),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                discoverDetail[index]["starImage"],scale: 4.0,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: width * 0.01),
                                                child: Text(discoverDetail[index]["starcount"],
                                                  style: aveNirLTProMedium.copyWith(
                                                      fontSize: width * 0.036,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeManager().getBlackColor),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: width*0.01),
                                                child: Text(
                                                  discoverDetail[index]["rating"],
                                                  style: aveNirLTProMedium.copyWith(
                                                      fontSize: width * 0.035,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeManager().getGrey2Color),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: width*0.024,top: height*0.001),
                                                padding:
                                                EdgeInsets.symmetric(
                                                    vertical: height * 0.002,
                                                    horizontal: width * 0.03),
                                                decoration: BoxDecoration(color: ThemeManager().getOrangeColor,
                                                    borderRadius: BorderRadius.circular(50)),
                                                child: Text(
                                                  discoverDetail[index]["Category"],
                                                  style: aveNirLTProMedium.copyWith(
                                                      fontSize: width * 0.035,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeManager().getWhiteColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }),
                        ),
                        //-----------------------------recent Offers-----------------------------------
                        Container(
                          margin: EdgeInsets.only(left: width*0.0,right: width*0.03,top: height*0.01),
                          child: Row(
                            children: [
                              Text(TextConst.recentOffers,textAlign: TextAlign.center, style: aveNirLTProBlack.copyWith(
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager().getBlackColor),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(TextConst.showAll,textAlign:TextAlign.center, style: aveNirLTProBlack.copyWith(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeManager().getOrangeColor),
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right,color: ThemeManager().getOrangeColor)
                            ],
                          ),
                        ),
                        //-----------------------------recent Offers view----------------------------------
                        Container(
                          margin: EdgeInsets.only(top: height*0.015,left: width*0.0),
                          height: kIsWeb?height*0.60:height*0.36,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: recentOffer.length,
                              itemBuilder: (BuildContext context,int index){
                                return isLoad==true? Shimmer.fromColors(
                                  baseColor: ThemeManager().getGreyButtonColor,
                                  highlightColor: Colors.grey,
                                  direction: ShimmerDirection.ltr,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: width*0.04,bottom: height*0.015),
                                        height: height*0.25,
                                        width:height*0.27,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ThemeManager().getGreyButtonColor,
                                        ),

                                      ),
                                      Container(
                                        height: height*0.015,
                                        width:width*0.4,
                                        decoration: BoxDecoration(
                                            color: ThemeManager().getGreyButtonColor,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: height*0.003),
                                        height: height*0.01,
                                        width:width*0.3,
                                        decoration: BoxDecoration(
                                            color: ThemeManager().getGreyButtonColor,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),

                                    ],
                                  ),
                                ):Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: width*0.04,bottom: height*0.015),
                                      height: height*0.25,
                                      width:height*0.28,
                                      child: Image.asset(recentOffer[index]["recentImage"],fit: BoxFit.fill,),
                                    ),
                                    Text(recentOffer[index]["offer"],style: aveNirLTProMedium.copyWith(
                                        fontSize: width * 0.042,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeManager().getBlackColor),
                                    ),
                                    Text(recentOffer[index]["name"],style: aveNirLTProMedium.copyWith(
                                        fontSize: width * 0.036,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeManager().getGrey2Color),
                                    ),

                                  ],
                                );

                              }),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  //----------------------------------check permission-------------------------
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
      Navigator.pop(context);
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

  //---------------------------------enable permission pop up-----------------------------
  enablePermissionPopUp()async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context,) {
          return WillPopScope( onWillPop:()async=> false,child:  AlertDialog(
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
                    child: Text("Enable Your Location", style: aveNirLTProMedium.copyWith(
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
}