import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/controller/db_controller/order_controller.dart';

import 'package:flutter_application_11/view/home_page/inkwellPages/Buy_foodt/edit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Orderpage extends StatelessWidget {
  Orderpage({super.key});

  int totalPrice = 0;
  int listlength = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BuyFoodController>(context, listen: false);

    provider.getAllFood();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer2<BuyFoodController, BuyFoodController>(
              builder: (context, provider, provider2, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    suffixIcon: const Icon(Icons.search),
                    label: const Text('Search'),
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    provider.searchOrder(value);
                    provider.orderSearch();
                    if (value.isEmpty) {
                      provider2.getAllFood();
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<BuyFoodController>(
              builder: (context, provider, child) {
                return provider.search.isNotEmpty
                    ? provider.foodList.isEmpty
                        ? Center(
                            child: Lottie.asset(
                              'assets/Animation - 1708580774808.json',
                              height: 300,
                            ),
                          )
                        : ListView.builder(
                            itemCount: provider.foodList.length,
                            itemBuilder: (ctx, index) {
                              final data = provider.foodList[index];
                              provider.getAllFood();
                              listlength = provider.foodList.length;

                              List<int?> price = [];

                              for (var element in provider.foodList) {
                                price.add(
                                  int.tryParse(element.price)!.toInt(),
                                );
                              }
                              totalPrice = price.reduce(
                                  (value, element) => value! + element!)!;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 113, 166, 210),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 125,
                                        width: 125,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.network(
                                            data.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              orderContainor(
                                                  text:
                                                      'Item: ${data.itemname}'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              orderContainor(
                                                  text: 'Price:${data.price}')
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              orderContainor(
                                                  text: 'Name: ${data.name}'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              orderContainor(
                                                  text:
                                                      'Number: ${data.number}'),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  provider.deleteBooking(index);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                ),
                                                color: Colors.red,
                                                hoverColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (ctx) {
                                                        return editpage(
                                                          image: data.image,
                                                          itemname:
                                                              data.itemname,
                                                          price: data.price,
                                                          index: index,
                                                          name: data.name,
                                                          number: data.number,
                                                        );
                                                      },
                                                    ),
                                                  );
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
                                ),
                              );
                            },
                          )
                    : provider.foodList.isEmpty
                        ? Center(
                            child: Lottie.asset(
                              'assets/Animation - 1707818608495.json',
                              height: 300,
                            ),
                          )
                        : Stack(
                            children: [
                              ListView.builder(
                                itemCount: provider.foodList.length,
                                itemBuilder: (context, index) {
                                  provider.getAllFood();
                                  listlength = provider.foodList.length;

                                  final data = provider.foodList[index];

                                  List<int?> price = [];

                                  for (var element in provider.foodList) {
                                    price.add(
                                      int.tryParse(element.price)!.toInt(),
                                    );
                                  }
                                  totalPrice = price.reduce(
                                      (value, element) => value! + element!)!;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 113, 166, 210),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 125,
                                            width: 125,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: Image.network(
                                                data.image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  orderContainor(
                                                      text:
                                                          'Item: ${data.itemname}'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  orderContainor(
                                                      text:
                                                          'Price:${data.price}')
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  orderContainor(
                                                      text:
                                                          'Name: ${data.name}'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  orderContainor(
                                                      text:
                                                          'Number: ${data.number}'),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      provider
                                                          .deleteBooking(index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                    ),
                                                    color: Colors.red,
                                                    hoverColor: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (ctx) {
                                                            return editpage(
                                                              image: data.image,
                                                              itemname:
                                                                  data.itemname,
                                                              price: data.price,
                                                              index: index,
                                                              name: data.name,
                                                              number:
                                                                  data.number,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    color: Colors.red,
                                                    hoverColor: Colors.white,
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 143, 241, 172),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 247, 152, 9),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Items: $listlength',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          'TotalPrice: $totalPrice',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class orderContainor extends StatelessWidget {
  final String text;

  const orderContainor({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
