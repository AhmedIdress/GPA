import 'package:flutter/material.dart';
import 'package:gpacalculate/components/components.dart';
import '../../../components/constants.dart';
class Semester31Screen  extends StatelessWidget {
  const Semester31Screen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[1],
          style: appBarStyle),
      ),
      body: BuildSemester(),
    );
  }
}
