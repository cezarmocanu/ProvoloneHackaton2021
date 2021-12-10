import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/pages/home_page.dart';
import 'package:vot_senat_client/pages/login_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';
import 'package:vot_senat_client/pages/register_page.dart';

class RoutesEnum {
  static String HOME = "HOME";
  static String TODO = "TODO";
  static String LOGIN = "LOGIN";
  static String REGISTER = "REGISTER";
}

Map<String, Widget Function(BuildContext)> routesMap = {
  RoutesEnum.HOME: (BuildContext context) => HomePage(),
  RoutesEnum.TODO: (BuildContext context) => TodoPage(),
  RoutesEnum.LOGIN: (BuildContext context) => LoginPage(),
  RoutesEnum.REGISTER: (BuildContext context) => RegisterPage(),
};
