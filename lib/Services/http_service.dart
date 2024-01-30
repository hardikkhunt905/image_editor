import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/Constants/constants.dart';
import 'package:image_editor/Constants/Utils/app_urls.dart';
import 'package:image_editor/Constants/Utils/utils.dart';
import 'package:image_editor/Constants/preferences.dart';
import 'package:image_editor/Values/values.dart';
import 'package:get/get.dart' as getx;
import 'package:image_editor/Constants/Utils/methods.dart' as methods;


class HttpService {
  late Dio _dio;

  HttpService(){
    init();
  }

// http get request
  Future getRequest({required String url,Map<String, dynamic>? queryParameters}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers.addAll({"Accept" : "application/json"});
    String token = Preferences.getPrefString(tokenPref);
    token.isNotEmpty ? _dio.options.headers.addAll({'Authorization': 'Bearer $token'}) : null;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url " + url);
      Debug.setLog("queryParameters ${queryParameters}" );
      response = await _dio.get(url,queryParameters: queryParameters).catchError((e) => throw Exception(e));
      Debug.setLog("response.get ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  Future<Uint8List> getImageBytes(String imageUrl) async {
    Dio dio = Dio();

    try {
      Response<List<int>> response = await dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data!);
      } else {
        Utils.showToast(value: "Failed to load image");
        throw Exception('Failed to load image');
      }
    } catch (e) {
      Utils.showToast(value: "Exception: $e");
      throw Exception('Failed to load image');
    }
  }



  Future getMultiPartFile(String filePath) async{
    String fileName = filePath.split('/').last;
    MultipartFile data = await MultipartFile.fromFile(filePath,filename: fileName);
    MapEntry<String,MultipartFile> map = MapEntry("file", data);
    return map;
  }

  Future getNetworkMultiPartFile(String filePath) async{
    String fileName = filePath.split('/').last;
    Uint8List imageBytes = await getImageBytes(filePath);
    MultipartFile data = MultipartFile.fromBytes(imageBytes,filename: fileName);
    MapEntry<String,MultipartFile> map = MapEntry("file", data);
    return map;
  }

  Future postImagesRequest({required String url,rowData = const {},String? token,
    Map<String, dynamic>? queryParameters,List<MapEntry<String, MultipartFile>>? files,void Function(int, int)? onSendProgress
  }) async{
    _dio.options.headers['content-Type'] = 'application/json';
    String token = Preferences.getPrefString(tokenPref);
    token.isNotEmpty ? _dio.options.headers.addAll({'Authorization': 'Bearer $token'}) : null;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url ${url}" );
      FormData formData = FormData.fromMap(rowData);
      if(files!= null && files.isNotEmpty){
        files!= null && files.isNotEmpty ? formData.files.addAll(files ?? []) : null;
        Debug.setLog("image rowData ${formData.files.first}");
        Debug.setLog("image rowData ${formData.fields}");
      }
      response = await _dio.post(url,
          data: formData,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters).catchError((e) => throw Exception(e));
      Debug.setLog("response.post ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }
    return response;
  }

// http post request
  Future postRequest({required String url,rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers.addAll({"Accept" : "application/json"});
    String token = Preferences.getPrefString(tokenPref);
    token.isNotEmpty ? _dio.options.headers.addAll({'Authorization': 'Bearer $token'}) : null;

    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url ${url}");
      Debug.setLog("rowData ${rowData}");
      response = await _dio.post(url,data: rowData).catchError((e) => throw Exception(e));
      Debug.setLog("response.post ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }
// http post request
  Future uploadMediaRequest(String imagePath) async{
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagePath,),
    });

    _dio.options.headers['content-Type'] ="multipart/form-data";
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      // response = await _dio.post(AppUrls.upload_media_url,data: data);
      // Debug.setLog("response.uploadMedia ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    // return response;
  }
// http post request
  Future patchRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("rowData.patch ${jsonEncode(rowData)}" );
      Debug.setLog("url " + url);
      response = await _dio.patch(url,data: rowData);
      Debug.setLog("response.patch ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future putRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("rowData.put ${jsonEncode(rowData)}" );
      Debug.setLog("url " + url);
      response = await _dio.put(url,data: rowData);
      Debug.setLog("response.put ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http delete request
  Future deleteRequest(String url) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url " + url);
      response = await _dio.delete(url);
      Debug.setLog(response.toString());
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
      onError: (e, handler) async {
        Debug.setErrorLog("statusCode ${e.response?.statusCode.toString()}");
        Debug.setErrorLog("error ${e.response?.data.toString()}");
        switch (e.response?.statusCode) {
          case 400: //Bad Request
            String msg = e.response?.data['message'];
            Utils.showSnackBar(msg.isNotEmpty ? msg : MyString.somethingWrong);
            break;
          case 401: //UnAuthorized User

          // if (e.response?.statusCode == 401) {
          //   var options = e.response!.requestOptions;
          //
          //   _dio.lock();
          //   _dio.interceptors.responseLock.lock();
          //   _dio.interceptors.errorLock.lock();
          //
          //   Map<String, dynamic> refreshHeaders = {};
          //   try {
          //     showOverlayProgressBar(close: () async {
          //       String cred = await Utils.getPrefString(AppCredentials);
          //       if(cred.isNotEmpty) {
          //         var token = jsonDecode(cred)['refreshToken'];
          //         Debug.setLog("refreshTokenapi ${AppUrls.refresh_token_url(token)}");
          //         Dio dio = Dio();
          //         dio.options.headers['API-Version'] = AppUrls.api_version;
          //         var errVal = await dio.get(AppUrls.refresh_token_url(token)).onError((error, stackTrace) {
          //           Utils.showSnackBar(MyStrings.something_wrong);
          //           Utils.clearPrefsData();
          //           getx.Get.offAllNamed(Routes.login);
          //           return Future.value();
          //         });
          //         Debug.setLog("errVal ${errVal}");
          //           _dio.unlock();
          //           _dio.interceptors.responseLock.unlock();
          //           _dio.interceptors.errorLock.unlock();
          //           if(checkAPIResponse(errVal.statusCode)){
          //             print('options.headers ${options.headers}');
          //             if (options.headers['Authorization'] != null) {
          //               options.headers['Authorization'] = errVal.data['credentials']['accessToken'];
          //             }
          //             Debug.setLog("refresh_token_data ${errVal.data}");
          //             await Utils.setPrefString(AppCredentials, jsonEncode(errVal.data['credentials']));
          //             await Utils.setPrefString(AppUser, jsonEncode(errVal.data['user']));
          //
          //           } else {
          //             Utils.clearPrefsData();
          //             getx.Get.offAllNamed(Routes.login);
          //           }
          //           _dio.fetch(options).then(
          //             // (r) => handler.resolve(r),
          //                 (r) {
          //               handler.resolve(r);
          //             },
          //             onError: (e) {
          //               handler.reject(e);
          //             },
          //           );
          //       } else {
          //         Utils.clearPrefsData();
          //         getx.Get.offAllNamed(Routes.login);
          //       }
          //     });
          //   } catch (e) {
          //     Utils.clearPrefsData();
          //     getx.Get.offAllNamed(Routes.login);
          //   }
          //   return;
          // }

          // Do something with response error
          // return handler.next(e); //continue
          // // If you want to resolve the request with some custom data，
          // // you can resolve a `Response` object eg: return `dio.resolve(response)`.
            await methods.logout();
            break;
          case 404: // Not Found
            String msg = e.response?.data['message'];
            Utils.showSnackBar(msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;
          case 500: //Internal Server Error
            String msg = e.response?.data['message'];
            Utils.showSnackBar(msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;
          case 501: //Internal Server Error
            String msg = e.response?.data['message'];
            Utils.showSnackBar(msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;

          default:
            Utils.showSnackBar(MyString.somethingWrong);
            break;
        }
        handler.next(e);
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppUrls.baseUrl,
      followRedirects: false,
      connectTimeout: const Duration(seconds: 120), // 120 seconds
      receiveTimeout: const Duration(seconds: 120),
    ));
    initializeInterceptors();
  }
}