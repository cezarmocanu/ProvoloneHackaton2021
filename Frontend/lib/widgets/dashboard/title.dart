import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;

  const TitleWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            titleText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
