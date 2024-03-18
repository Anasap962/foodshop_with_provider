import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:hive_flutter/adapters.dart';

class BuyOrderService{
  Future addOrder(BuyOrderModel value)async{
    final orderDB=await Hive.openBox<BuyOrderModel>('order_db');
    return orderDB.add(value);
  }
  Future getAllOrders()async{
    final orderDB=await Hive.openBox<BuyOrderModel>('order_db');
    return orderDB.values.toList();

  }
  Future deleteOrder(int index)async{
    final orderDB=await Hive.openBox<BuyOrderModel>('order_db');
    await orderDB.deleteAt(index);
  }
  Future<void>editDetails(index,BuyOrderModel value)async{
    final orderDB=await Hive.openBox<BuyOrderModel>('order_db');
    await orderDB.putAt(index, value);
    }


}