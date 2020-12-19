import 'package:budgetsika/data/view_models/app_model.dart';
import 'package:budgetsika/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ABSAppModel>(
            create: (_) => AppModel()),
      ],
      child: MaterialApp(
        title: 'Budget Sika',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Caros",
          primarySwatch: Colors.blue,
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
