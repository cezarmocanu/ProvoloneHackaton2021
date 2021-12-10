import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/pages/instructor_dashboard_page.dart';
import 'package:vot_senat_client/pages/home_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';

class RoutesEnum {
  static String HOME = "Home";
  static String TODO = "Todo";
  static String DASHBOARD = "InstructorDashboard";
}

Map<String, Widget Function(BuildContext)> routesMap = {
  RoutesEnum.HOME: (BuildContext context) => HomePage(),
  RoutesEnum.TODO: (BuildContext context) => TodoPage(),
  RoutesEnum.DASHBOARD: (BuildContext context) => InstructorDashboardPage(),
};
