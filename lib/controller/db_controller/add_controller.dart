import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:flutter_application_11/service/add.service.dart';
// import 'package:hive_flutter/adapters.dart';

class NewFoodProvider extends ChangeNotifier {
   String search = '';
   
  List <NewFoodModel> newfoodlist=[];

AddFoodService newSrevice=AddFoodService();
Future newAddedFoods( NewFoodModel value)async{
await newSrevice.newAddedFood(value);
}

Future getAllNewFoods ()async{
  newfoodlist=await newSrevice.getAllNewFood();
  notifyListeners();

}
Future <void> deleteNews( int index)async{
await newSrevice.deleteNew(index);
await getAllNewFoods();
}
Future <void> editNewFoods(int index ,NewFoodModel value)async{
newSrevice.editNewFood(index,value);
await getAllNewFoods();
}

  searchListUpdated(){
 newfoodlist =newfoodlist
          .where((NewFoodModel foodModel) =>
              foodModel.itemname.toLowerCase().contains(search.toLowerCase() )
               )
          .toList();
           notifyListeners();

  }


  void searchFunction(String value) {
    search = value;
    notifyListeners();
  }

   void filterJuiceItem() {
    
      if (newfoodlist.isEmpty) {
        return;
      }
      newfoodlist = newfoodlist
          .where((NewFoodModel foodModel) =>
              foodModel.catagory.toLowerCase() == 'juice')
          .toList();
          notifyListeners();
   
  }
      void filterBurgerItems() {
   
      if (newfoodlist.isEmpty) {
      
        return;
      }
      newfoodlist= newfoodlist
          .where((NewFoodModel foodModel) =>
              foodModel.catagory.toLowerCase() == 'burger')
          .toList();
    notifyListeners();
  }
  
}