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

  // [
  // Sticker(
  // child: Image.network(
  // "https://images.unsplash.com/photo-1640113292801-785c4c678e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80"),
  // // must have unique id for every Sticker
  // id: "uniqueId_111",
  // ),
  // Sticker(
  // child: const Text("Hello"),
  // id: "uniqueId_222",
  // isText: true,
  // ),
  // ]

  @override
  Future<void> onInit() async {
    super.onInit();
    await selectImage();
  }

  Future<void> selectImage() async {
    image = await Utils.getImage(isCamera: true);
    // Utils.showToast(value: "Here is file ${image?.path}");
    if (image != null) {
      detectFaces();
      // addSticker(child: Image.file(File(image!.path),height: Sizes.HEIGHT_300,width: screenWidth,));
    }
    update();
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
        // Get the directory for downloads
        Directory? downloadsDirectory = await getDownloadsDirectory();

        if (downloadsDirectory != null) {
          String imagePath = '${downloadsDirectory.path}/$imageName.png';
          File imageFile = File(imagePath);
          imageFile.writeAsBytesSync(imageData);
          // ignore: avoid_print
          print("Image saved at: $imagePath");
          Utils.showToast(value: "이미지가 다운로드에 성공적으로 저장되었습니다.");
        } else {
          // If unable to get the downloads directory, fall back to the application documents directory
          var appDocDir = await getApplicationDocumentsDirectory();
          String imagePath = '${appDocDir.path}/$imageName.png';
          File imageFile = File(imagePath);
          imageFile.writeAsBytesSync(imageData);
          // ignore: avoid_print
          Utils.showToast(value: "이미지가 문서에 성공적으로 저장되었습니다.");
          print("Image saved at: $imagePath");
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
    await selectImage();
  }

  Future<void> detectFaces() async {
    final inputImage = InputImage.fromFilePath(File(image!.path).path);
    final faces = await faceDetector.processImage(inputImage);
    Debug.setLog("here is faces --> ${faces}");
    Utils.showToast(value: "얼굴을 찾을 수 없습니다");
    if(faces.length > 1){
      Utils.showToast(value: "두 얼굴 발견");
    }
  }

}
