import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_editor/Elements/Lib/sticker_view/stickerview.dart';
import '../../../Constants/Extensions/extensions.dart';
import '../../../Constants/constants.dart';
import '../../../Elements/Widgets/common_widgets.dart';
import '../../../Elements/Widgets/spaces.dart';
import '../../../Elements/Widgets/toast.dart';
import '../../../Routing/Routes.dart';
import '../../../Values/values.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _logic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Image Editor',
          style: TextStyles.appbarTitleStyle.copyWith(color: MyColor.white),
        ),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() => Column(
    children: [
      Expanded(child: stickerViewWidget()),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.WIDTH_20, vertical: Sizes.HEIGHT_20),
        child: Column(
          children: [
            bottomWidget(),
            const SpaceH20(),
            saveButtonWidget(),
          ],
        ),
      )
    ],
  );

  Widget stickerViewWidget() => GetBuilder<HomeController>(builder: (logic) {
        return StickerView(
          bgImage: _logic.image != null ? _logic.image!.path : null,
          stickerList: _logic.stickerList.value,
        );
      });

  Widget bottomWidget() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          textContainer(text: "← 다시찍기",onTap: _logic.onBackTap),
          const SpaceW20(),
          textContainer(text: "눈",onTap: _logic.onEyeTap),
          const SpaceW20(),
          textContainer(text: "입",onTap: _logic.onMouthTap),
        ],
      );

  Widget saveButtonWidget() => CommonWidgets.appButton(
      width: screenWidth, buttonText: "저장하기", onTap: _logic.onSaveTap);

  Widget textContainer({required String text,void Function()? onTap}) => GestureDetector(
    onTap: onTap,
    child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.WIDTH_14, vertical: Sizes.HEIGHT_10),
          decoration: Decorations.roundedBoxDecoration(
              borderRadius: Sizes.RADIUS_12, bgColor: MyColor.white),
          child: Text(
            text,
            style: TextStyles.titleTextStyle.copyWith(color: MyColor.black),
          ),
        ),
  );
}
