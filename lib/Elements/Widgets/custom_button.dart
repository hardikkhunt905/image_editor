import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor/Constants/Extensions/extensions.dart';
import 'package:image_editor/Constants/Utils/utils.dart';
import 'package:image_editor/Elements/Widgets/spaces.dart';
import 'package:image_editor/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? radius;
  final void Function()? onTap;
  final Color bgColor;
  final double elevation;
  final Color fgColor;
  final Color pressedColor;
  final Color? textColor;
  final String title;
  final double borderWidth;
  final Color borderColor;
  final Size? size;
  final bool shrink;
  final bool? isChangeColor;

  const CustomButton(
      {super.key,
        required this.title,
        this.radius,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.padding,
        this.textStyle,
        this.onTap,
        this.bgColor = MyColor.buttonColor,
        this.elevation = 0,
        this.pressedColor = MyColor.appTheme,
        this.size,
        this.shrink = false,
        this.fgColor = MyColor.white,
        this.textColor, this.isChangeColor});

  @override
  Widget build(BuildContext context) {
    RxBool isButtonPressed = false.obs;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: GestureDetector(
        onTapDown: (_) {
          isChangeColor ?? true ? isButtonPressed.value = true : null;
          // Debug.setLog("here is onTapDown");
        },
        onTapUp: (_) {
          isChangeColor ?? true ? isButtonPressed.value = true : null;
          // Debug.setLog("here is onTapUp");
        },
        onTapCancel: () {
          isChangeColor ?? true ? isButtonPressed.value = false : null;
          // Debug.setLog("here is onTapCancel");
        },
        child: DecoratedBox(
          decoration: Decorations.roundedBoxDecoration(borderRadius: radius ?? 30,boxShadow: Decorations.buttonShadow()),
          child: ElevatedButton(
            key: UniqueKey(),
            onPressed: onTap,
            clipBehavior: Clip.antiAlias,
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(MyColor.black25),
              backgroundColor: MaterialStateProperty.all(bgColor),
              foregroundColor: MaterialStateProperty.all(fgColor),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: MaterialStateProperty.all(BorderSide(
                  color: borderColor,
                  style: BorderStyle.solid,
                  width: borderWidth)),
              elevation: MaterialStateProperty.all(elevation),
              padding: MaterialStateProperty.all(padding ??
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
              overlayColor: MaterialStateProperty.all(pressedColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 30))),
              animationDuration: const Duration(milliseconds: 500),
              splashFactory: InkSplash.splashFactory,
              maximumSize: shrink
                  ? null
                  : MaterialStateProperty.all(size ??
                  (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
              minimumSize: shrink
                  ? null
                  : MaterialStateProperty.all(size ??
                  (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
              visualDensity: VisualDensity.standard,
              // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
            ),
            child: Obx(() => Text(title,
                style: isButtonPressed.value
                    ? (textStyle ?? TextStyles.buttonTextStyle)
                    .copyWith(color: MyColor.white)
                    : textStyle)),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final double? fontSize;
  final EdgeInsets? padding;
  final double? radius;
  final Function onTap;
  final Color bgColor;
  final double elevation;
  final Color fgColor;
  final Color pressedColor;
  final Widget icon;
  final double borderWidth;
  final Color borderColor;
  final Size? size;
  final bool shrink;

  const CustomIconButton(
      {super.key,
        required this.icon,
        this.radius,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.padding,
        this.fontSize,
        required this.onTap,
        this.bgColor = MyColor.buttonColor,
        this.elevation = 0,
        this.pressedColor = MyColor.appTheme,
        this.size,
        this.shrink = true,
        this.fgColor = MyColor.white});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: () => onTap(),
    clipBehavior: Clip.antiAlias,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(bgColor),
      foregroundColor: MaterialStateProperty.all(fgColor),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: MaterialStateProperty.all(BorderSide(
          color: borderColor, style: BorderStyle.solid, width: borderWidth)),
      elevation: MaterialStateProperty.all(elevation),
      padding: MaterialStateProperty.all(
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
      overlayColor: MaterialStateProperty.all(pressedColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30))),
      animationDuration: const Duration(milliseconds: 500),
      splashFactory: InkSplash.splashFactory,
      maximumSize: shrink
          ? null
          : MaterialStateProperty.all(size ??
          (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
      minimumSize: shrink
          ? null
          : MaterialStateProperty.all(size ??
          (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
      visualDensity: VisualDensity.standard,
      // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
      // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
    ),
    child: icon,
  );
}

class CustomAccessButton extends StatelessWidget {
  const CustomAccessButton({
    super.key,
    this.title,
    this.onPressed,
    this.height,
    this.elevation,
    this.borderRadius,
    this.color = MyColor.blackShade5,
    this.borderSide,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  })  : assert((hasIcon == true && icon != null) ||
      (hasIcon == false && icon == null));

  final VoidCallback? onPressed;
  final double? height;
  final double? elevation;
  final double? borderRadius;
  final String? title;
  final Color color;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) => MaterialButton(
    onPressed: onPressed,
    elevation: elevation ?? Sizes.ELEVATION_1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_24),
      side: borderSide ?? Borders.defaultPrimaryBorder,
    ),
    height: height ?? Sizes.HEIGHT_50,
    color: color,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        hasIcon ? icon! : Container(),
        hasIcon ? const SpaceW8() : Container(),
        title != null
            ? Text(
          title!,
          style: textStyle,
        )
            : Container(),
      ],
    ),
  );
}
