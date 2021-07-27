import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_test_quiz/DatabaseHelper.dart';
import 'package:mental_test_quiz/ResultModel.dart';

class Result extends StatefulWidget {
  static String name = "Results";
  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<Result> {
  ResultModel resultModel = ResultModel();
  List<ResultModel> models = [];
  DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _loadResults();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
        child: ListView.builder(
          itemCount: models.length,
            itemBuilder: (BuildContext context, int position){
               return getRow(position);
            }
        ),
    );

  }
  Widget getRow(int position){
    String note = models[position].note;
    int score = models[position].resultStatus;
    Color color = Colors.green;
    if(score<=40) color = Colors.green;
    else if(score>40 && score<=80) color = Colors.yellow;
    else color = Colors.red;
    if(note==""){
      note = "NULL";
    }
     return Container(
       alignment: Alignment.topLeft,
       width: double.infinity,
       child: Dismissible(
         background: Container(
           color: Colors.red,
           margin: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
         ),
         key: Key(position.toString()),
         onDismissed: (direction) async{
           int i = await _dbHelper.deleteResult(models[position].id);
           models.removeAt(position);
           Scaffold.of(context).showSnackBar(new SnackBar(content: Text("Result Deleted")));
         },
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
           Divider(thickness: 3,),
             Padding(
               padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                 child: Text("Name: ${models[position].name}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
             ),
             Padding(
               padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
              child: RichText(
                    text: TextSpan(
                      text: "Score: ",
                        style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "${models[position].resultStatus}%",
                          style: TextStyle(color: color, fontSize: 25.0, fontWeight: FontWeight.bold)
                        )
                      ]
                    ),

              ),
           //    child: Text("Score: ${models[position].resultStatus}%",style: TextStyle(fontSize: 25,),),
             ),
             Padding(
               padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
               child: Text("Date: ${models[position].date}",style: TextStyle(fontSize: 20,),),
             ),
             Padding(
               padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
               child: Text("Note: $note",style: TextStyle(fontSize: 20,),),
             ),
           Divider(thickness: 3,
           color: Colors.grey,)
           // Container(height: 20,
           // width: double.infinity,),
           ],
         ),
       ),
     );
  }

  _loadResults() async{
    List<ResultModel> x = await _dbHelper.fetchResults();
    setState(() {
      models = x;
    });
  }
}
