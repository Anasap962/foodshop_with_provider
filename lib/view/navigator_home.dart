import 'package:flutter/material.dart';
import 'package:flutter_application_11/controller/navigator_controller.dart';
import 'package:provider/provider.dart';

class NavigatorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return provider.pages[provider.navIndex];
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.navIndex,
            onTap: (int newIndex) {
              provider.navigation(newIndex);
            },
            type: BottomNavigationBarType.fixed,
            iconSize: 32,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(Icons.shopping_cart_sharp),
              ),
              BottomNavigationBarItem(
                label: 'New Food',
                icon: Icon(Icons.fiber_new),
              ),
              BottomNavigationBarItem(
                label: 'Details',
                icon: Icon(Icons.settings),
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
          );
        },
      ),
    );
  }
}
