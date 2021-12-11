import 'package:flutter/material.dart';
import 'package:vot_senat_client/model/group.dart';
import 'package:vot_senat_client/widgets/student_button/student_button.dart';

class GroupWidget extends StatelessWidget {
  final Group group;

  const GroupWidget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text('GROUP 1'),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('STUDIED DISCIPLINES'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                child: Container(
                                  color: Colors.white,
                                  child: Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('SCIENCE'),
                                        Text('Coordinated by ' + 'Mark P.'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                child: Container(
                                  color: Colors.white,
                                  child: Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('MATHEMATICS'),
                                        Text('Coordinated by ' + 'Mark P.'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  color: Colors.white,
                                  child: Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('BIOLOGY'),
                                        Text('Coordinated by ' + 'Mark P.'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text('STUDENTS'),
                              Container(
                                color: Colors.white,
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                    StudentButton(
                                      studentName: 'Mihai',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
