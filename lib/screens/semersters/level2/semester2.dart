import 'package:flutter/material.dart';
import 'package:gpacalculate/components/components.dart';
import '../../../components/constants.dart';
class Semester22Screen  extends StatelessWidget {
  const Semester22Screen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[2],
          style: appBarStyle),
      ),
      body: BuildSemester(),
    );
  }
}
