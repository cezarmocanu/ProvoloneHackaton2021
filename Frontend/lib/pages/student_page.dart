import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vot_senat_client/widgets/common/container.dart';
import 'package:vot_senat_client/widgets/common/navbar.dart';
import 'package:vot_senat_client/widgets/common/header.dart';
import 'package:vot_senat_client/widgets/common/paragraph_container.dart';
import 'package:vot_senat_client/widgets/common/title_container.dart';

class StudentPage extends StatelessWidget {
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
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      const HeaderWidget(titleText: "Region > Student"),
                      ContainerWidget(
                        childWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            TitleContainerWidget(titleText: "LastName, FirstName"),
                            ParagraphContainerWidget(titleText: "Age: 21"),
                            ParagraphContainerWidget(titleText: "Birthdate: 11/10/1999"),
                            ParagraphContainerWidget(titleText: "Gender: M"),
                            ParagraphContainerWidget(titleText: "Institute: School name"),
                            TitleContainerWidget(titleText: "Performance"),
                          ],
                        ),
                      ),
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
