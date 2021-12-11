import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vot_senat_client/widgets/common/button.dart';
import 'package:vot_senat_client/widgets/common/title.dart';

import '../routes.dart';

class InstructorDashboardPage extends StatelessWidget {
  List<String> exampleGroups = ["Algebra", "Stiinte", "Biologie", "Tamplarie"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
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
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Theme.of(context).colorScheme.background,
                // color: Colors.black,
                child: Column(
                  children: [
                    const TitleWidget(
                      titleText: "Judet apartenent > Dashboard",
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const TitleWidget(
                          titleText: "First Container",
                        ),
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
                        const TitleWidget(
                          titleText: "First Container",
                        ),
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
    );
  }
}
