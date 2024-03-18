import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:hive_flutter/adapters.dart';

class AddFoodService{
Future newAddedFood(NewFoodModel value)async{
final newaddedDB= await Hive.openBox<NewFoodModel>('newadded_db');
return newaddedDB.add(value);
}
Future getAllNewFood()async{
  final newaddedDB=await Hive.openBox<NewFoodModel>('newadded_db');
  return newaddedDB.values.toList();
}
Future deleteNew( int index)async{
  final newaddedDB=await Hive.openBox<NewFoodModel>('newadded_db');
  await newaddedDB.deleteAt(index);
}

Future editNewFood( index , NewFoodModel value)async{
  final newaddedDB=await Hive.openBox<NewFoodModel>('newadded_db');
  await newaddedDB.putAt(index, value);
}
}