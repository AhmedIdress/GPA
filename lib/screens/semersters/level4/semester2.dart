import 'package:flutter/material.dart';

import '../../../components/constants.dart';
class Semester42Screen extends StatelessWidget {
  const Semester42Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[2],
          style: appBarStyle),
      ),
      body: null,
    );
  }
}
