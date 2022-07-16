import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../components/constants.dart';
class Semester21Screen  extends StatelessWidget {
  const Semester21Screen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[1],
          style:appBarStyle),
      ),
      body:  BuildSemester(),
    );
  }
}
