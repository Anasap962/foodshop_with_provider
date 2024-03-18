import 'dart:io';
import 'package:flutter_application_11/controller/db_controller/add_controller.dart';
import 'package:flutter_application_11/controller/new_add_food_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class addfood extends StatelessWidget {
  addfood({super.key});

  @override
  Widget build(BuildContext context) {
    final newAddFoodProvider =
        Provider.of<NewAddFoodProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Adding Food',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: newAddFoodProvider.formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                Consumer<NewAddFoodProvider>(
                    builder: (context, addprovider, child) {
                  return CircleAvatar(
                    backgroundImage: addprovider.selectImg != null
                        ? FileImage(addprovider.selectImg!)
                        : Image.asset(
                                'assets/juice-poster,-juice-bar,-juice-poster,-shake-design-template-13c879aac734313dabd0435264b83742_screen.jpg')
                            .image,
                    radius: 50,
                    foregroundColor: Colors.black,
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      Provider.of<NewAddFoodProvider>(context, listen: false)
                          .pickFromGelry(source: ImageSource.gallery);
                    },
                    child: const Text(
                      'Add image +',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: newAddFoodProvider.namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: const Text(
                        'Enter the name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      hintText: 'name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: newAddFoodProvider.pricecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        label: const Text(
                          'Enter the price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        hintText: 'price')),
                const SizedBox(
                  height: 1,
                ),
                Consumer<NewAddFoodProvider>(
                    builder: (context, dropProvider, child) {
                  return DropdownButton(
                    value: newAddFoodProvider.dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: newAddFoodProvider.items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      dropProvider.dropDownChager(newValue!);
                    },
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          border: Border(
                              bottom: BorderSide(style: BorderStyle.solid))),
                      height: 1,
                    ),
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                Consumer2<NewAddFoodProvider, NewAddFoodProvider>(
                    builder: (context, dropProvider, pro, child) {
                  return ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        if (newAddFoodProvider.formkey.currentState!
                            .validate()) {
                          onButtonClick(context);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        'You added new food',
                        style: TextStyle(color: Colors.white),
                      ));
                })
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void onButtonClick(BuildContext context) {
    final dataprovider1 =
        Provider.of<NewAddFoodProvider>(context, listen: false);
    final dataprovider2 = Provider.of<NewFoodProvider>(context, listen: false);
    final _name = dataprovider1.namecontroller.text.trim();
    final _price = dataprovider1.pricecontroller.text.trim();
    if (_name.isEmpty ||
        _price.isEmpty ||
        dataprovider1.dropdownvalue.isEmpty ||
        dataprovider1.selectImg == null) {
      return;
    }

    final _foodAded = NewFoodModel(
        image: dataprovider1.selectImg!.path,
        itemname: _name,
        price: _price,
        catagory: dataprovider1.dropdownvalue);
    dataprovider2.newAddedFoods(_foodAded);
  }
}
