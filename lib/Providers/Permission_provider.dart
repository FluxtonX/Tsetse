import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionProvider with ChangeNotifier {
  bool cameraGranted = false;
  bool notificationGranted = false;
  bool locationGranted = false;
  bool contactsGranted = false;
  bool isLoading = false;

  Future<void> requestcameraPermission() async {
    var status = await Permission.camera.request();

    cameraGranted = status.isGranted;
    notifyListeners();
  }

  Future<void> notificationRequest() async {
    var status = await Permission.notification.request();

    notificationGranted = status.isGranted;
    notifyListeners();
  }

  Future<void> requestLocation() async {
    final status = await Permission.location.request();
    locationGranted = status.isGranted;
    notifyListeners();
  }

  Future<void> requestContacts() async {
    final status = await Permission.contacts.request();
    if (status.isDenied) await Permission.contacts.request();
    if (status.isPermanentlyDenied) await openAppSettings();
    contactsGranted = status.isGranted;
    notifyListeners();
  }

  Future<void> allowAllPermissions() async {
    isLoading = true;
    notifyListeners();

    await requestcameraPermission();
    await notificationRequest();
    await requestLocation();
    await requestContacts();

    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();
  }

  bool get allGranted =>
      cameraGranted &&
      notificationGranted &&
      locationGranted &&
      contactsGranted;
}
