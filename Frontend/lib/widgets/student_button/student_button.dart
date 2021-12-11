import 'package:flutter/material.dart';

class StudentButton extends StatelessWidget {
  final String studentName;

  const StudentButton({
    Key? key,
    this.studentName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.supervised_user_circle),
                ),
              ),
            ),
            Text(studentName),
          ],
        ),
      ),
    );
  }
}
