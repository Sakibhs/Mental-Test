import 'package:flutter/material.dart';
import 'package:mental_test_quiz/Quiz.dart';

class Test extends StatelessWidget{
  static String name = "Test";
  const Test({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(30, (index) {
             String testName, imageUrl = "assets/images/applogo.jpg";
            int indexNumber = index+1;
            switch(indexNumber){
              case 1: testName="Schizophrenia";
              imageUrl = "assets/images/schizophrenia.jpg";
                       break;
              case 2: testName="Antisocial Personality Disorder(ASPD)";
              imageUrl = "assets/images/aspd.jpg";
              break;
              case 3: testName="Anxiety";
              imageUrl = "assets/images/anxiety.jpg";
              break;
              case 4: testName="Autism";
              imageUrl = "assets/images/autism.jpg";
              break;
              case 5: testName="Binge Eating Disorder";
              imageUrl = "assets/images/eating.jpg";
              break;
              case 6: testName="Bipolar Disorder";
              imageUrl = "assets/images/bipolar.jpg";
              break;
              case 7: testName="Borderline Personality Disorder";
              imageUrl = "assets/images/borderline.png";
              break;
              case 8: testName="Child Autism";
              imageUrl = "assets/images/childaut.jpg";
              break;
              case 9: testName="Childhood Asperger Syndrome";
              imageUrl = "assets/images/asperger.jpg";
              break;
              case 10: testName="Complicated Grief";
              imageUrl = "assets/images/grief.jpg";
              break;
              case 11: testName="Dementia";
              imageUrl = "assets/images/dementia.jpg";
              break;
              case 12: testName="Depression";
              imageUrl = "assets/images/depression.jpg";
              break;
              case 13: testName="Dissociative Identity Disorder";
              imageUrl = "assets/images/did.jpg";
              break;
              case 14: testName="Domestic Violence";
              imageUrl = "assets/images/domestic.jpg";
              break;
              case 15: testName="Internet Addiction";
              imageUrl = "assets/images/internet.jpg";
              break;
              case 16: testName="Narcissistic Personality Disorder";
              imageUrl = "assets/images/narcissistic.jpg";
              break;
              case 17: testName="Paranoid Personality Disorder";
              imageUrl = "assets/images/paranoid.jpg";
              break;
              case 18: testName="Post Traumatic Stress Disorder (PTSD)";
              imageUrl = "assets/images/ptsd.jpg";
              break;
              case 19: testName="Psychopathy";
              imageUrl = "assets/images/psychopathy.jpg";
              break;
              case 20: testName="Psychosis";
              imageUrl = "assets/images/psychosis.jpg";
              break;
              case 21: testName="Relationship Hamper Status";
              imageUrl = "assets/images/relationship.jpg";
              break;
              case 22: testName="Separation Anxiety";
              imageUrl = "assets/images/separation.jpg";
              break;
              case 23: testName="Sex Addiction";
              imageUrl = "assets/images/sex.jpg";
              break;
              case 24: testName="Social Anxiety Disorder";
              imageUrl = "assets/images/social.jpg";
              break;
              case 25: testName="Video Game Addiction";
              imageUrl = "assets/images/game.jpg";
              break;
              case 26: testName="Mania";
              imageUrl = "assets/images/mania.jpg";
              break;
              case 27: testName="Obsessive Compulsive Disorder";
              imageUrl = "assets/images/ocd.jpg";
              break;
              case 28: testName="Panic Disorder";
              imageUrl = "assets/images/panic.jpg";
              break;
              case 29: testName="Repetitive Thoughts and Behavior";
              imageUrl = "assets/images/repetitive.jpg";
              break;
              case 30: testName="Agoraphobia";
              imageUrl = "assets/images/agoraphobia.jpg";
              break;

            }
            return GestureDetector(
              onTap: (){
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => Disclaimer(mentalTestName: testName,),
                );
                Navigator.of(context).push(route);
              },

                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
            child: Container(
            decoration: BoxDecoration(
            image:DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.teal.withOpacity(0.4), BlendMode.darken)
            ),
            ),

                  child: Text(
                    testName,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                  ),
                ),
                )

            );

          }),
      ),
    );
  }

}

