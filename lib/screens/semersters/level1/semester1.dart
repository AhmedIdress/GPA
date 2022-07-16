import 'package:flutter/material.dart';
import 'package:gpacalculate/components/components.dart';

import '../../../components/constants.dart';
class Semester11Screen extends StatefulWidget {
  const Semester11Screen({Key? key}) : super(key: key);

  @override
  State<Semester11Screen> createState() => _Semester11State();
}

class _Semester11State extends State<Semester11Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      appBar: AppBar(
        title: Text(titleScreens[1],style: appBarStyle),
      ),
      body:BuildSemester(),
    );
  }


}
