import 'package:budgetsika/screens/home_screen.dart';
import 'package:budgetsika/utils/margin.dart';
import 'package:budgetsika/widgets/buttons.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(children: [
            YMargin(100),
            Text("Budgetsika", style: TextStyle(fontSize: 20, fontFamily: "Caros-Medium"),),
            YMargin(20),
            SizedBox(
              width: 200,
                child: Text("Manage and balance your budget with us",
                  textAlign: TextAlign.center,style: TextStyle(fontFamily: "Caros-Light", height: 1.7),)
            ),
            Spacer(),
            PrimaryButtonNew(
              onTap: (){
                Navigator.push(context, HomeScreen.route());
              },
              title: "Get Started",
            ),
            YMargin(100)
          ],),
        ),
      ),
    );
  }
}
