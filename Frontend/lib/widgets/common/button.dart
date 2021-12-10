import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final String btnRoute;
  IconData? btnIcon;

  ButtonWidget.withIcon({Key? key, required this.btnText, required this.btnRoute, required this.btnIcon}) : super(key: key);

  ButtonWidget({Key? key, required this.btnText, required this.btnRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          btnRoute,
          (route) => false,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: const Color(0xFFFF7272),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (btnIcon != null) Icon(btnIcon),
              Text(
                btnText,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
