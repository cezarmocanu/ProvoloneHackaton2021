import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  Widget? childWidget;

  ContainerWidget({Key? key, this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.transparent),
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        // padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: childWidget,
        ),
      ),
    );
  }
}
