import 'package:flutter/material.dart';
import 'package:mental_test_quiz/MainDrawer.dart';
import 'package:mental_test_quiz/blog.dart';
import 'package:mental_test_quiz/result.dart';
import 'package:mental_test_quiz/Tests.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  var title = {"Mental Health Test","Sweep to delete a result"};
  String name = "Mental Health Test";
 bool _visibility = false;
 bool isChecked = false;
  TabController _tabController;
  List<Widget> activities = [Test(), Result()];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
        //  title: _tabController.index==2 ? Text('Hey We have done.') : Text("Mental Health Test"),
          title: Text("$name"),
          centerTitle: true,
          actions: <Widget>[
             Visibility(
               visible: _visibility,
               child: IconButton(
                 icon: Icon(Icons.info_outline),
                 onPressed: (){
                   setState(() {
                     isChecked = !isChecked;
                     if(isChecked)
                     name = "Sweep to delete a result";
                     else name = "Mental Health Test";

                   });
                 },
               ),
             ),
          ],
          bottom: TabBar(
            controller: _tabController,
             isScrollable: false,
              tabs: <Widget>[
                Tab(
                  text: "Tests",
                  icon: Icon(Icons.assignment),
                ),
                Tab(
                  text: "Results",
                  icon: Icon(Icons.texture),
                )
              ]
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: activities,
        ),
       drawer: MainDrawer(),

    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: activities.length, vsync: this);
    _tabController.addListener(() => setState((){
      if(_tabController.index == 1){
        _visibility = true;
      } else {
        _visibility =false;
        isChecked = false;
         name = "Mental Health Test";
      }
    }));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}
