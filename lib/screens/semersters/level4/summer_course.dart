import 'package:flutter/material.dart';
import 'package:gpacalculate/components/components.dart';

import '../../../components/constants.dart';
class SummerCourse4Screen extends StatelessWidget {
  const SummerCourse4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[3],
          style:appBarStyle),
      ),
      body: BuildSemester(),
    );
  }
}
