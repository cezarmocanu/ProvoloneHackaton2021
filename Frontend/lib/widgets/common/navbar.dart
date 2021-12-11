import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'button.dart';

class NavbarWidget extends StatelessWidget {
  List<String> exampleGroups = ["Algebra", "Stiinte", "Biologie", "Tamplarie"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const FittedBox(
            child: FlutterLogo(),
          ),
          const Text("Nume judet"),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          ButtonWidget(
            btnText: "Dashboard",
            btnRoute: RoutesEnum.INSTRUCTOR_DASHBOARD,
            isImportant: true,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exampleGroups.length,
              itemBuilder: (context, index) {
                return ButtonWidget(
                  btnText: exampleGroups[index],
                  btnRoute: RoutesEnum.INSTRUCTOR_DASHBOARD,
                  isImportant: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
