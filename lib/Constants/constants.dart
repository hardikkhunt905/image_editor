import 'dart:developer' as d;
import 'package:image_editor/Values/values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

const debug = true;
const countToastDebug = false;
const inDevelopment = true;

const uiFontFamily = 'Poppins';

Logger logger = Logger();

const appScreenSize = Size(360, 800);
final double screenWidth = ScreenUtil().screenWidth;
final double screenHeight = ScreenUtil().screenWidth;
final double screenHeightOrg = ScreenUtil().screenHeight;

// Method channel
const nativeChannel = 'NativeSideChannel';
const inAppReview = 'InAppReview';


// Shared Preference
const String isLogInPref = 'Is User LogIn';
const String tokenPref = 'Token preference';
const loginDataPref = 'Token Data preference';

// Arguments
const String tableIndexArg = 'Table Index Argument';

// database
const databaseName = 'database';
const userDataTable = 'UserDataTable';
const waterDataTable = 'WaterDataTable';

// Notification
const scheduleNotification = 'scheduleNotification';

// Firebase
const application = 'Application';
const appPackageName = 'App Package Name';



class Debug {
  Debug._();
  static void setLog(String val){
    if(debug) logger.d(val);
  }
  static void setErrorLog(String val){
    if(debug) logger.e(val);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) => child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics();
}