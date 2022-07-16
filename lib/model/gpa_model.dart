class GpaModel {
  int? id;
  double? hours, points, gpa;

  GpaModel.fromJson(Map map) {
    id = map['id'];
    hours = map['hours'];
    points = map['points'];
    gpa = map['gpa'];
  }

  GpaModel(this.id, this.hours, this.points, this.gpa);

  Map<String,dynamic> toJson()
  {
    return {
      'id':id,
      'hours':hours,
      'points':points,
      'gpa':gpa,
    };
  }
}
