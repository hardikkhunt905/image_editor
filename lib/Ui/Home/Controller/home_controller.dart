import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_editor/Constants/Utils/app_urls.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../Constants/Utils/methods.dart' as methods;
import '../../../Constants/Utils/utils.dart';
import '../../../Constants/constants.dart';
import '../../../Elements/Lib/sticker_view/stickerview.dart';
import '../../../Routing/Routes.dart';
import '../../../Values/values.dart';


class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Sticker> stickerList = <Sticker>[].obs;
  XFile? image;
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector();


  @override
  Future<void> onInit() async {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 400),imageDialog);
    // await selectImage();
  }

  Future<void> imageDialog() async{
    Utils.selectImageDialog(
      onCancelTap: () => Get.back(),title: MyString.chooseMedia,
      onCameraTap: () async {
        Get.back();
        XFile? xFile = await Utils.getImage(isCamera: true);
        if(xFile != null){
          image = xFile;
          detectFaces();
        }
        update();
      },
      onGalleryTap: () async {
        Get.back();
        XFile? xFile = await Utils.getImage(isCamera: false);
        if(xFile != null){
          image = xFile;
          detectFaces();
        }
        update();
      },
    );
  }

  void addSticker({required Widget child,Size? sizes}) {
    var uuid = Uuid();
    String uniqueId = uuid.v4();

    stickerList.add(Sticker(
      sizes: sizes,
        id: uniqueId,
        child: child,
      ));
    update();
  }



  Future<void> onSaveTap() async{
    Uint8List? imageData =
        await StickerView.saveAsUint8List(ImageQuality.high);

    if (imageData != null) {
      var imageName = DateTime.now().microsecondsSinceEpoch.toString();
      try {
        // Directory? downloadsDirectory = (await getExternalStorageDirectories(type: StorageDirectory.downloads));
        Directory? downloadsDirectory;
        if (Platform.isIOS) {
          downloadsDirectory = await getDownloadsDirectory();
        } else {
          downloadsDirectory = Directory("/storage/emulated/0/Download");
        }

        if (downloadsDirectory != null) {
          String imagePath = '${downloadsDirectory.path}/$imageName.png';
         File(imagePath).writeAsBytesSync(imageData);
          // ignore: avoid_print
          Debug.setLog("Image saved at: $imagePath");
          Utils.showToast(value: "이미지가 다운로드에 성공적으로 저장되었습니다.");

        }else{
          Utils.showToast(value: "다운로드를 찾지 못했습니다");
        }
      } catch (e) {
        Debug.setLog("Somthing went wrong --> ${e}");
        Utils.showToast(value: "이미지를 저장할 수 없습니다",backgroundColor: MyColor.logoutColor);
      }
    }
  }


  void onEyeTap() {
    addSticker(sizes: Size(Sizes.HEIGHT_50,Sizes.HEIGHT_50),child: Container(
      decoration: Decorations.circleBoxDecoration(boxShape: BoxShape.circle,bgColor: MyColor.green.withOpacity(0.5)),
      ));
  }

  void onMouthTap() {
    addSticker(sizes: Size(Sizes.HEIGHT_80,Sizes.HEIGHT_80),child: Container(
      decoration: Decorations.circleBoxDecoration(boxShape: BoxShape.circle,bgColor: MyColor.green.withOpacity(0.5)),
      ));
  }

  Future<void> onBackTap() async{
    await imageDialog();
  }

  Future<void> detectFaces() async {
    final inputImage = InputImage.fromFilePath(File(image!.path).path);
    final faces = await faceDetector.processImage(inputImage);
    Debug.setLog("here is faces --> ${faces}");
    if(faces.isEmpty){
     Utils.showToast(value: "얼굴을 찾을 수 없습니다");
    }else{
      Utils.showToast(value: "얼굴 발견");
    }
    if(faces.length > 2){
      Utils.showToast(value: '다시찍기');
    }
  }

}
