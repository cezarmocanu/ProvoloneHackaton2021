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
      body: Container(
        color: const Color(0xff242936),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xff2C313F),
                child: Column(
                  children: [
                    const FittedBox(
                      child: FlutterLogo(),
                    ),
                    Text("Nume judet"),
                    const Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                    ButtonWidget(btnText: "btnText", btnRoute: RoutesEnum.TODO),
                    Container(
                      child: Text("Dashboard"),
                    ),
                    const Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: exampleGroups.length,
                        itemBuilder: (context, index) {
                          return Text(exampleGroups[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff242936),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100.0), bottomRight: Radius.circular(100.0)),
                ),
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
                          color: Colors.green,
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
          ],
        ),
      ),
    );
  }
}
