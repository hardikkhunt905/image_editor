import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constants/constants.dart';

class PermissionService {
  factory PermissionService() => _instance;
  // Private constructor to make it a singleton
  PermissionService._();
  static final PermissionService _instance = PermissionService._();

  Future<bool> requestFilePickerPermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.storage.request();
      Debug.setLog("here is else status --> ${status}");

      if (result.isGranted) {
        return true;
      } else if (result.isDenied) {
        // Permission has been denied
        _showPermissionDeniedDialog();
        return false;
      } else if (result.isPermanentlyDenied) {
        // Permission is permanently denied
        _showPermanentlyDeniedDialog();
        return false;
      } else {
        // Permission is denied for some other reason
        return false;
      }
    }
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.camera.request();

      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.location.request();

      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  void _showPermissionDeniedDialog() {
    // Show a dialog informing the user that the permission has been denied
    // You can customize this dialog based on your app's requirements
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Permission Denied'),
          content: Text('This feature requires permission, but it has been denied.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPermanentlyDeniedDialog() {
    // Show a dialog informing the user that the permission is permanently denied
    // You can customize this dialog based on your app's requirements
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Permission Permanently Denied'),
          content: Text('This feature requires permission, but it has been permanently denied. '
              'Please go to app settings and grant the necessary permission.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

}