class SemesterItemModel{
  int? id;
  double? credit;
  String? grade;
  int? gpaId;

  SemesterItemModel(this.id, this.credit, this.grade,this.gpaId);

  SemesterItemModel.fromJson(Map map){
    id = map['id'];
    credit = map['credit'];
    grade = map['grade'];
    gpaId = map['gpaId'];
  }

 toJson(){
    return{
    'id':id,
    'credit':credit,
    'grade':grade,
    'gpaId':gpaId,
  };
  }
}