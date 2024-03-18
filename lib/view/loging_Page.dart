import 'package:flutter/material.dart';
import 'package:flutter_application_11/controller/loging_controller.dart';

import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/view/navigator_home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logingProvider =
        Provider.of<LoginPageProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Form(
            key: logingProvider.formkey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Expanded(
                child: Card(
                  child: Container(
                    height: 400,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'value is empty';
                              } else {
                                return null;
                              }
                            },
                            controller: logingProvider.usenamecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              label: const Text(
                                'Enter your name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              hintText: 'username',
                              // helperText: 'name'
                            ),
                          ),
                        )
                        // ,const SizedBox(height: 5,),
                        ,
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'value is empty';
                              } else {
                                return null;
                              }
                            },
                            controller: logingProvider.passwordcontroller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              label: const Text(
                                'Enter your password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {
                              if (logingProvider.formkey.currentState!
                                  .validate()) {}
                              logingProvider.checkLogin(context);
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
