import 'dart:io';

import 'package:flutter_application_11/controller/db_controller/add_controller.dart';
import 'package:flutter_application_11/controller/edit_new_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class add_edit extends StatefulWidget {
  final int index;
  final String image;
  final String itemname;
  final String price;
  final String cetogory;

  add_edit(
      {super.key,
      required this.index,
      required this.image,
      required this.itemname,
      required this.price,
      required this.cetogory});

  @override
  State<add_edit> createState() => _add_editState();
}

class _add_editState extends State<add_edit> {
  @override
  void initState() {
    final editPageProvider =
        Provider.of<EditNewFoodProvider>(context, listen: false);

    editPageProvider.itemnamecontroller.text = widget.itemname;
    editPageProvider.pricecontroller.text = widget.price;

    editPageProvider.selectImage =
        widget.image != '' ? File(widget.image) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editPageProvider =
        Provider.of<EditNewFoodProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Added food edit ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Form(
          key: editPageProvider.formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.image),
                  radius: 60,
                ),
                TextButton.icon(
                  onPressed: () {
                    editPageProvider.picImageFromGallery();
                  },
                  icon: Icon(Icons.image),
                  label: Text("GALLERY"),
                ),
                TextButton.icon(
                  onPressed: () {
                    editPageProvider.picImageFromCamera();
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text("CAMERA"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Invalid';
                    } else {
                      return null;
                    }
                  },
                  controller: editPageProvider.itemnamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text('Item name'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid';
                    } else {
                      return null;
                    }
                  },
                  controller: editPageProvider.pricecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text('Price'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (editPageProvider.formkey.currentState!.validate()) {
                        editNewPage(
                            widget.index, widget.image, widget.cetogory);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'DONE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editNewPage(int index, String image, String category) {
    final dataprovider =
        Provider.of<EditNewFoodProvider>(context, listen: false);
    final dataprovider2 = Provider.of<NewFoodProvider>(context, listen: false);

    final edits = NewFoodModel(
        image: image,
        itemname: dataprovider.itemnamecontroller.text,
        price: dataprovider.pricecontroller.text,
        catagory: category);
    dataprovider2.editNewFoods(index, edits);
  }
}
