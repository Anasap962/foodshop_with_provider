

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:image_picker/image_picker.dart';

class EditNewFoodProvider extends ChangeNotifier {
  File? selectImage;
 final TextEditingController itemnamecontroller=TextEditingController();
  final TextEditingController pricecontroller = TextEditingController(); 
 
 final  formkey=GlobalKey<FormState>();

 


   Future<void> picImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
      selectImage = File(returnImage.path);
  }

  Future<void> picImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
      selectImage = File(returnImage.path);
      notifyListeners();
  }
  
}