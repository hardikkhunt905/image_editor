part of 'values.dart';

class TextStyles{
  TextStyles._();

  static final textStyle = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500);

  static final titleTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 22.sp,fontFamily: FontFamily.inter) ;
  static final headline1 = TextStyle(color:MyColor.text1Color,fontWeight: FontWeight.w500,fontSize: Sizes.TEXT_SIZE_30,fontFamily: FontFamily.inter);
  static final headline2 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 20.sp,fontFamily: FontFamily.inter);
  static final bodyText4 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 12.sp,fontFamily: FontFamily.inter);
  static final bodyText3 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 14.sp,fontFamily: FontFamily.inter);
  static final bodyText5 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 15.sp,fontFamily: FontFamily.inter);
  static final bodyText2 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 16.sp,fontFamily: FontFamily.inter);
  static final bodyText1 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 18.sp,fontFamily: FontFamily.inter);
  static final subtitle1 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 20.sp,fontFamily: FontFamily.inter);


  static final titleTextStyle1 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w600,fontSize: 44.sp,fontFamily: FontFamily.inter) ;
  static final titleTextStyle2 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w600,fontSize: Sizes.TEXT_SIZE_40,fontFamily: FontFamily.inter) ;
  static final titleTextStyle3 = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w600,fontSize: Sizes.TEXT_SIZE_38,fontFamily: FontFamily.inter) ;

  static final appbarTitleStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 18.sp,fontFamily: FontFamily.inter);
  static final listTitleTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 34.sp,fontFamily: FontFamily.inter);
  static final loginTitleTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 35.sp,fontFamily: FontFamily.inter);
  static final hintTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 28.sp,fontFamily: FontFamily.inter);
  static final highLightTextStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w600,fontSize: 26.sp,fontFamily: FontFamily.inter);
  static final manPowerTitleTextStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w500,fontSize: 25.sp,fontFamily: FontFamily.inter);
  static final tabTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w700,fontSize: 26.sp,fontFamily: FontFamily.inter);
  static final bottomLineTextStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w500,fontSize: 30.sp,fontFamily: FontFamily.inter);
  static final smallTextStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w500,fontSize: 26.sp,fontFamily: FontFamily.inter);
  static final punchListTextStyle = TextStyle(color:MyColor.text2Color,fontWeight: FontWeight.w500,fontSize: 32.sp,fontFamily: FontFamily.inter);

  static final personDetailTextStyle = TextStyle(color:MyColor.text2Color,fontWeight: FontWeight.w500,fontSize: 24.sp,fontFamily: FontFamily.inter);

  static final bankTitleStyle = TextStyle(color:MyColor.white,fontWeight: FontWeight.w500,fontSize: 38.sp,fontFamily: FontFamily.inter);
  static final countTextStyle = TextStyle(color:MyColor.white,fontWeight: FontWeight.w600,fontSize: 36.sp,fontFamily: FontFamily.inter);
  static final TextStyle profileTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 36.sp,fontFamily: FontFamily.inter);

  static final buttonTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w500,fontSize: 16.sp,fontFamily: FontFamily.inter) ;
  static final dropDownTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 14.sp,fontFamily: FontFamily.inter) ;
  static final paymentTextStyle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w600,fontSize: 22.sp,fontFamily: FontFamily.inter) ;
  static final profileNoTextStyle = TextStyle(color:MyColor.text2Color,fontWeight: FontWeight.w500,fontSize: 22.sp,fontFamily: FontFamily.inter) ;

  static final punchLoginTitle = TextStyle(color:MyColor.textColor,fontWeight: FontWeight.w600,fontSize: 48.sp,fontFamily: FontFamily.inter) ;

  static final loanStatusTextStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w600,fontSize: 30.sp,fontFamily: FontFamily.inter);



  // DARK MODE TEXT STYLES
  static final _lightScreenHeading1TextStyle = TextStyle(fontSize: 26.0.sp,fontWeight:FontWeight.bold, color: MyColor.black,fontFamily: FontFamily.inter);
  static final darkScreenHeading1TextStyle = _lightScreenHeading1TextStyle.copyWith(color: MyColor.white);
}