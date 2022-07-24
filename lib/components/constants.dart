import 'package:flutter/material.dart';
import 'package:gpacalculate/screens/drawer/add_semester.dart';
import 'package:gpacalculate/screens/drawer/all_courses.dart';
import 'package:gpacalculate/screens/main_screen.dart';
import 'package:gpacalculate/screens/drawer/gpa_calculator.dart';

import '../screens/semersters/GPa.dart';
import '../screens/semersters/level1/semester1.dart';
import '../screens/semersters/level1/semester2.dart';
import '../screens/semersters/level1/summer_course.dart';
import '../screens/semersters/level2/semester1.dart';
import '../screens/semersters/level2/semester2.dart';
import '../screens/semersters/level2/summer_course.dart';
import '../screens/semersters/level3/semester1.dart';
import '../screens/semersters/level3/semester2.dart';
import '../screens/semersters/level3/summer_course.dart';
import '../screens/semersters/level4/semester1.dart';
import '../screens/semersters/level4/semester2.dart';
import '../screens/semersters/level4/summer_course.dart';

Color primaryColor = Color(
  int.parse(
    'FF009788',
    radix: 16,
  ),
);
TextStyle titleSmallStyle = const TextStyle(
    fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle subTitleStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle titleLargeStyle = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontStyle: FontStyle.italic);
TextStyle subTitleStyle1 = const TextStyle(
    fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w500);
TextStyle appBarStyle = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Colors.white);

List title = [
  'GPA',
  'Level 1',
  'Level 1',
  'Level 1',
  'Level 2',
  'Level 2',
  'Level 2',
  'Level 3',
  'Level 3',
  'Level 3',
  'Level 4',
  'Level 4',
  'Level 4',
];
List level = [
  'Level 1',
  'Level 2',
  'Level 3',
  'Level 4',
];
List subTitle = [
  '',
  'semester 1',
  'semester 2',
  'summer course',
  'semester 1',
  'semester 2',
  'summer course',
  'semester 1',
  'semester 2',
  'summer course',
  'semester 1',
  'semester 2',
  'summer course',
];
List semester = [
  'semester 1',
  'semester 2',
  'summer course',
];
List titleScreens = [
  'GPA',
  'Semester 1',
  'Semester 2 ',
  'Summer Course',
];
List drawerTitle = [
  'GPA history',
  'Add semester',
  'All courses',
  'GPA calculator',
];
List<Widget> screens = [
  GPAScreen(),
  const Semester11Screen(),
  const Semester12Screen(),
  const SummerCourse1Screen(),
  const Semester21Screen(),
  const Semester22Screen(),
  const SummerCourse2Screen(),
  const Semester31Screen(),
  const Semester32Screen(),
  const SummerCourse3Screen(),
  const Semester41Screen(),
  const Semester42Screen(),
  const SummerCourse4Screen(),
];
List<Widget> drawerWidgets = const [
  MainScreen(),
  AddSemester(),
  AllCourses(),
  GpaCalculator(),
];
List<String> listTitle = [
  'Value',
  'A+',
  'A',
  'A-',
  'B+',
  'B',
  'B-',
  'C+',
  'C',
  'C-',
  'D+',
  'D',
  'F',
];
Map<String,double> listTitleGrade =
{
  'A+': 4.0,
  'A':4.0,
  'A-':3.7,
  'B+':3.3,
  'B':3.0,
  'B-':2.7,
  'C+':2.3,
  'C':2.0,
  'C-':1.7,
  'D+':1.3,
  'D':1.0,
  'F':0.0,
  'Value':0.0,
};
