import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/service/order_service.dart';

class BuyFoodController extends ChangeNotifier {
  String search = '';

  List<BuyOrderModel> foodList = [];

  BuyOrderService buyOrderService = BuyOrderService();

  Future getAllFood() async {
    foodList = await buyOrderService.getAllOrders();
    notifyListeners();
  }

  Future addBooking(BuyOrderModel value) async {
    await buyOrderService.addOrder(value);
    getAllFood();
  }

  Future<void> deleteBooking(int index) async {
    await buyOrderService.deleteOrder(index);
    await getAllFood();
  }

  Future<void> editBooking(int index, BuyOrderModel value) async {
    await buyOrderService.editDetails(index, value);
    await getAllFood();
  }

  orderSearch() {
    foodList = foodList
        .where((BuyOrderModel foodList) =>
            foodList.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    notifyListeners();
  }

  searchOrder(value) {
    search = value;
    notifyListeners();
  }
}
