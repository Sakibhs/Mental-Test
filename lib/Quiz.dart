import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_test_quiz/GetQuesAndAns.dart';
import 'package:intl/intl.dart';
import 'DatabaseHelper.dart';
import 'ResultModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class Disclaimer extends StatelessWidget {
  final String mentalTestName;
  Disclaimer({Key key, this.mentalTestName});
  @override
  Widget build(BuildContext context) {
    final text = 'This quiz is for adults only. By clicking the "Agree" button you ensuring that you are 18 years or older. Also, you have to agree that this application is for information purposes. It is not intended to replace a consultation with your doctor or mental health professional. Please consult a qualified resource if you believe you may be suffering from a mental health condition. You are encouraged to share your result with a doctor or mental health professional.';
   // final paragraph2 = 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
  //  final text = paragraph1 + '\n\n' + paragraph2;
  //  final text2 = "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?"
  //      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Disclaimer"),
      ),
      body:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ Colors.teal, Colors.cyan]),
          ),
          child: Center(
    child: CustomScrollView(
    slivers: [
    SliverFillRemaining(
    hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "I Agree",
                          style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      onPressed: () {
                        var route = MaterialPageRoute(
                        builder: (BuildContext context) => GetQuesAndAns(mentalTestName: mentalTestName,),
                      );
                      Navigator.of(context).push(route);
                      },

                    ),
                  ),
                ],
              ),
    )
          ]),
        ),
    )
    );
  }
}


class Quiz extends StatefulWidget {
  var quesAndAns;
  int totalQues, totalPoints;
  bool isSameAnswerSet;
  int totalAnswerOptions;
  Quiz({Key key, this.quesAndAns, this.totalQues, this.totalPoints, this.isSameAnswerSet, this.totalAnswerOptions}) : super(key : key);
  @override
  _QuizState createState() => _QuizState(quesAndAns: quesAndAns, totalQues: totalQues, totalPoints: totalPoints, isSameAnswerSet: isSameAnswerSet, totalAnswerOptions: totalAnswerOptions);
}

class _QuizState extends State<Quiz> {
  int result = 0;
  int i = 1;
  int radioButtonValue = 0;
  var quesAndAns;
  int totalQues, totalPoints;
  int indexOfQuestion = 1;
  bool isSameAnswerSet;
  int totalAnswerOptions;
  int selectedRadioButton;
  bool isOptionSelected = false;
  bool isScrolled = false;
  static final String fanPlacementId = "887501115130924_887506248463744";
  static final String fanPlacementId2 = "887501115130924_894486127765756";

  @override
  void initState() {
       selectedRadioButton = -1;
       FacebookAudienceNetwork.init(
        // testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
       );
       super.initState();
  }

  _QuizState({this.quesAndAns, this.totalQues, this.totalPoints, this.isSameAnswerSet, this.totalAnswerOptions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  extendBodyBehindAppBar: true,
      //extendBody: false,
      appBar: AppBar(title: Text(quesAndAns[4]["Name"], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal)),
   //   backgroundColor: Colors.transparent,
      //  elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Colors.teal, Colors.cyan]),
        ),
     child: CustomScrollView(
      slivers: [
      SliverFillRemaining(
      hasScrollBody: false,
            child: Column(
          //    mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //  flex: 1,
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    alignment: Alignment.bottomLeft,
                    child: Text("Question: $indexOfQuestion of $totalQues",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),),
                  ),
                  //flex: 1,
                 Container(
                    padding: EdgeInsets.fromLTRB(10.0,10.0, 10.0, 10.0),
                    alignment: Alignment.topCenter,
                    child: Text(quesAndAns[0][i.toString()],
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0,5.0, 10.0, 15.0),
                    alignment: Alignment.bottomCenter,
                    child: getRadioButtons()
                  ),
                 Container(
                  decoration: BoxDecoration(),
                  child:Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: RaisedButton(
                      elevation: 0.0,
                      color: isOptionSelected? Colors.pinkAccent:Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200.0),
                          side: BorderSide(
                              color: isOptionSelected?Colors.pinkAccent:Colors.white,
                              width:isOptionSelected? 0.0:5.0,
                              style: BorderStyle.solid
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        child: Text(
                            "Next Question",
                          style: TextStyle(fontSize: 20, color: Colors.white),),
                      ),
                      onPressed: (){
                      //  result += radioButtonValue;
                        if(selectedRadioButton != -1)
                          if (i < totalQues) {
                            result += selectedRadioButton;
                            setState(() {
                              isOptionSelected = false;
                              i++;
                              selectedRadioButton = -1;
                              indexOfQuestion++;
                            }
                            );
                          }

                        else {
                            result += selectedRadioButton;
                          FacebookInterstitialAd.loadInterstitialAd(
                            placementId: fanPlacementId,
                            listener: (result, value) {
                              if (result == InterstitialAdResult.LOADED)
                                FacebookInterstitialAd.showInterstitialAd(delay: 1000);
                            },
                          );
                          //String score = "$result/$totalPoints";
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext buildContext) => Result(score: result, totalPoint: totalPoints, testName: quesAndAns[4]["Name"],))
                          );
                        }
                      },

                    ),
                  ),
                ),

                ),
              ],
            ),
        ),],),
      ),
    );
  }
             setSelectedRadio(int val){
              setState(() {
                isOptionSelected = true;
                selectedRadioButton = val;

              });
             }
  Widget _myRadioButton({String quesIndex, int value, Function onChanged}) {
    String getOption(){
      if(isSameAnswerSet) return quesAndAns[1]["1"][quesIndex];
     else return quesAndAns[1][i.toString()][quesIndex];
    }
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),

      child: RadioListTile(
        value: value,
        //groupValue: radioButtonValue,
        groupValue: selectedRadioButton,
        activeColor: Colors.pinkAccent,
        onChanged: onChanged,
        title: Text(getOption()),
      ),
    );

  }

  Widget getRadioButtons(){
    switch(totalAnswerOptions){
      case 2:  {
        return Column(
          children: <Widget>[

      _myRadioButton(
      quesIndex : 'a',
          value: 0,
          onChanged: (newValue) => setSelectedRadio(newValue)      ),
    _myRadioButton(
    quesIndex : 'b',
    value: 1,
        onChanged: (newValue) => setSelectedRadio(newValue)
    ),
    ]);
    }

      case 3: {
        return Column(
          children: <Widget>[

            _myRadioButton(
                quesIndex : 'a',
                value: 0,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'b',
                value: 1,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'c',
                value: 2,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),

          ],
        );
      }

      case 4: {
        return Column(
          children: <Widget>[

            _myRadioButton(
                quesIndex : 'a',
                value: 0,
                onChanged: (newValue) => setSelectedRadio(newValue)
            ),
            _myRadioButton(
                quesIndex : 'b',
                value: 1,
                onChanged: (newValue) => setSelectedRadio(newValue)
            ),
            _myRadioButton(
                quesIndex : 'c',
                value: 2,
                onChanged: (newValue) => setSelectedRadio(newValue)
            ),
            _myRadioButton(
                quesIndex : 'd',
                value: 3,
                onChanged: (newValue) => setSelectedRadio(newValue)
            ),

          ],
        );
      }
      case 5: {
        return Column(
          children: <Widget>[

            _myRadioButton(
                quesIndex : 'a',
                value: 0,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'b',
                value: 1,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'c',
                value: 2,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'd',
                value: 3,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'e',
                value: 4,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),

          ],
        );
      }
      case 6: {
        return Column(
          children: <Widget>[

            _myRadioButton(
                quesIndex : 'a',
                value: 0,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'b',
                value: 1,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'c',
                value: 2,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'd',
                value: 3,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'e',
                value: 4,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),
            _myRadioButton(
                quesIndex : 'f',
                value: 5,
                onChanged: (newValue) => setSelectedRadio(newValue)            ),

          ],
        );
      }

    }
    return Column(
      children: <Widget>[

        _myRadioButton(
            quesIndex : 'a',
            value: 0,
            onChanged: (newValue) => setState(() => radioButtonValue = newValue)
        ),
        _myRadioButton(
            quesIndex : 'b',
            value: 1,
            onChanged: (newValue) => setState(() => radioButtonValue = newValue)
        ),
        _myRadioButton(
            quesIndex : 'c',
            value: 2,
            onChanged: (newValue) => setState(() => radioButtonValue = newValue)
        ),
        _myRadioButton(
            quesIndex : 'd',
            value: 3,
            onChanged: (newValue) => setState(() => radioButtonValue = newValue)
        ),

      ],
    );
  }



}
class Result extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String result;
  int percentages;
  String risk="";
  String testName;
  int score, totalPoint;
  Color color = Colors.green;
  ResultModel _resultModel = ResultModel();
  List<ResultModel> models = [];
  DatabaseHelper _dbHelper;
  Result({this.score, this.totalPoint, this.testName});
 String  getResult(bool isKnowingRisk) {
   double ratio = score / totalPoint * 100;
   var pos = testName.lastIndexOf(' ');
   String name = testName.substring(0, pos);
   String riskDescription = "";
   if (ratio <= 40) {
     risk = "Low or No Risk";
     color = Colors.green;
     riskDescription = "Your answers suggest that there is Little or No indication that " +
         "you are experiencing symptoms common among people with" + " $name. " +
         "However, this quiz is no substitute for a proper diagnosis from a health care " +
         "professional and we would encourage you to schedule an appointment with your doctor or " +
         "other mental health professional now. ";
   }
   else if (ratio > 40 && ratio <= 80){
     color = Colors.yellow;
     risk = "Moderate Risk";
     riskDescription = "Your answers suggest that there is moderate risk that " +
         "you are experiencing symptoms common among people with" + " $name. " +
         "However, this quiz is no substitute for a proper diagnosis from a health care " +
         "professional and we would encourage you to schedule an appointment with your doctor or " +
         "other mental health professional now. ";
 }
   else if(ratio>80){
     color = Colors.red;
     risk = "High Risk";
     riskDescription = "Your answers suggest that there is high risk that "+
         "you are experiencing symptoms common among people with" + " $name. "+
         "However, this quiz is no substitute for a proper diagnosis from a health care "+
         "professional and we would encourage you to schedule an appointment with your doctor or "+
         "other mental health professional now. ";

   }
   if(isKnowingRisk) return risk;
   else return riskDescription;
 }

 createDialog(BuildContext context){
   return showDialog(context: context, builder: (context){
     return AlertDialog(
       title: Text("Enter your note"),
       content: TextField(
          controller: controller,
       ),
       actions: <Widget>[
         MaterialButton(
           elevation: 5.0,
           child: Text("Save Result"),
           onPressed: ()async{
             DateTime now = DateTime.now();
             DateFormat df = DateFormat('dd/MM/yyyy');
             String formattedDate = df.format(now);
             _dbHelper = DatabaseHelper.instance;
             _resultModel.name = testName;
             _resultModel.note = controller.text.toString();
             _resultModel.resultStatus = percentages;
             _resultModel.date = formattedDate;
             await _dbHelper.insertResult(_resultModel);
             print(_resultModel.name);
             Navigator.of(context).pop();
             Fluttertoast.showToast(msg: "Result Saved", fontSize: 30.0);
           },
         ),
       ],
     );
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result"),),
      body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      child: Text(getResult(true), style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),),
                    TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(seconds: 4),
                        builder: (context, value, child){
                          value = score/totalPoint;
                          percentages = (value*100).ceil();
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            child: Stack(
                              children: <Widget>[
                                ShaderMask(
                                  shaderCallback: (rect){
                                    return SweepGradient(
                                      stops: [value, value],
                                      startAngle: 0.0,
                                      endAngle: 2 * 3.14,
                                      center: Alignment.center,
                                      colors: [color, Colors.grey.withAlpha(55)],
                                    ).createShader(rect);
                                  },
                                  child: Container(
                                    height: 200.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white
                                    ),
                                  ),

                                ),
                                Center(
                                  child: Container(
                                    height: 160.0,
                                    width: 160.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(child: Text("$percentages \nout of\n 100", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
                                  ),
                                )
                              ],
                            ),
                          );}
                    ),
                    //   Container(
                    //   margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    //    child: Text("$score out of $totalPoint", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Text(getResult(false), style: TextStyle(fontSize: 20.0,), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 25.0),
                      child: RaisedButton(onPressed: (){
                        createDialog(context);

                      },
                        child: Text("Save Result"),
                      ),
                    )

                  ],
                ),
              )
            ],

          )
      ),
    );
  }
}
