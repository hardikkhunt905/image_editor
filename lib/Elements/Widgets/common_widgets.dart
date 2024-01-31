import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Constants/constants.dart';
import '../../Values/values.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class CommonWidgets {
  CommonWidgets._();

  static Widget textFieldWidget(
          {String? title,
          String? hintText,
          int? maxLines,
          bool? isTitle,
          TextEditingController? controller,
          String? Function(String?)? validator,
          TextInputType? keyboardType,
          Widget? child,
          TextStyle? textStyle,
          TextStyle? tileTextStyle,
          bool? isBorder,
          double? width,
          double? height,
          EdgeInsetsGeometry? padding,
          EdgeInsetsGeometry? insidePadding,
          Color? borderColor,
          bool? obscureText,
          void Function()? onIconClick,
          String? imagePath,
          bool? isSuffixIcon,
          EdgeInsets? scrollPadding,
          BoxConstraints? suffixIconConstraints,
          dynamic Function(String)? onChange,
          List<TextInputFormatter>? inputFormatters}) =>
      SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                  horizontal: Sizes.WIDTH_20, vertical: Sizes.HEIGHT_5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isTitle ?? true)
                Text(title ?? '',
                    style: tileTextStyle ?? TextStyles.hintTextStyle)
              else
                const SizedBox.shrink(),
              Padding(
                padding: insidePadding ??
                    EdgeInsets.symmetric(vertical: Sizes.HEIGHT_8),
                child: child ??
                    CustomTextFormField(
                        onChange: onChange,
                        inputFormatters: inputFormatters,
                        obscureText: obscureText ?? false,
                        textInputType: keyboardType,
                        scrollPadding: scrollPadding,
                        maxLines: maxLines,
                        fillColor: MyColor.white,
                        keyboardType: keyboardType,
                        textAlign: TextAlign.start,
                        validator: validator,
                        controller: controller ?? TextEditingController(),
                        hintText: hintText,
                        textStyle: textStyle ??
                            TextStyles.bodyText2
                                .copyWith(color: MyColor.appTheme),
                        border: Decorations.textFieldBorder(color: borderColor),
                        focusedBorder:
                            Decorations.textFieldBorder(color: borderColor),
                        enabledBorder:
                            Decorations.textFieldBorder(color: borderColor),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: Sizes.HEIGHT_10,
                            horizontal: Sizes.HEIGHT_10),
                        hasSuffixIcon: isSuffixIcon ?? false,
                        suffixIconConstraints: suffixIconConstraints,
                        suffixIcon: Container(
                          padding: EdgeInsets.all(Sizes.WIDTH_2),
                          margin: EdgeInsets.only(right: Sizes.WIDTH_10),
                          child: GestureDetector(
                            onTap: onIconClick,
                            child: Image.asset(
                              imagePath ?? '',
                              width: Sizes.WIDTH_10,
                              height: Sizes.WIDTH_10,
                              color: MyColor.gray,
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      );

  static Widget appButton(
          {required String buttonText,
          void Function()? onTap,
          Color? bgColor,
          Color? textColor,
          TextStyle? textStyle,
          double? width,
          double? height,
          double? buttonRadius,
          EdgeInsets? padding,
          bool? isChangeColor}) =>
      CustomButton(
        padding: padding,
        isChangeColor: isChangeColor,
        radius: buttonRadius,
        title: buttonText,
        onTap: onTap,
        bgColor: bgColor ?? MyColor.appTheme,
        textStyle: textStyle ??
            TextStyles.headline2.copyWith(
                color: textColor ?? MyColor.white,
                fontWeight: FontWeight.w600),
        size: Size(width ?? screenWidth / 1.8, height ?? Sizes.HEIGHT_50),
      );

  static Widget screenButton(
          {required String buttonText,
          void Function()? onTap,
          Color? bgColor,
          Color? textColor,
          TextStyle? textStyle,
          double? width,
          double? height,
          double? buttonRadius,
          EdgeInsets? padding,
          bool? isChangeColor,
            List<Shadow>? fontShadow
          }) =>
      CustomButton(
        padding: padding,
        isChangeColor: isChangeColor,
        radius: buttonRadius ?? Sizes.RADIUS_32,
        title: buttonText,
        onTap: onTap,
        bgColor: bgColor ?? MyColor.appTheme,
        textStyle: textStyle ??
            TextStyles.bodyText3.copyWith(
                color: textColor ?? MyColor.white,
                fontWeight: FontWeight.w600),
        size: Size(width ?? screenWidth / 3, height ?? Sizes.HEIGHT_44),
      );

  static Widget smallButton(
          {required String buttonText,
          void Function()? onTap,
          Color? bgColor,
          Color? textColor,
          TextStyle? textStyle,
          double? width,
          double? height,
          EdgeInsets? padding,
          double? radius,
          bool? isChangeColor}) =>
      CustomButton(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
        isChangeColor: isChangeColor,
        title: buttonText,
        onTap: onTap,
        radius: radius,
        bgColor: bgColor ?? MyColor.appTheme,
        textStyle: textStyle ??
            TextStyles.headline1.copyWith(
                color: textColor ?? MyColor.white, fontWeight: FontWeight.w600),
        size: Size(width ?? screenWidth / 4, height ?? Sizes.HEIGHT_50),
      );

  //role-login screen
  static Widget titleText({required String text}) =>
      Text(text, style: TextStyles.titleTextStyle2);

  static Widget subTileText({required String text, TextStyle? style}) =>
      Text(text, style: style ?? TextStyles.headline1);



  static Widget cardBox({Widget? child}) => Card(
      shape: Decorations.roundedRectangleBorderDecoration(),
      elevation: 10,color: MyColor.white,surfaceTintColor: MyColor.whiteShade1,
      shadowColor: MyColor.shadowColor,
      child: child,
    );


  static Widget roundedIcon({
    required String iconPath,
    double? radius,
    Color? bgColor,
    Color? iconColor,
    double? imageSize,
  }) =>
      CircleAvatar(
        backgroundColor: bgColor,
        radius: radius ?? Sizes.WIDTH_22,
        // backgroundImage: AssetImage(iconPath),
        child: Image.asset(
          // colorBlendMode: BlendMode.darken,
          iconPath,
          width: imageSize ?? Sizes.WIDTH_20,
          height: imageSize ?? Sizes.WIDTH_20,
          color: iconColor,
        ),
      );

  static Widget textFormFieldWidget({
    required TextEditingController controller,
    String? hint,
    String? suffixPath,
    bool? hasSuffixIcon,
    bool? obscureText,
    void Function()? onSuffixTap,
    Color? prefixColor,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    EdgeInsetsGeometry? contentPadding,
    Function(String)? onChanged,
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
  }) =>
      CustomTextFormField(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
                vertical: Sizes.HEIGHT_10, horizontal: Sizes.WIDTH_20),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText ?? false,
        controller: controller,
        hintText: hint,
        hintTextStyle:
            TextStyles.bodyText2.copyWith(color: MyColor.textFieldHintColor),
        textStyle: TextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500),
        fillColor: MyColor.transparent,
        // borderColor: MyColor.grey,
        border: border ?? Decorations.textFieldBorder(color: MyColor.grey),
        focusedBorder:
            focusedBorder ?? Decorations.textFieldBorder(color: MyColor.grey),
        enabledBorder: enabledBorder ??
            Decorations.textFieldBorder(
              color: MyColor.grey,
            ),
        suffixIcon: IconButton(
          icon: Image.asset(suffixPath ?? '',
              height: Sizes.WIDTH_32,
              width: Sizes.WIDTH_32,
              color: MyColor.gray),
          padding: EdgeInsets.only(right: Sizes.WIDTH_6),
          onPressed: onSuffixTap,
        ),
        hasSuffixIcon: hasSuffixIcon ?? false,
      );

  // midline check screen
  static Widget styleWidget(
          {required String title,
          required String value,
          EdgeInsetsGeometry? padding}) =>
      Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: Sizes.WIDTH_20),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Sizes.HEIGHT_8, horizontal: Sizes.WIDTH_14),
          decoration:
              Decorations.roundedBoxDecoration(bgColor: MyColor.styleBgColor),
          child: Row(
            children: [
              Text('$title : ',
                  style:
                      TextStyles.bodyText1.copyWith(color: MyColor.dateColor)),
              Text(value,
                  style: TextStyles.bodyText1.copyWith(color: MyColor.black50)),
            ],
          ),
        ),
      );
}
