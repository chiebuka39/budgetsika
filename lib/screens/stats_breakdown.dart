import 'package:budgetsika/styles/colors.dart';
import 'package:budgetsika/utils/margin.dart';
import 'package:budgetsika/utils/strings.dart';
import 'package:budgetsika/widgets/pie2.dart';
import 'package:flutter/material.dart';


class StatsBreakDown extends StatefulWidget {

  static Route<dynamic> route() {
    return MaterialPageRoute(
        builder: (_) => StatsBreakDown(),
        settings:
        RouteSettings(name: StatsBreakDown().toStringShort()));
  }

  @override
  _NairaPortfolioBreakdownScreenState createState() => _NairaPortfolioBreakdownScreenState();
}

class _NairaPortfolioBreakdownScreenState extends State<StatsBreakDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text("Stats Breakdown",
          style: TextStyle(color: Colors.black87,fontSize: 14),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          PieChartSample2(),
          YMargin(20),
          Divider(),
          Container(
            height: 70,
            child: Row(children: [
              Text("Food", style: TextStyle(color: AppColors.kGreyText),),
              Spacer(),
              Text("${AppStrings.nairaSymbol}400", style: TextStyle(
                  color: AppColors.kGreyText, fontFamily: "Caros-Medium"),),
            ],),
          ),
          Divider(),
          Container(
            height: 70,
            child: Row(children: [
              Text("Books", style: TextStyle(color: AppColors.kGreyText),),
              Spacer(),
              Text("${AppStrings.nairaSymbol}400", style: TextStyle(
                  color: AppColors.kGreyText, fontFamily: "Caros-Medium"),),
            ],),
          ),
          Divider(),
          Container(
            height: 70,
            child: Row(children: [
              Text("Movies", style: TextStyle(color: AppColors.kGreyText),),
              Spacer(),
              Text("${AppStrings.nairaSymbol}400", style: TextStyle(
                  color: AppColors.kGreyText, fontFamily: "Caros-Medium"),),
            ],),
          ),
          Divider(),
          Container(
            height: 70,
            child: Row(children: [
              Text("Friends", style: TextStyle(color: AppColors.kGreyText),),
              Spacer(),
              Text("${AppStrings.nairaSymbol}400", style: TextStyle(
                  color: AppColors.kGreyText, fontFamily: "Caros-Medium"),),
            ],),
          ),
          Divider(),

        ],),
      ),
    );
  }
}
