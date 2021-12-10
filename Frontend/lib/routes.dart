import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/pages/home_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';

class RoutesEnum {
  static String HOME = "HOME";
  static String TODO = "TODO";
}

Map<String, Widget Function(BuildContext)> routesMap = {
  RoutesEnum.HOME: (BuildContext context) => HomePage(),
  RoutesEnum.TODO: (BuildContext context) => TodoPage(),
};
