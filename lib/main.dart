import 'package:flutter/material.dart';

import 'package:flutter_application_11/controller/db_controller/add_controller.dart';
import 'package:flutter_application_11/controller/edit_new_food_controller.dart';
import 'package:flutter_application_11/controller/loging_controller.dart';
import 'package:flutter_application_11/controller/navigator_controller.dart';
import 'package:flutter_application_11/controller/new_add_food_controller.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:flutter_application_11/view/splash.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'controller/db_controller/order_controller.dart';


 const SAVE_KEY =' UserLgedIn';

void main()async {WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if (!Hive.isAdapterRegistered(BuyOrderModelAdapter().typeId))
  {
   Hive.registerAdapter(BuyOrderModelAdapter());
 }
 if (!Hive.isAdapterRegistered(NewFoodModelAdapter().typeId)) {
   Hive.registerAdapter(NewFoodModelAdapter());
 }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ 
      ChangeNotifierProvider(create: (context) => BuyFoodController(),),
      ChangeNotifierProvider(create: (context) => NewFoodProvider(),),
       ChangeNotifierProvider(create: (context) => NewAddFoodProvider(),),
       ChangeNotifierProvider(create: (context) => EditNewFoodProvider(),),
      ChangeNotifierProvider(create: (context) => NavigationProvider(),),
       ChangeNotifierProvider(create: (context) => LoginPageProvider(),),



       
    ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: splash() ),
    );
  }
}
