import 'package:flutter/material.dart';
import 'package:gpacalculate/components/constants.dart';
import 'package:gpacalculate/logic/main_logic.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        title: Text(
          'Semesters',
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: context.watch<MainLogic>().gpaList.length,
          separatorBuilder: (context, index) => const SizedBox(),
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              context.read<MainLogic>().currentSemester = index;
              /*context.read<MainLogic>().getSemester(index);*/
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    context.read<MainLogic>().fillSemesterCourse();
                    return screens[index];
                  },
                ),
              );
            },
            child: Container(
              height: 150,
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title[index],
                    style: titleLargeStyle,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    subTitle[index],
                    style: subTitleStyle1,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Hours',
                            style: titleSmallStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            context
                                .watch<MainLogic>()
                                .gpaList[index]
                                .hours!
                                .toStringAsFixed(0),
                            style: subTitleStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'GPA',
                            style: titleSmallStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            (context.watch<MainLogic>().gpaList[index].gpa ??
                                    0.0)
                                .toStringAsFixed(0),
                            style: subTitleStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Points',
                            style: titleSmallStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            context
                                .watch<MainLogic>()
                                .gpaList[index]
                                .points!
                                .toStringAsFixed(0),
                            style: subTitleStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
