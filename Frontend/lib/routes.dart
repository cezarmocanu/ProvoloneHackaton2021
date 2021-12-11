import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/pages/instructor_dashboard_page.dart';
import 'package:vot_senat_client/pages/home_page.dart';
import 'package:vot_senat_client/pages/login_page.dart';
import 'package:vot_senat_client/pages/splash_page.dart';
import 'package:vot_senat_client/pages/student_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';
import 'package:vot_senat_client/pages/groups_page.dart';
import 'package:vot_senat_client/pages/register_page.dart';

class RoutesEnum {
  static String SPLASH = "splash";
  static String HOME = "home";
  static String TODO = "todo";
  static String LOGIN = "login";
  static String INSTRUCTOR_DASHBOARD = "InstructorDashboard";
  static String GROUPS = "Groups";
  static String STUDENT_PAGE = "StudentPage";
  static String LOGIN = "Login";
  static String REGISTER = "Register";
}

Map<String, Widget Function(BuildContext)> routesMap = {
  RoutesEnum.SPLASH: (BuildContext context) => SpashPage(),
  RoutesEnum.HOME: (BuildContext context) => HomePage(),
  RoutesEnum.TODO: (BuildContext context) => TodoPage(),
  RoutesEnum.LOGIN: (BuildContext context) => LoginPage(),
  RoutesEnum.GROUPS: (BuildContext context) => GroupsPage(),
  RoutesEnum.REGISTER: (BuildContext context) => RegisterPage(),
  RoutesEnum.INSTRUCTOR_DASHBOARD: (BuildContext context) => InstructorDashboardPage(),
  RoutesEnum.STUDENT_PAGE: (BuildContext context) => StudentPage(),
};
