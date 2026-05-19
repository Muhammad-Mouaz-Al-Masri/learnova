import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupState extends ChangeNotifier {
  var cropController = CropController();
  bool startCropping = false;
  bool startPicking = false;
  Uint8List? ChoosenImage;

  Future<Uint8List?> chooseProfilePhoto() async {
    if (startPicking == true) {
      var picker = ImagePicker();
      var picked = await picker.pickImage(source: ImageSource.gallery);
      Uint8List bytes = await picked!.readAsBytes();
      return bytes;
    }
    notifyListeners();
  }

  void cancelCrop() {
    startCropping = false;
    startPicking = false;
    notifyListeners();
  }

  void confirmCrop() {
    cropController.crop();
    startCropping = false;
    startPicking = false;
    notifyListeners();
  }

  void startChoosing() async {
    startPicking = true;
    ChoosenImage = await chooseProfilePhoto();
    if (ChoosenImage != null) {
      startCropping = true;
    }
    notifyListeners();
  }
}
