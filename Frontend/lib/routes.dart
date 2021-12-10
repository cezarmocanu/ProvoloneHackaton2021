import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/pages/instructor_dashboard_page.dart';
import 'package:vot_senat_client/pages/home_page.dart';
import 'package:vot_senat_client/pages/login_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';
import 'package:vot_senat_client/pages/register_page.dart';

class RoutesEnum {
  static String HOME = "Home";
  static String TODO = "Todo";
  static String INSTRUCTOR_DASHBOARD = "InstructorDashboard";
  static String LOGIN = "Login";
  static String REGISTER = "Register";
}

Map<String, Widget Function(BuildContext)> routesMap = {
  RoutesEnum.HOME: (BuildContext context) => HomePage(),
  RoutesEnum.TODO: (BuildContext context) => TodoPage(),
  RoutesEnum.LOGIN: (BuildContext context) => LoginPage(),
  RoutesEnum.REGISTER: (BuildContext context) => RegisterPage(),
  RoutesEnum.INSTRUCTOR_DASHBOARD: (BuildContext context) => InstructorDashboardPage(),
};
