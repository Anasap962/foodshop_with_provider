import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/controller/db_controller/add_controller.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:flutter_application_11/view/home_page/inkwellPages/Buy_foodt/add_edit.dart';
import 'package:flutter_application_11/view/order.dart';
import 'package:provider/provider.dart';

class Newfood extends StatelessWidget {
  Newfood({super.key});

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<NewFoodProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'New Food',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Consumer<NewFoodProvider>(builder: (context, provider, child) {
                return TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'search', border: OutlineInputBorder()),
                  onChanged: (value) {
                    provider.searchFunction(value);
                    provider.searchListUpdated();
                    if (value.isEmpty) {
                      dataprovider.getAllNewFoods();
                    }
                  },
                );
              }),
              const SizedBox(height: 5),
              Expanded(
                child: Consumer<NewFoodProvider>(
                    builder: (context, provider, child) {
                  return provider.search.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (ctx, index) {
                            final data = provider.newfoodlist[index];
                            return buildListTile(data, index, context);
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider();
                          },
                          itemCount: provider.newfoodlist.length,
                        )
                      : ListView.separated(
                          itemBuilder: (ctx, index) {
                            final data = provider.newfoodlist[index];
                            return buildListTile(data, index, context);
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider();
                          },
                          itemCount: provider.newfoodlist.length);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildListTile(NewFoodModel data, index, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 113, 166, 210)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderContainor(text: 'Item: ${data.itemname}'),
                  const SizedBox(width: 10),
                  orderContainor(text: 'Price:${data.price}')
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 5),
              Row(
                children: [
                  Consumer<NewFoodProvider>(
                      builder: (context, provider, child) {
                    return IconButton(
                      onPressed: () {
                        provider.deleteNews(index);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      hoverColor: Colors.white,
                    );
                  }),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return add_edit(
                          image: data.image,
                          itemname: data.itemname,
                          price: data.price,
                          index: index,
                          cetogory: data.catagory,
                        );
                      }));
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.red,
                    hoverColor: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
