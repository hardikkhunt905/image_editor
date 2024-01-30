import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/Constants/Utils/utils.dart';
import 'package:image_editor/Elements/Widgets/custom_styles.dart';
import 'package:image_editor/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        required this.controller,
        this.radius = 10,
        this.keyboardType,
        this.borderColor = MyColor.cyan,
        this.fillColor = MyColor.white,
        this.boderWidth = 1,
        this.outPadding = 10,
        this.fontSize = 22,
        this.contentPadding,
        this.maxLength,
        this.counter = false,
        this.hint = '',
        this.obscureText = false,
        this.textAlign,
        this.enabled,
        this.onChange,
        this.validator,
        this.displayError = false,
        this.height,
        this.errorTextStyle,
        this.animation = false,
        this.inputFormatter,
        this.maxLines})
      : super(key: key);

  final TextEditingController controller;
  final double radius;
  final Color borderColor;
  final bool animation;
  final bool displayError;
  final Color fillColor;
  final double boderWidth;
  final bool? enabled;
  final double? height;
  final double fontSize;
  final double outPadding;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final bool counter;
  final bool obscureText;
  final String hint;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextStyle? errorTextStyle;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outPadding),
      child: SizedBox(
          width: Utils.isTablet ? 200.w : null,
          height: height,
          child: TextFormField(
            style: CustomStyles.textStyle(fontSize: fontSize),
            controller: controller,
            expands: false,
            inputFormatters: inputFormatter,
            maxLines: maxLines ?? 1,
            onChanged: onChange,
            enabled: enabled,
            keyboardType: keyboardType,
            autofocus: false,
            textAlign: textAlign ?? TextAlign.start,
            obscureText: obscureText,
            validator: validator,
            maxLength: maxLength,
            decoration: InputDecoration(
                filled: true,
                counterText: counter ? null : '',
                contentPadding: contentPadding,
                fillColor: fillColor,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: borderColor, width: boderWidth),
                    borderRadius: BorderRadius.circular(radius)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor.withOpacity(0.2), width: boderWidth),
                    borderRadius: BorderRadius.circular(radius)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: borderColor, width: boderWidth),
                    borderRadius: BorderRadius.circular(radius)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.black)),
                // errorText: '',
                errorStyle: displayError
                    ? errorTextStyle ?? CustomStyles.textStyle(fontSize: 15.sp)
                    : const TextStyle(fontSize: 0),
                hintText: hint),
          )),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? title;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool hasTitle;
  final bool hasTitleIcon;
  final Widget? titleIcon;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? textFormFieldMargin;
  final TextEditingController controller;
  final double radius;
  final bool animation;
  final bool displayError;
  final Color? fillColor;
  final double boderWidth;
  final bool? enabled;
  final double fontSize;
  final int? maxLength;
  final bool counter;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextStyle? errorTextStyle;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onChange;
  final TextInputAction? textInputAction;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsets? scrollPadding;

  const CustomTextFormField(
      {super.key,
        this.prefixIcon,
        this.suffixIcon,
        this.textStyle,
        this.hintTextStyle,
        this.labelStyle,
        this.titleStyle,
        this.titleIcon,
        this.hasTitleIcon = false,
        this.title,
        this.contentPadding,
        this.textFormFieldMargin,
        this.hasTitle = false,
        this.border,
        this.focusedBorder,
        this.errorBorder,
        this.enabledBorder,
        this.hintText,
        this.labelText,
        this.hasPrefixIcon = false,
        this.hasSuffixIcon = false,
        this.obscured = false,
        this.textInputType,
        this.onChanged,
        this.validator,
        this.inputFormatters,
        this.width,
        this.height,
        required this.controller,
        this.radius = 10,
        this.keyboardType,
        this.boderWidth = 1,
        this.fontSize = 22,
        this.maxLength,
        this.counter = false,
        this.obscureText = false,
        this.textAlign,
        this.enabled,
        this.onChange,
        this.displayError = false,
        this.errorTextStyle,
        this.animation = false,
        this.maxLines,
        this.textInputAction,
        this.minLines,
        this.suffixIconConstraints,
        this.scrollPadding,
        this.fillColor,
        this.prefixIconConstraints})
      : assert((!hasTitleIcon && titleIcon == null) ||
      (hasTitleIcon && titleIcon != null)),
        assert((!hasTitle && title == null) || (hasTitle && title != null));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            hasTitleIcon ? titleIcon! : Container(),
            hasTitle ? Text(title!, style: titleStyle) : Container(),
          ],
        ),
//        hasTitle ? SpaceH4() : Container(),
        TextFormField(obscuringCharacter: "●",
          textInputAction: textInputAction,
          scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
          cursorWidth: Sizes.WIDTH_2,
          // cursorHeight: Sizes.TEXT_SIZE_16,
          cursorColor: MyColor.gray.withOpacity(0.5),
          style: textStyle,
          keyboardType: textInputType,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: fillColor ?? MyColor.white,
            contentPadding: contentPadding,
            labelText: labelText,
            labelStyle: labelStyle,
            border: border,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            // focusedErrorBorder: Borders.primaryInputBorder,
            prefixIcon: hasPrefixIcon ? prefixIcon : null,
            suffixIcon: hasSuffixIcon ? suffixIcon : null,
            suffixIconConstraints: suffixIconConstraints ?? BoxConstraints(minWidth: Sizes.WIDTH_2, minHeight: Sizes.WIDTH_2),
            prefixIconConstraints: prefixIconConstraints ?? BoxConstraints(minWidth: Sizes.WIDTH_2, minHeight: Sizes.WIDTH_2),
            hintText: hintText,
            hintStyle: hintTextStyle ??
                TextStyles.bodyText2.copyWith(color: MyColor.grey),
          ),
          obscureText: obscureText,
          controller: controller,
          expands: false,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          enabled: enabled,
          autofocus: false,
          textAlign: textAlign ?? TextAlign.start,
          maxLength: maxLength,
        )
      ],
    );
  }
}

