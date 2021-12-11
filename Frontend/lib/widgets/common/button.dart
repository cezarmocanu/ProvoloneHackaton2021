import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final String btnRoute;
  final bool isImportant;
  IconData? btnIcon;

  ButtonWidget.withIcon({Key? key, required this.btnText, required this.btnRoute, required this.btnIcon, required this.isImportant}) : super(key: key);

  ButtonWidget({Key? key, required this.btnText, required this.btnRoute, required this.isImportant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isImportant ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary;
    Color textColor = isImportant ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            btnRoute,
            (route) => false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (btnIcon != null) Icon(btnIcon),
              Text(
                btnText,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
