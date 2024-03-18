import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:image_picker/image_picker.dart';

class NewAddFoodProvider extends ChangeNotifier {
  File? selectImg;
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

//  File? selectImg;
  String image = 'assets/photo_2024-02-08_23-26-31.jpg';

  String dropdownvalue = 'burger';
  var items = [
    'burger',
    'juice',
  ];

  Future<void> pickFromGelry({required ImageSource source}) async {
    final retuning = await ImagePicker().pickImage(source: source);
    if (retuning == null) {
      return;
    }

    selectImg = File(retuning.path);
    notifyListeners();
  }

  void dropDownChager(String selectedvalue) {
    dropdownvalue = selectedvalue;
    notifyListeners();
  }
}
