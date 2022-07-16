import 'package:flutter/material.dart';
import 'package:gpacalculate/logic/main_logic.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

Widget buildTextFormField(controller, hint, validator) {
  return SizedBox(
    height: 50,
    child: TextFormField(
      validator: validator,
      focusNode: FocusNode(),
      cursorColor: Colors.black,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        filled: true,
        fillColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.black12)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.black12)),
      ),
    ),
  );
}

class BuildSemester extends StatelessWidget {
  BuildSemester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Course",
                style: titleLargeStyle.copyWith(color: Colors.black),
              ),
              Text("Credits",
                  style: titleLargeStyle.copyWith(color: Colors.black)),
              Text("Grade",
                  style: titleLargeStyle.copyWith(color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 420,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    buildRowItems(
                      'Course ${index + 1}',
                      context.watch<MainLogic>().hourController[index],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 7),
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                          value: context
                              .watch<MainLogic>()
                              .dropGrades['drop${index + 1}'],
                          items: listTitle.map((t) {
                            return DropdownMenuItem<String>(
                              value: t,
                              child: Center(
                                  child: Text(
                                t,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black),
                              )),
                            );
                          }).toList(),
                          onChanged: (val) {
                            context
                                .read<MainLogic>()
                                .change(val ?? 'D', index);
                          }),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {
                context.read<MainLogic>().calculate();
              },
              child: const Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal,
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("Hours",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                        context
                            .watch<MainLogic>()
                            .gpaList[context.watch<MainLogic>().currentSemester]
                            .hours!
                            .toStringAsFixed(0),
                        style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)
                            .copyWith(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    const Text("GPA",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                     context.watch<MainLogic>().gpaList[context.watch<MainLogic>().currentSemester].gpa!
                          .toStringAsFixed(2),
                      style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Points",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                        context
                            .watch<MainLogic>()
                            .gpaList[context.watch<MainLogic>().currentSemester]
                            .points!
                            .toStringAsFixed(0),
                        style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)
                            .copyWith(color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowItems(
    title,
    controller,
  ) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: titleSmallStyle.copyWith(
              fontSize: 18, color: Colors.black87, fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          width: 50,
        ),
        SizedBox(
          width: 65,
          height: 30,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            keyboardType: TextInputType.number,
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(1),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}
