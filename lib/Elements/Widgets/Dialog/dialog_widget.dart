import 'package:flutter/material.dart';
import 'package:image_editor/Elements/Widgets/spaces.dart';
import 'package:image_editor/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? bottomColor;
  final Color? topColor;
  final String? topIcon;
  final Widget? titleWidget;
  final String? dialogTitle;
  final TextStyle? titleStyle;
  final Widget? bodyWidget;
  final Widget? fullDialogWidget;
  final String? dialogBody;
  final TextStyle? bodyStyle;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final double? borderRadius;
  final Widget? buttonWidget;
  final EdgeInsetsGeometry? dialogPadding;
  final void Function()? onPositiveClick;
  final void Function()? onNegativeClick;

  const DialogWidget({
    super.key,
    this.height,
    this.width,
    this.bottomColor,
    this.topColor,
    this.topIcon,
    this.titleWidget,
    this.titleStyle,
    this.dialogTitle,
    this.bodyWidget,
    this.bodyStyle,
    this.dialogBody,
    this.positiveButtonText,
    this.negativeButtonText,
    required this.onPositiveClick,
    required this.onNegativeClick,
    this.borderRadius,
    this.buttonWidget, this.fullDialogWidget, this.dialogPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dialogPadding ?? EdgeInsets.zero,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r)),
        child: _buildChild(context),
      ),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: height,
    // width: width ?? 350.h,
    decoration: Decorations.exitDialogBoxDecoration(
        color: bottomColor ?? MyColor.white,
        shape: BoxShape.rectangle,
        borderRadius:
        BorderRadius.all(Radius.circular(borderRadius ?? 60.r))),
    child: fullDialogWidget ?? Column(
      children: <Widget>[
        topIcon == null
            ? const SizedBox.shrink()
            : Container(
          width: double.infinity,
          decoration: Decorations.exitDialogBoxDecoration(
              color: topColor ?? Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              topIcon!,
              height: 120.h,
              width: 120.w,
            ),
          ),
        ),
        const SpaceH20(),
        titleWidget != null
            ? titleWidget!
            : dialogTitle != null
            ? Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.WIDTH_40,
              vertical: Sizes.HEIGHT_10),
          child: Text(
            dialogTitle!,
            textAlign: TextAlign.center,
            style: titleStyle ??
                const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
            : const SizedBox.shrink(),
        const SpaceH20(),
        bodyWidget != null
            ? bodyWidget!
            : dialogBody != null
            ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.WIDTH_20,
                vertical: Sizes.HEIGHT_10),
            child: Text(
              dialogBody!,
              style:
              bodyStyle ?? const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ))
            : const SizedBox.shrink(),
        buttonWidget ??
            Column(
              children: [
                const SpaceH24(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 100.w,
                      child: ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: onNegativeClick,
                        child: Text(
                          negativeButtonText ?? MyString.exit,
                          style: const TextStyle(color: MyColor.white),
                        ),
                      ),
                    ),
                    const SpaceW12(),
                    SizedBox(
                      width: 100.w,
                      child: ElevatedButton(
                        onPressed: onPositiveClick,
                        child: Text(
                          positiveButtonText ?? MyString.confirm,
                          style: const TextStyle(color: MyColor.white),
                        ),
                        // color: Colors.white, textColor: Colors.redAccent
                      ),
                    )
                  ],
                ),
              ],
            ),
        const SpaceH20(),
      ],
    ),
  );
}
