import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_editor/Constants/Utils/utils.dart';
import 'package:image_editor/Constants/preferences.dart';
import 'package:image_editor/Routing/Routes.dart';
import 'package:image_editor/Services/connectivity_service.dart';
import 'package:image_editor/Services/http_service.dart';
import '../../Values/values.dart';
import '../constants.dart';
import 'package:dio/dio.dart' as d;

String? onPasswordValidation(String? val) {
  if (val != null && val.isEmpty) {
    return MyString.passwordValidation;
  } else {
    return null;
  }
}

Future<void> logout() async{
  // Get.offAllNamed(Routes.loginScreen);
  await Preferences.clearAllPrefs();
}

// static String? onPhoneNumberValidation(String? val) {
//   if (val != null && val.isEmpty) {
//     return MyString.phoneNumberValidation;
//   }else if (val != null && !GetUtils.isPhoneNumber(val)) {
//     return MyString.validPhoneNumberValidation;
//   } else {
//     return null;
//   }
// }

// static String? onConfirmPasswordValidation(String? val) {
//   if (val != null && val.isEmpty) {
//     return MyString.confirmPasswordValidation;
//   } else {
//     return null;
//   }
// }

String? onEmailValidation(String? val) {
  if (val != null && val.isEmpty) {
    return MyString.emailValidation;
  } else if (val != null && !GetUtils.isEmail(val)) {
    return MyString.validEmailValidation;
  } else {
    return null;
  }
}

// static String? onNameValidation(String? val) {
//   if (val != null && val.isEmpty) {
//     return MyString.nameValidation;
//   } else if (val != null && !GetUtils.isUsername(val)) {
//     return MyString.validNameValidation;
//   } else {
//     return null;
//   }
// }
Future<void> updateSocket() async {
// try {
// bool isLogIn = await Preferences.getPrefBool(isSignInPref);
//
// if (isLogIn) {
// String data = await Preferences.getPrefString(loginResponsePref);
// LogInResponseData logInResponseData =
// LogInResponseData.fromJson(jsonDecode(data));
// UpdateSocketData updateSocketData = UpdateSocketData(
// user_id: logInResponseData.user_id,
// source: GetPlatform.isAndroid ? "android" : "ios",
// device_token: FirebaseService.fcmToken ?? "",
// type: MyString.coach,
// team_id: logInResponseData.user_id,
// token_id: logInResponseData.token_id);
// Debug.setLog("here is UpdateSocketData --> ${jsonEncode(updateSocketData.toJson())}");
//
// SocketService.socket
//     .emit(AppUrls.updateSocket, jsonEncode(updateSocketData.toJson()));
// }
// } catch (e) {
// Debug.setLog("Network Error -> $e");
// }
}

// Future postMedia({
//   required String postUrl,
//   Object? rowData,
//   Function(dynamic responseData)? onSuccess,
//   Function(dynamic responseData)? onFailed,
//   required RxBool isLoading,
//   bool? isSuccessToast,
//   bool? isFailedToast,
//   XFile? fileData,
// }) async {
//   isSuccessToast ??= true;
//   isFailedToast ??= true;
//   if (ConnectivityService().isConnected) {
//     HttpService service = HttpService();
//     try {
//       isLoading.value = true;
//
//       List<MapEntry<String, d.MultipartFile>> files = [];
//       if (fileData != null && fileData.path.isNotEmpty) {
//         var data;
//         if(kIsWeb){
//           data = await service.getNetworkMultiPartFile(fileData.path);
//         }else{
//           data = await service.getMultiPartFile(fileData.path);
//         }
//         files.add(data);
//       }
//
//       var response = await service.postImagesRequest(url: postUrl, rowData: rowData,files: files);
//
//       if (Utils.checkResponse(statusCode: response.statusCode)) {
//         if (Utils.checkStatus(responseData: response.data)) {
//           if (onSuccess != null) {
//             onSuccess(response.data);
//           }
//           if (isSuccessToast) {
//             Utils.showToast(value: response.data["message"]);
//           }
//           isLoading.value = false;
//         } else {
//           Debug.setLog("Post onFailed --> $onFailed");
//           if (onFailed != null) {
//             onFailed(response.data);
//           }
//           if (isFailedToast) {
//             Utils.showToast(
//                 value: response.data["message"],
//                 backgroundColor: MyColor.redBg);
//           }
//           isLoading.value = false;
//         }
//       }
//     } catch (e) {
//       isLoading.value = false;
//       Debug.setLog("Network Error -> $e");
//     }
//   }
// }



Future postMethod({
  required String postUrl,
  Object? rowData,
  Function(dynamic responseData)? onSuccess,
  Function(dynamic responseData)? onFailed,
  required RxBool isLoading,
  bool? isSuccessToast,
  bool? isFailedToast,
}) async {
  isSuccessToast ??= true;
  isFailedToast ??= true;
  if (ConnectivityService().isConnected) {
    HttpService service = HttpService();
    try {
      isLoading.value = true;
      var response = await service.postRequest(url: postUrl, rowData: rowData);

      if (Utils.checkResponse(statusCode: response.statusCode)) {
        if (Utils.checkStatus(responseData: response.data)) {
          if (onSuccess != null) {
            onSuccess(response.data);
          }
          if (isSuccessToast) {
            Utils.showToast(value: response.data["message"],backgroundColor: MyColor.green);
          }
          isLoading.value = false;
        } else {
          Debug.setLog("Post onFailed --> $onFailed");
          if (onFailed != null) {
            onFailed(response.data);
          }
          if (isFailedToast) {
            Utils.showToast(
                value: response.data["message"],
                backgroundColor: MyColor.redBg,duration: 3);
          }
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      Debug.setLog("Network Error -> $e");
    }
  }
}

Future getMethod({
  required String getUrl,
  Function(dynamic responseData)? onSuccess,
  Function(dynamic responseData)? onFailed,
  required RxBool isLoading,
  Map<String, dynamic>? queryParameters,
  bool? isSuccessToast,
  bool? isFailedToast,
}) async {
  isSuccessToast ??= true;
  isFailedToast ??= true;
  if (ConnectivityService().isConnected) {
    HttpService service = HttpService();
    try {
      isLoading.value = true;
      var response = await service.getRequest(
          url: getUrl, queryParameters: queryParameters);

      if (Utils.checkResponse(statusCode: response.statusCode)) {
        if (Utils.checkStatus(responseData: response.data)) {
          if (onSuccess != null) {
            onSuccess(response.data);
          }
          if (isSuccessToast) {
            Utils.showToast(value: response.data["message"],backgroundColor: MyColor.completeStatus);
          }
          isLoading.value = false;
        } else {
          Debug.setLog("Post onFailed --> $onFailed");
          if (onFailed != null) {
            onFailed(response.data);
          }
          if (isFailedToast) {
            Utils.showToast(
                value: response.data["message"],
                backgroundColor: MyColor.redBg);
          }
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      Debug.setLog("Network Error -> $e");
    }
  }
}