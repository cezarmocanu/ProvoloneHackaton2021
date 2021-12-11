import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vot_senat_client/widgets/common/navbar.dart';
import 'package:vot_senat_client/widgets/common/header.dart';

class InstructorDashboardPage extends StatelessWidget {
  List<String> exampleGroups = ["Algebra", "Stiinte", "Biologie", "Tamplarie"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
          children: <Widget>[
            NavbarWidget(),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  // color: Colors.black,
                  child: Column(
                    children: [
                      const HeaderWidget(titleText: "Region > Dashboard"),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const HeaderWidget(titleText: "First Container"),
                          Container(
                            color: Theme.of(context).colorScheme.primary,
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: exampleGroups.length,
                              itemBuilder: (context, index) {
                                return Text(exampleGroups[index]);
                              },
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const HeaderWidget(titleText: "First Container"),
                          SizedBox(
                            width: 600,
                            height: 600,
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(10, (index) {
                                return Center(
                                  child: Text(
                                    'Item $index',
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
