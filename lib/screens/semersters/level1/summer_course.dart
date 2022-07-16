import 'package:flutter/material.dart';
import 'package:gpacalculate/components/components.dart';

import '../../../components/constants.dart';
class SummerCourse1Screen extends StatelessWidget {
  const SummerCourse1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[3],
          style: appBarStyle),
      ),
      body: BuildSemester(),
    );
  }
}
