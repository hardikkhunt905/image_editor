import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Elements/Widgets/Dialog/custom_dialog.dart';
import '../Values/values.dart';

class ConnectivityService {
  factory ConnectivityService() => _instance;
  // Private constructor to make it a singleton
  ConnectivityService._();

  static final ConnectivityService _instance = ConnectivityService._();

  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true; // Assume initially connected

  void initialize() {
    // Listen to connectivity changes
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });

    // Check the initial connectivity state
    _checkInitialConnection();
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _isConnected = result != ConnectivityResult.none;
    if (!_isConnected) {
      _showNoInternetDialog();
    } else {
      _hideNoInternetDialog();
    }
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  Future<void> _showNoInternetDialog({void Function()? onPositiveClick}) async{
    await CustomDialog().showNoInternetDialog(
      positiveButtonText: MyString.tryAgain,
      negativeButtonText: MyString.cancel,
      onPositiveClick: () async  {
        if(_isConnected){
          Get.back();
          onPositiveClick;
        }else{
          Get.back();
          await _showNoInternetDialog(onPositiveClick: onPositiveClick);
        }
      },
      onNegativeClick: () {
        Navigator.of(Get.context!).pop();
      },
    );
  }


  void _hideNoInternetDialog() {
    // Implement logic to close or hide the "No Internet" dialog
    // For example, you may use Navigator to pop the dialog
    // Navigator.of(YourAppNavigatorKey.currentState.overlay.context).pop();
  }

  bool get isConnected => _isConnected;
}
