import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParagraphContainerWidget extends StatelessWidget {
  final String titleText;

  const ParagraphContainerWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            titleText,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
