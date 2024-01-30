part of 'values.dart';

class Decorations {
  Decorations._();

  static BoxDecoration customBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
  }) =>
      BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: blurRadius, color: color)]);

  static OutlineInputBorder textFieldBorder({Color? color, double? radius}) =>
      OutlineInputBorder(
          borderSide: BorderSide(color: color ?? MyColor.white, width: 1.5),
          borderRadius: BorderRadius.circular(Sizes.RADIUS_30));

 static UnderlineInputBorder underlineInputBorder({Color? color, double? radius}) =>
      UnderlineInputBorder(
          borderSide: BorderSide(color: color ?? MyColor.white, width: 1.5),
          borderRadius: BorderRadius.circular(Sizes.RADIUS_30));

  static BoxDecoration onBoardingButtonDecoration(
      {Color? color, double? radius}) =>
      BoxDecoration(shape: BoxShape.circle, color: color ?? MyColor.appTheme);

  static InputDecoration textFieldOutDecoration({
    String? hint,
    Color? fillColor,
    Color? hintColor,
    Color? borderColor,
    EdgeInsetsGeometry? contentPadding,
  })=> InputDecoration(
    fillColor: fillColor ?? MyColor.appTheme14,
    filled: true,
    contentPadding: contentPadding ?? EdgeInsets.symmetric(
        horizontal: Sizes.WIDTH_20,
        vertical: Sizes.HEIGHT_14),
    border: Decorations.searchDecoration(radius: Sizes.RADIUS_30,borderColor: borderColor),
    focusedBorder: Decorations.searchDecoration(radius: Sizes.RADIUS_30,borderColor: borderColor),
    enabledBorder: Decorations.searchDecoration(radius: Sizes.RADIUS_30,borderColor: borderColor),
    hintText: hint,
    hintStyle: TextStyles.hintTextStyle.copyWith(fontSize: Sizes.TEXT_SIZE_28,
        color:  hintColor ?? MyColor.whiteShade1),
    // suffixIcon: isFieldFocus.value
    //     ? IconButton(
    //   icon: Icon(
    //     Icons.clear,
    //     color: isContrast
    //         ? MyColor.white
    //         : MyColor.black,
    //     size: Sizes.WIDTH_34,
    //   ),
    //   onPressed: () {
    //     Get.focusScope?.unfocus();
    //     searchTextController?.clear();
    //   },
    // )
    //
    // // Add a search icon or button to the search bar
    // prefixIcon: IconButton(
    //   padding: EdgeInsets.only(bottom: Sizes.WIDTH_2),
    //   icon: Image.asset(
    //     IconPath.searchIcon,
    //     color: isContrast
    //         ? isFieldFocus.value
    //         ? MyColor.white
    //         : MyColor.whiteShade1
    //         : isFieldFocus.value
    //         ? MyColor.black
    //         : MyColor.gray,
    //     width: Sizes.WIDTH_32,
    //     height: Sizes.WIDTH_32,
    //   ),
    //   onPressed: () {
    //     // Perform the search here
    //   },
    // ),
  );

  static BoxDecoration exitDialogBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
  }) =>
      BoxDecoration(color: color, shape: shape, borderRadius: borderRadius);

  static BoxDecoration textFieldDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
        border: Border.all(color: MyColor.appTheme, width: 1));
  }

  static BoxDecoration loginBoxDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth,
        List<BoxShadow>? boxShadow}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius:
          borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 0)),
          border: Border.all(
              color: borderColor ?? MyColor.black, width: borderWidth ?? 2),
          boxShadow: boxShadow ?? []);

  static List<BoxShadow> personDetailBoxShadow(
      {Color? color,
        double? blurRadius,
        BlurStyle? blurStyle,
        Offset? offset,
        double? spreadRadius}) =>
      [
        BoxShadow(
          color: color ?? MyColor.boxShadow,
          blurRadius: blurRadius ?? 50,
          blurStyle: blurStyle ?? BlurStyle.normal,
          offset: offset ?? const Offset(0, 20),
          spreadRadius: spreadRadius ?? 0,
        )
      ];

  static BoxDecoration borderDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius:
          borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 0)),
          border: Border.all(
              color: borderColor ?? MyColor.textHintColor,
              width: borderWidth ?? 1.5));

  static RoundedRectangleBorder roundedRectangleBorderDecoration({
    double? borderRadius,
    Color? bdColor,
    Color? borderColor,
    Color? bgColor,
    double? borderWidth,
    BoxShape? boxShape,
    List<BoxShadow>? boxShadow
  }) {
    return RoundedRectangleBorder(side: BorderSide(color: bgColor ?? MyColor.transparent),

        // border: Border.all(color: borderColor ?? MyColor.transparent,width: borderWidth ?? 0),
        borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_10),
        // boxShadow:  boxShadow,
        // shape: boxShape ?? BoxShape.rectangle
    );
  }


  static BoxDecoration roundedBoxDecoration({
    double? borderRadius,
    Color? bdColor,
    Color? borderColor,
    Color? bgColor,
    double? borderWidth,
    BoxShape? boxShape,
    List<BoxShadow>? boxShadow
  }) {
    return BoxDecoration(color: bgColor ?? MyColor.white,
        border: Border.all(color: borderColor ?? MyColor.transparent,width: borderWidth ?? 0),
        borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_10),
        boxShadow:  boxShadow,
        shape: boxShape ?? BoxShape.rectangle
    );
  }

  static BoxDecoration circleBoxDecoration({
    double? borderRadius,
    Color? bdColor,
    Color? borderColor,
    Color? bgColor,
    double? borderWidth,
    BoxShape? boxShape,
    List<BoxShadow>? boxShadow
  }) {
    return BoxDecoration(color: bgColor ?? MyColor.white,
        border: Border.all(color: borderColor ?? MyColor.transparent,width: borderWidth ?? 0),
        // borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_10),
        boxShadow:  boxShadow,
        shape: boxShape ?? BoxShape.rectangle
    );
  }

  static List<BoxShadow>? bgBoxShadow({double? blurRadius,Offset? offset,Color? color}) {
    return [
      BoxShadow(
        color: color ?? Colors.grey.withOpacity(0.3),
        blurRadius: blurRadius ?? 3,
        offset: offset ?? const Offset(0, 2),
      )];
  }

  static List<BoxShadow>? bgBoxShadow1({double? blurRadius,Offset? offset,Color? color}) => [
      BoxShadow(
        color: color ?? MyColor.textColor.withOpacity(0.4),
        blurRadius: blurRadius ?? 4,
        offset: offset ?? const Offset(0, 0),
      )];

 static List<BoxShadow>? appBarBoxShadow({double? blurRadius,Offset? offset,Color? color}) {
    return [
      BoxShadow(
        color: color ?? MyColor.black16,
        blurRadius: blurRadius ?? 6,
        offset: offset ?? const Offset(0, 4),
      )];
  }

  static List<BoxShadow>? buttonShadow({double? blurRadius,Offset? offset,Color? color}) {
    return [
      BoxShadow(
        color: color ?? MyColor.black25,
        blurRadius: blurRadius ?? 4,
        offset: offset ?? const Offset(0, 4),
      )];
  }

  // static List<BoxShadow>? fontShadow({double? blurRadius,Offset? offset,Color? color}) {
  //   return [
  //     BoxShadow(
  //       color: color ?? MyColor.black25,
  //       blurRadius: blurRadius ?? 4,
  //       offset: offset ?? const Offset(0, 4),
  //     )];
  // }

  static BoxDecoration borderShadowDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius:
          borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 0)),
          border: Border.all(
              color: borderColor ?? MyColor.textHintColor,
              width: borderWidth ?? 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.2,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ]);

  static BoxDecoration roundedBottomDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        List<BoxShadow>? boxShadow,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius ??
              BorderRadius.only(
                  bottomLeft: Radius.circular(radius ?? Sizes.RADIUS_80),
                  bottomRight: Radius.circular(radius ?? Sizes.RADIUS_80)),
          border: Border.all(
              color: borderColor ?? MyColor.white, width: borderWidth ?? 2),
        boxShadow: boxShadow
      );

  static BoxDecoration roundedTopDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        List<BoxShadow>? boxShadow,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius ??
              BorderRadius.only(
                  topLeft: Radius.circular(radius ?? Sizes.RADIUS_80),
                  topRight: Radius.circular(radius ?? Sizes.RADIUS_80)),
          border: Border.all(
              color: borderColor ?? MyColor.white, width: borderWidth ?? 2),
      boxShadow: boxShadow);

 static BoxDecoration roundedEndDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius ??
              BorderRadius.only(
                  topRight: Radius.circular(radius ?? Sizes.RADIUS_10),
                  bottomRight: Radius.circular(radius ?? Sizes.RADIUS_10)),
          border: Border.all(
              color: borderColor ?? MyColor.white, width: borderWidth ?? 2));

 static BoxDecoration roundedStartDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius ??
              BorderRadius.only(
                  topLeft: Radius.circular(radius ?? Sizes.RADIUS_10),
                  bottomLeft: Radius.circular(radius ?? Sizes.RADIUS_10)),
          border: Border.all(
              color: borderColor ?? MyColor.white, width: borderWidth ?? 2));

  static OutlineInputBorder searchDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      OutlineInputBorder(
        borderSide:
        BorderSide(color: borderColor ?? MyColor.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
      );

  static RoundedRectangleBorder appBarShape(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Sizes.RADIUS_80),
              bottomRight: Radius.circular(Sizes.RADIUS_80)));

  static BoxDecoration floatingBoxDecoration(
      {Color? color,
        Color? borderColor,
        BoxShape? shape,
        BorderRadiusGeometry? borderRadius,
        double? radius,
        BoxBorder? border,
        double? borderWidth}) =>
      BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_80)),
        boxShadow: [
          BoxShadow(
            color: MyColor.floatingButtonColor.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: MyColor.floatingButtonColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      );
}
