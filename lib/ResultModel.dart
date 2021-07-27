class ResultModel{
  static const tableName = "resultTable";
  static const colId = "id";
  static const colStatus = "status";
  static const colDate = "date";
  static const colNote = "note";
  static const resultName = "name";
  int id;
  int resultStatus;
  String date;
  String note;
  String name;
  ResultModel({this.id, this.name, this.resultStatus, this.date, this.note});

  ResultModel.fromMap(Map<String, dynamic> map){
  id = map[colId];
  resultStatus = map[colStatus];
  date = map[colDate];
  note = map[colNote];
  name = map[resultName];
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      resultName:name,
       colStatus:resultStatus,
      colDate:date,
      colNote:note,
    };
    if(id!=null) map[colId] = id;
    return map;
  }
}