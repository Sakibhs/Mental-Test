import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Colors.white, Colors.cyan]
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.note),
                title: Text("Privacy Policy"),
                onTap: _launchWebPage,
              ),
            ),
            Container(
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.more),
                title: Text("More Apps"),
                onTap: _launchDeveloperPage,
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   child: ListTile(
            //     leading: Icon(Icons.get_app),
            //     title: Text("Get Pro"),
            //   ),
            // ),
            Container(
              width: double.infinity,
              child: ListTile(
                onTap: (){
                  //LaunchReview.launch();
                  LaunchReview.launch(androidAppId: "net.appcolors.mental_test_quiz");
                },
                leading: Icon(Icons.rate_review),
                title: Text("Rate the app"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchDeveloperPage() async {
   const url = 'https://play.google.com/store/apps/dev?id=5474137946144630162';
    //const url = 'https://colorfulapps.blogspot.com/2018/09/mobile-apps-privacy-policy.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchWebPage() async {
    const url = 'https://colorfulapps.blogspot.com/2018/09/mobile-apps-privacy-policy.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}