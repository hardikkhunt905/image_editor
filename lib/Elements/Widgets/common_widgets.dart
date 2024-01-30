import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_editor/Elements/Widgets/Dialog/gradient_text.dart';
import 'package:image_editor/Elements/Widgets/spaces.dart';
import '../../Constants/constants.dart';
import '../../Routing/Routes.dart';
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

  static Widget heroAnimation({required Object tag, required Widget child}) =>
      Hero(
          tag: tag,
          transitionOnUserGestures: true,
          child: Material(type: MaterialType.transparency, child: child));

  static Widget backButton(
          {void Function()? onTap,
          bool? isImage,
          String? imagePath,
          bool? isShowBackButton,
          double? imageWidth,
          double? imageHeight,
          String? tag}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.HEIGHT_40,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_40),
                child: isShowBackButton ?? false
                    ? GestureDetector(
                        onTap: onTap ?? () => Get.back(),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Image.asset(IconPath.backIcon,
                              width: Sizes.WIDTH_65, height: Sizes.WIDTH_65),
                        ))
                    : const SizedBox.shrink(),
              ),
            ),
            if (isImage ?? false)
              CommonWidgets.heroAnimation(
                  tag: tag ?? '',
                  child: Image.asset(
                    imagePath ?? '',
                    width: imageWidth ?? Sizes.WIDTH_236,
                    height: imageHeight,
                  ))
            else
              const SizedBox.shrink()
          ],
        ),
      );

  static Widget customDropDown({
    required List<String> items,
    String? value,
    String? hint,
    void Function(String?)? onChanged,
    double? borderRadius,
    double? borderWidth,
    Color? borderColor,
    Color? bgColor,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_10),
        decoration: BoxDecoration(
          color: bgColor ?? MyColor.white,
          borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_32),
          border: Border.all(
              color: borderColor ?? MyColor.grey, width: borderWidth ?? 1),
        ),
        child: DropdownButton<String>(isExpanded: true,
          style: TextStyles.dropDownTextStyle.copyWith(color: MyColor.black50),
          iconSize: Sizes.WIDTH_30,
          hint: Text(
            hint ?? '',
            style:
                TextStyles.dropDownTextStyle.copyWith(color: MyColor.textHint1Color,fontWeight: FontWeight.w600 ),
          ),
          underline: const SizedBox.shrink(),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyles.dropDownTextStyle,
                    ),
                  ))
              .toList(),
          value: value != null && value.isEmpty ? null : value,
          onChanged: onChanged,
        ),
      );

  //Home screen
  static Widget tab(
          {double? width, required String text, required RxString count}) =>
      Obx(() {
        bool isZero = count.value == '0';
        String finalText = isZero ? text : '$text (${count.value})';
        return Wrap(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: isZero ? Sizes.WIDTH_16 : Sizes.WIDTH_4),
                child: Tab(text: finalText)),
          ],
        );
      });

  static Widget textColumn(
          {required String titleText,
          required String valueText,
          Color? titleColor,
          Color? valueColor}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText,
              style: TextStyles.personDetailTextStyle
                  .copyWith(color: titleColor, fontWeight: FontWeight.w600)),
          const SpaceH12(),
          Text(valueText,
              style: TextStyles.smallTextStyle.copyWith(
                  color: valueColor ?? MyColor.textColor,
                  fontWeight: FontWeight.w600)),
        ],
      );

  static Widget commPerformanceMenuWidget(
          {required String iconPath,
          required String title,
          required String value,
          void Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: Sizes.WIDTH_120,
          decoration: Decorations.roundedBoxDecoration(
              borderWidth: 1,
              borderRadius: Sizes.RADIUS_8,
              borderColor: MyColor.transparent,
              boxShadow: Decorations.bgBoxShadow(
                  color: MyColor.black10,
                  blurRadius: 4,
                  offset: const Offset(0, 3))),
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: Decorations.roundedBoxDecoration(
                    borderRadius: Sizes.WIDTH_24,
                    boxShadow: Decorations.bgBoxShadow(
                        blurRadius: 4, color: MyColor.black20)),
                child: CommonWidgets.roundedIcon(
                  imageSize: Sizes.WIDTH_24,
                  radius: Sizes.WIDTH_24,
                  iconPath: iconPath,
                  bgColor: MyColor.dotHint50,
                ),
              ),
              const SpaceH12(),
              GradientText(
                value,
                style: TextStyles.bodyText3.copyWith(
                    fontSize: Sizes.TEXT_SIZE_24,
                    color: MyColor.dateColor,
                    fontWeight: FontWeight.w500),
                gradient: const LinearGradient(colors: [
                  Color(0xFFF687F7),
                  Color(0xFF275751),
                ]),
              ),
              const SpaceH8(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.bodyText3.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    color: MyColor.dateColor,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      );

  static Widget samProducedWidget(
          {required String iconPath,
          required String title,
          required String value,
          void Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          // width: Sizes.WIDTH_120,
          decoration: Decorations.roundedBoxDecoration(
              borderWidth: 1,
              borderRadius: Sizes.RADIUS_8,
              borderColor: MyColor.transparent,
              boxShadow: Decorations.bgBoxShadow(
                  color: MyColor.black10,
                  blurRadius: 4,
                  offset: const Offset(0, 3))),
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: Decorations.roundedBoxDecoration(
                    borderRadius: Sizes.WIDTH_24,
                    boxShadow: Decorations.bgBoxShadow(
                        blurRadius: 4, color: MyColor.black20)),
                child: CommonWidgets.roundedIcon(
                  imageSize: Sizes.WIDTH_24,
                  radius: Sizes.WIDTH_24,
                  iconPath: iconPath,
                  bgColor: MyColor.dotHint50,
                ),
              ),
              const SpaceW16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.bodyText3.copyWith(
                        fontSize: Sizes.TEXT_SIZE_18,
                        color: MyColor.dateColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SpaceH8(),
                  GradientText(
                    value,
                    style: TextStyles.bodyText3.copyWith(
                        fontSize: Sizes.TEXT_SIZE_24,
                        color: MyColor.dateColor,
                        fontWeight: FontWeight.w500),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFF22F2F),
                      Color(0xFF845252),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ),
      );


  static Widget cardBox({Widget? child}) => Card(
      shape: Decorations.roundedRectangleBorderDecoration(),
      elevation: 10,color: MyColor.white,surfaceTintColor: MyColor.whiteShade1,
      shadowColor: MyColor.shadowColor,
      child: child,
    );

  static Widget performanceMenuWidget(
          {required String iconPath,
          required String title,
          void Function()? onTap}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_6,vertical: Sizes.HEIGHT_10),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            shape: Decorations.roundedRectangleBorderDecoration(),
            elevation: 10,color: MyColor.white,surfaceTintColor: MyColor.whiteShade1,
            shadowColor: MyColor.shadowColor,
            child: SizedBox(
              width: Sizes.WIDTH_120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonWidgets.roundedIcon(
                    imageSize: Sizes.WIDTH_30,
                    radius: Sizes.WIDTH_30,
                    iconPath: iconPath,
                    bgColor: MyColor.dotHint50,
                  ),
                  const SpaceH16(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.bodyText3.copyWith(
                        fontSize: Sizes.TEXT_SIZE_12,
                        color: MyColor.dateColor,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  static Widget twoItemRow(
          {required String firstTitle,
          required String secondTitle,
          required String firstValue,
          required String secondValue,
          Color? titleColor,
          double? secWidth,
          double? firstWidth,
          Color? valueColor}) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.WIDTH_38, vertical: Sizes.WIDTH_12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: firstWidth ?? Sizes.WIDTH_210,
                child: textColumn(
                    titleText: firstTitle,
                    valueText: firstValue,
                    titleColor: titleColor,
                    valueColor: valueColor)),
            SizedBox(
                width: secWidth ?? Sizes.WIDTH_300,
                child: textColumn(
                    titleText: secondTitle,
                    valueText: secondValue,
                    titleColor: titleColor,
                    valueColor: valueColor)),
          ],
        ),
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

  static Widget productionTopWidget(
          {required String title, required String value, String? iconPath}) =>
      Container(
        width: double.maxFinite,
        decoration: Decorations.roundedBottomDecoration(
            borderColor: MyColor.appTheme,
            radius: Sizes.RADIUS_20,
            boxShadow: Decorations.appBarBoxShadow(),
            color: MyColor.appTheme),
        padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyles.appbarTitleStyle.copyWith(color: MyColor.white),
            ),
            const SpaceH10(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.WIDTH_16, vertical: Sizes.HEIGHT_16),
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(Sizes.RADIUS_32),
                border: Border.all(color: MyColor.grey),
              ),
              child: Row(
                children: [
                  Text(value,
                      style: TextStyles.bodyText4
                          .copyWith(color: MyColor.black50)),
                  const Spacer(),
                  if (iconPath != null)
                    Image.asset(IconPath.calendarIcon,
                        width: Sizes.WIDTH_20, height: Sizes.HEIGHT_20)
                ],
              ),
            ),
            const SpaceH20(),
          ],
        ),
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
