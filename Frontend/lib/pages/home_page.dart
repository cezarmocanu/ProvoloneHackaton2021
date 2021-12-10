import 'package:flutter/material.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Column(
        children: [
          //TODO create custom button with styling
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesEnum.TODO,
                (route) => false,
              );
            },
            child: Center(
              child: Text("Go to todo"),
            ),
          ),
        ],
      ),
    );
  }
}
