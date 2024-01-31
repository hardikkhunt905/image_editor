import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/Elements/Widgets/Dialog/custom_dialog.dart';
import 'package:image_editor/Elements/Widgets/custom_divider.dart';
import 'package:image_editor/Elements/Widgets/toast.dart';
import 'package:image_editor/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Elements/Widgets/common_widgets.dart';
import '../../Elements/Widgets/spaces.dart';

class Utils {
  Utils._();

  static late final bool isTablet;
  static ValueNotifier<Locale> appLocal = ValueNotifier(const Locale('en', ''));

  static showSnackBar(String value) {
    Get.showSnackbar(
      GetSnackBar(
        title: "",
        message: value.tr,
        isDismissible: true,
        padding: EdgeInsets.all(10.w),
        titleText: Container(),
        duration: Duration(seconds: 3),
      ),
    );
  }


  static void selectImageDialog(
      {
        String? title,
        void Function()? onCameraTap,
        void Function()? onGalleryTap,
        void Function()? onCancelTap}) async {
    CustomDialog().showCustomDialog(
      bottomColor: MyColor.white,
      dialogTitle: title ?? MyString.chooseImage,
      titleStyle: TextStyles.titleTextStyle
          .copyWith(color: MyColor.black, fontSize: Sizes.TEXT_SIZE_18),
      bodyWidget: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectImageItem(
                  iconPath: IconPath.cameraIcon,
                  title: MyString.camera,
                  onTap: onCameraTap,
                ),
                const SpaceW20(),
                selectImageItem(
                    iconPath: IconPath.galleryIcon,
                    title: MyString.gallery,
                    onTap: onGalleryTap),
              ],
            ),
          ),
          const SpaceH20(),
          CustomDivider(
            width: double.maxFinite,
            height: Sizes.HEIGHT_1,
            color: MyColor.appTheme,
          ),
          const SpaceH20(),
        ],
      ),
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onCancelTap,
              child: Text(MyString.cancel,
                  style: TextStyles.titleTextStyle3
                      .copyWith(fontSize: Sizes.TEXT_SIZE_18)))
        ],
      ),
    );
  }

  static Widget selectImageItem(
      {required String iconPath,
        required String title,
        void Function()? onTap}) => GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.mediaQuery.size.width / 3.5,
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_18),
        decoration: Decorations.roundedBoxDecoration(
            bgColor: MyColor.appTheme80, borderRadius:  Sizes.RADIUS_12),
        child: Column(
          children: [
            Image.asset(
              iconPath,
              width: Sizes.WIDTH_26,
              height: Sizes.WIDTH_26,
              color: MyColor.white,
            ),
            const SpaceH8(),
            Text(
              title,
              style: TextStyles.bodyText2
                  .copyWith(color: MyColor.white),
            )
          ],
        ),
      ),
    );


  static Future<bool> onWillPop() async {
    return warningDialog(
      positiveButtonText: MyString.yes,
      negativeButtonText: MyString.no,
      dialogTitle: MyString.exitDialogTitle,
      // dialogBody: MyString.exitDialogDetail,
      onNegativeClick: () => Navigator.of(Get.context!).pop(),
      onPositiveClick: () => SystemNavigator.pop(),
    );
  }

  static warningDialog(
      {String? dialogTitle,
        String? dialogBody,
        Widget? bodyWidget,
        String? negativeButtonText,
        String? positiveButtonText,
        Color? positiveButtonColor,
        Color? negativeButtonColor,
        bool isReverse = false,
        bool? barrierDismissible,
        double? buttonHeight,
        double? buttonRadius,
        bool? isSingleButton,
        TextStyle? titleStyle,
        TextStyle? bodyStyle,
        void Function()? onNegativeClick,
        void Function()? onPositiveClick}) {
    final textStyle =
    TextStyles.titleTextStyle3.copyWith(fontWeight: FontWeight.w700);
    return CustomDialog().showCustomDialog(
      barrierDismissible: barrierDismissible,
      bottomColor: MyColor.white,
      dialogBody: dialogBody,
      bodyWidget: bodyWidget,
      dialogTitle: dialogTitle,
      negativeButtonText: negativeButtonText ?? MyString.cancel,
      positiveButtonText: positiveButtonText ?? MyString.yes,
      titleStyle: titleStyle ?? textStyle,
      bodyStyle: bodyStyle ?? TextStyles.countTextStyle.copyWith(color: MyColor.textColor),
      onNegativeClick: onNegativeClick,
      onPositiveClick: onPositiveClick,
      buttonWidget: Column(
        children: [
          const SpaceH20(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.WIDTH_50, vertical: Sizes.HEIGHT_20),
            child: Row(
              mainAxisAlignment: isSingleButton ?? false
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonWidgets.appButton( buttonRadius: buttonRadius,
                      width: Get.mediaQuery.size.width / 2.8,
                      height: buttonHeight,
                      buttonText: negativeButtonText ?? MyString.cancel,
                      onTap: onNegativeClick ?? () => Get.back(),
                      // borderColor:
                      // isReverse ? MyColor.appTheme : MyColor.transparent,
                      bgColor:
                      isReverse ? MyColor.appThemeLight : MyColor.appTheme,
                      textColor: isReverse ? MyColor.textColor : MyColor.white),
                ),
                isSingleButton ?? false
                    ? const SizedBox.shrink()
                    : Expanded(
                  child: CommonWidgets.appButton(
                      width: Get.mediaQuery.size.width / 2.8,buttonRadius: buttonRadius,
                      height: buttonHeight,
                      buttonText: positiveButtonText ?? MyString.yes,
                      onTap: onPositiveClick,
                      // borderColor:
                      // isReverse ? MyColor.transparent : MyColor.appTheme,
                      bgColor: isReverse
                          ? MyColor.appTheme
                          : MyColor.appThemeLight,
                      textColor:
                      isReverse ? MyColor.white : MyColor.textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static showToast(
      {required String value,
        Color? backgroundColor,
        Color? textColor,
        int? duration,
        String? imagePath,
        double? backgroundRadius,
        Border? border,
        bool? rootNavigator}) {
    Toast.show(
      value,
      textAlign: TextAlign.center,
      backgroundColor: backgroundColor ?? MyColor.appTheme,
      duration: Toast.lengthShort,
      gravity: Toast.center,
      backgroundRadius: backgroundRadius ?? Sizes.RADIUS_12,
      border: border,
      rootNavigator: rootNavigator,
      textStyle: TextStyles.appbarTitleStyle
          .copyWith(color: textColor ?? MyColor.white),
    );
  }

  static showWarningToast(
      {required String value,
        Color? backgroundColor,
        Color? textColor,
        int? duration,
        String? imagePath,
        double? backgroundRadius,
        Border? border,
        bool? rootNavigator}) {
    Toast.show(
      value,
      backgroundColor: backgroundColor ?? MyColor.appTheme,
      duration: Toast.lengthShort,
      gravity: Toast.center,
      backgroundRadius: backgroundRadius ?? Sizes.RADIUS_12,
      border: border,
      rootNavigator: rootNavigator,
      textAlign: TextAlign.center,
      textStyle: TextStyles.hintTextStyle
          .copyWith(color: textColor ?? MyColor.white),
    );
  }

  static showBottomToast(
      {required String value,
        Color? backgroundColor,
        Color? textColor,
        int? duration,
        String? imagePath,
        double? backgroundRadius,
        Border? border,
        bool? rootNavigator}) {
    Toast.show(
      value,
      backgroundColor: backgroundColor ?? MyColor.appTheme,
      duration: Toast.lengthShort,
      gravity: Toast.bottom,
      backgroundRadius: backgroundRadius ?? Sizes.RADIUS_20,
      border: border,
      rootNavigator: rootNavigator,
      textAlign: TextAlign.center,
      textStyle: TextStyles.hintTextStyle
          .copyWith(color: textColor ?? MyColor.white),
    );
  }

  static Widget showLoader({Color? color})=> Center(
    child: CircularProgressIndicator(color: color ?? MyColor.appTheme),
  );

  static bool checkResponse({required int statusCode}) {
    if (statusCode == 200 || statusCode == 201) {
      return true;
    } else {
      showBottomToast(value: MyString.somethingWrong,);
      return false;
    }
  }

  static bool checkStatus({dynamic responseData}) {
    if (responseData[MyString.success] == true) {
      return true;
    } else {
      return false;
    }
  }

  static Future<XFile?> getImage({required bool isCamera}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        // imageQuality: isCamera ? 60 : 80
    );
    if (image != null) {
      return image;
    } else {
      Utils.showToast(value: MyString.imageError);
      return null;
    }

  }

}
