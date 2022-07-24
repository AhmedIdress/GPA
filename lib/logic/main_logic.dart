import 'package:flutter/material.dart';
import 'package:gpacalculate/components/constants.dart';
import 'package:gpacalculate/data/data_helper.dart';
import 'package:gpacalculate/model/gpa_model.dart';
import 'package:gpacalculate/model/semester_item_model.dart';

class MainLogic extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  int currentSemester = 0;
  int id = 0;
  double gpa = 0.0;
  double hours = 000;
  double points = 000;
  List<GpaModel> _gpaList = [];
  List<GpaModel> get gpaList => _gpaList;
  List<SemesterItemModel> get semesters => _semesters;
  List<SemesterItemModel> _semesters = [];
  GpaModel? _getOneGpa;
  GpaModel? get getOneGpa => _getOneGpa;
  MainLogic() {
    getAllRows();
  }
  void changeGPA(id, double hour, double point) {
    this.id = id;
    gpa = point / hour;
    points = point;
    hours = hour;
    update();
    notifyListeners();
  }

  void update() {
    _databaseHelper
        .updateDatabase(
      GpaModel(id, hours, points, gpa),
    )
        .then((value) {
      getAllRows();
    });
    notifyListeners();
  }

  void getRow() {
    GpaModel? gpaModel;
    _databaseHelper.getDatabaseRow(id).then((value) {
      if (value == null) {
        gpaModel = null;
        return;
      } else {
        gpaModel = GpaModel.fromJson(value);
      }
    });
    _getOneGpa = gpaModel;
    notifyListeners();
  }

  void getAllRows() async {
    List<Map<String, dynamic>> allGpa =
        await _databaseHelper.getAllDatabaseRows();
    //print('get rows in main logic');
    _gpaList = allGpa.map((e) => GpaModel.fromJson(e)).toList();
    //print(allGpa);
    notifyListeners();
  }

  ////semester part

  final Map<String, String> _dropGrades = {
    'drop1': 'Value',
    'drop2': 'Value',
    'drop3': 'Value',
    'drop4': 'Value',
    'drop5': 'Value',
    'drop6': 'Value',
    'drop7': 'Value',
    'drop8': 'Value',
    'drop9': 'Value',
  };
  Map<String, String> get dropGrades => _dropGrades;
  List<TextEditingController> _hourController = List.generate(
    9,
    (index) => TextEditingController(),
  );
  List<TextEditingController> get hourController => _hourController;

  void calculate() async {
    int counter = 0;
    id = currentSemester;
    points = 0;
    gpa = 0;
    hours = 0;
    _semesters = [];
    hourController.forEach((e) {
      double hour = double.parse(e.text==''?'0.0':e.text);
      hours += hour;
      String? gradeString = dropGrades['drop${counter + 1}'];
      double grade = listTitleGrade[gradeString] ?? 0;
      points += (grade * hour);
      _semesters.add(
        SemesterItemModel(counter, hour, gradeString, currentSemester),
      );
      counter++;
    });
    if(hours!=0){
      gpa = points / hours;
    }
    insertSemester();
    update();
    notifyListeners();
  }

  void change(String value, int index) {
    _dropGrades['drop${index + 1}'] = value;
    notifyListeners();
  }

  //////////////////////semester data

  Future<void> getSemester(int gpaId) async {
    _semesters = [];
    var semi = await _databaseHelper.getSemester(gpaId);
    for (var element in semi) {
      _semesters.add(
        SemesterItemModel.fromJson(element),
      );
      print(
        '${element['id']},${element['credit']},${element['grade']},${element['gpaId']}',
      );
    }
    /*semesters.forEach((element) {
       print(
        '${element.id},${element.credit},${element.grade},${element.gpaId}',
      );
    });*/
    notifyListeners();
  }

  void insertSemester() {
    semesters.forEach((e) async {
      await _databaseHelper.insertSemester(e);
    });
    getSemester(currentSemester);
    print(semesters.length);
    semesters.forEach((element) {
      print(
        '${element.id},${element.credit},${element.grade},${element.gpaId}',
      );
    });
    notifyListeners();
  }

  /*void updateSemester() {
    var semiList = semesters;
    semiList.forEach((element) {
      _databaseHelper
          .updateSemester(
        SemesterItemModel(
          element.id,
          element.credit,
          element.grade,
          element.gpaId,
        ),
      )
          .then((value) {
        getSemester(currentSemester);
      });
    });
    notifyListeners();
  }*/
  void fillSemesterCourse() {
    getSemester(currentSemester).then((value) {
      print(semesters.length);
      for (var element in semesters) {
        print(
          '${element.id},${element.credit},${element.grade},${element.gpaId}',
        );
      }
      if (semesters.isEmpty) {
        _hourController = List.generate(
          9,
              (index) => TextEditingController(),
        );
        for (int i = 0; i < hourController.length; i++) {
          _dropGrades['drop${i + 1}'] = 'Value';
        }
      }
      else
      {
        print('object');
        for (int i = 0; i < hourController.length; i++) {
          _hourController[i].text = semesters[i].credit.toString();
          _dropGrades['drop${i + 1}'] = semesters[i].grade.toString();
        }
      }
    });

  }
}
