import 'dart:convert';

import 'package:flutter/material.dart';

import 'Quiz.dart';
class GetQuesAndAns extends StatelessWidget {
  bool isSameAnswerSet = true;
  int totalAnswerOptions;
  String mentalTestName;
  String jsonName;
  GetQuesAndAns({Key key, this.mentalTestName}) : super(key : key);
  String checkTestName(){
    switch(mentalTestName){
      case "Schizophrenia": jsonName = "assets/schizophrenia.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 4;
      break;
      case "Depression": jsonName = "assets/depression.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 4;
      break;
      case "Obsessive Compulsive Disorder": jsonName = "assets/ocd.json";
      isSameAnswerSet = false;
      totalAnswerOptions = 5;
      break;
      case "Anxiety": jsonName = "assets/anxiety.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 4;
      break;
      case "Agoraphobia": jsonName = "assets/agoraphobia.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 5;
       break;
      case "Post Traumatic Stress Disorder (PTSD)" : jsonName = "assets/ptsd.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 4;
      break;
      case "Antisocial Personality Disorder(ASPD)" : jsonName = "assets/aspd.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 5;
      break;
      case "Autism" : jsonName = "assets/autism.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 4;
      break;
      case "Binge Eating Disorder" : jsonName = "assets/bed.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 5;
      break;
      case "Bipolar Disorder" : jsonName = "assets/bipolar.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;
      case "Borderline Personality Disorder" : jsonName = "assets/borderline.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;
   case "Child Autism" : jsonName = "assets/childaut.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;
    case "Childhood Asperger Syndrome" : jsonName = "assets/asperger.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;
    case "Complicated Grief" : jsonName = "assets/grief.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 3;
    break;

    case "Dementia" : jsonName = "assets/dementia.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Dissociative Identity Disorder" : jsonName = "assets/did.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 6;
    break;

    case "Domestic Violence" : jsonName = "assets/domestic.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 3;
    break;

    case "Internet Addiction" : jsonName = "assets/internet.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Narcissistic Personality Disorder" : jsonName = "assets/narcissistic.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Paranoid Personality Disorder" : jsonName = "assets/paranoid.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Psychosis" : jsonName = "assets/psychosis.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;

      case "Psychopathy" : jsonName = "assets/psychopathy.json";
      isSameAnswerSet = true;
      totalAnswerOptions = 3;
      break;

    case "Relationship Hamper Status" : jsonName = "assets/relationship.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;

    case "Separation Anxiety" : jsonName = "assets/separation.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Sex Addiction" : jsonName = "assets/sex.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;

    case "Social Anxiety Disorder" : jsonName = "assets/social.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Video Game Addiction" : jsonName = "assets/game.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 2;
    break;

    case "Mania" : jsonName = "assets/mania.json";
    isSameAnswerSet = true;
    totalAnswerOptions = 5;
    break;

    case "Panic Disorder" : jsonName = "assets/panic.json";
    isSameAnswerSet = false;
    totalAnswerOptions = 5;
    break;

    case "Repetitive Thoughts and Behavior" : jsonName = "assets/repetitive.json";
    isSameAnswerSet = false;
    totalAnswerOptions = 5;
    break;

    }
    print(jsonName);
    return jsonName;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(checkTestName()),
      builder: (context, snapshot){
        var myData = json.decode(snapshot.data.toString());
        if(myData == null){
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else{
          var l = myData[0];
          int numberOfQuestion = l.length;
          var answer = myData[3];
          int totalPoints = (answer.length-1) * numberOfQuestion;


          return BeforeQuiz(jsonData: myData, numberOfQuestion: numberOfQuestion, totalPoints: totalPoints,
          isSameAnswerSet: isSameAnswerSet, totalAnswerOptions: totalAnswerOptions, testName: mentalTestName);
        }
      },
    );
  }
}

class BeforeQuiz extends StatelessWidget {
  var jsonData;
  String testName;
  bool isSameAnswerSet = true;
  int totalAnswerOptions;
  String mentalTestName;
  String jsonName;
  int totalPoints;
  int numberOfQuestion;
  BeforeQuiz({this.jsonData, this.numberOfQuestion, this.totalPoints,
    this.isSameAnswerSet, this.totalAnswerOptions, this.testName});
  @override
  Widget build(BuildContext context) {
    final text = jsonData[2]["1"];
  //  final text2 = "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?"
  //  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(testName),
      ),
      body:  Container(
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text(
                    "Before You Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
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
                      "Continue",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                  onPressed: () {
                    var route = MaterialPageRoute(
                      builder: (BuildContext context) => Quiz(quesAndAns: jsonData, totalQues: numberOfQuestion, totalPoints: totalPoints,
                          isSameAnswerSet: isSameAnswerSet, totalAnswerOptions: totalAnswerOptions),
                    );
                    Navigator.of(context).pushReplacement(route);
                  },

                ),
              ),
            ],
          ),
        )]
        ),
      ),
    );
  }
}
