import 'package:budgetsika/data/models/category.dart';
import 'package:budgetsika/data/view_models/app_model.dart';
import 'package:budgetsika/screens/stats_breakdown.dart';
import 'package:budgetsika/styles/colors.dart';
import 'package:budgetsika/utils/margin.dart';
import 'package:budgetsika/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(),
        settings:
        RouteSettings(name: HomeScreen().toStringShort()));
  }
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ABSAppModel appModel;
  @override
  Widget build(BuildContext context) {
    appModel = Provider.of(context);
    return Scaffold(

      body: Center(
        child: Column(children: [
            YMargin(100),
          Text("Budget Remaining", style: TextStyle(fontSize: 12,
              color: AppColors.kGreyText),),
          YMargin(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("\$${appModel.monthlyBudget}", style: TextStyle(fontSize: 30, fontFamily: "Caros-Medium"),),
              GestureDetector(
                child: Icon(Icons.edit, size: 16,),
                onTap: (){
                  showCupertinoModalBottomSheet(context: context, builder: (context){
                    return EnterMonthBudget();
                  });
                },
              )
            ],
          ),
          FlatButton(
            child: Text("View Stats"),
            onPressed: (){
              Navigator.of(context).push(StatsBreakDown.route());
            },
          ),
          Spacer(),
          SvgPicture.asset("images/empty-box2.svg", height: 100,),
          SizedBox(
            width: 250,
              child: Text("You dont have any budget currently, "
                  "create one for this month to add expenses",
                style: TextStyle(height: 1.6,color: AppColors.kGreyText),
                textAlign: TextAlign.center,)),
          YMargin(15),
          PrimaryButtonNew(
            title: "Add Expense",
            onTap: (){
              showCupertinoModalBottomSheet(context: context, builder: (context){
                return AddExpense();
              });
            },
          ),
          YMargin(100),
        ],),
      ),
    );
  }
}

class AddExpense extends StatefulWidget {
  const AddExpense({
    Key key,
  }) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  Category category;
  String title;

  @override
  Widget build(BuildContext context) {
    ABSAppModel appModel = Provider.of(context);
    return Container(
      color: AppColors.kWhite,
      height: MediaQuery.of(context).size.height * .5,
      child: Scaffold(
        body: Column(children: [
          YMargin(30),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kGreyBg,
              borderRadius: BorderRadius.circular(7)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "e.g., Spent 500 on Airtel Subscription",
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none
              ),
            ),
          ),
          YMargin(10),
          appModel.categories == null ? Row(
            children: [
              XMargin(20),
              GestureDetector(
                onTap: (){
                  showCupertinoModalBottomSheet(context: context, builder: (context){
                    return AddCategory();
                  });
                },
                child: Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kPrimaryColor,width: .6),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Add Category", style: TextStyle(fontSize: 10,
                      fontFamily: "Caros-medium", color: AppColors.kPrimaryColor),),),
                ),
              ),
            ],
          ):
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 25,
           width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
              if(index == appModel.categories.length){
                return GestureDetector(
                  onTap: (){
                    showCupertinoModalBottomSheet(context: context, builder: (context){
                      return AddCategory();
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(color:  AppColors.kPrimaryColor,width: .6),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("Add Category", style: TextStyle(fontSize: 10,
                        fontFamily: "Caros-medium", color: AppColors.kPrimaryColor),),),
                  ),
                );
              }else{
                return GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: 100,
                    height: 25,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color:category == null ? AppColors.kGreyText : category.title ==appModel.categories[index].title ? AppColors.kPrimaryColor:AppColors.kGreyText,width: .6),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text(appModel.categories[index].title, style: TextStyle(fontSize: 10,
                        fontFamily: "Caros-medium", color: category == null ? AppColors.kGreyText : category.title == appModel.categories[index].title ? AppColors.kPrimaryColor:AppColors.kGreyText,),),),
                  ),
                );
              }

            },
              itemCount: appModel.categories.length +1,
            ),
          ),
          Spacer(),
          PrimaryButtonNew(
            title: "Create Expence",
            onTap: (){

            },

          ),
          YMargin(50),
        ],),
      ),
    );
  }
}

class AddCategory extends StatefulWidget {
  const AddCategory({
    Key key,
  }) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {

  TextEditingController titleController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  @override
  void initState() {
    titleController.addListener(() {
      setState(() {

      });
    });

    budgetController.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ABSAppModel appModel = Provider.of(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        color: AppColors.kWhite,
        child: Scaffold(
          body: Column(children: [
            YMargin(30),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.kGreyBg,
                  borderRadius: BorderRadius.circular(7)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Category Title",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none
                ),
              ),
            ),
            YMargin(20),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.kGreyBg,
                  borderRadius: BorderRadius.circular(7)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Category Budget",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none
                ),
              ),
            ),
            Spacer(),
            PrimaryButtonNew(
              onTap: titleController.text.length > 2 && budgetController.text.length > 2 ? (){
                if(appModel.categories == null){
                  appModel.categories = [Category(title: titleController.text,
                      budget: double.parse(budgetController.text))];
                }else{
                  List<Category> values = appModel.categories;
                  values.add(Category(title: titleController.text,
                      budget: double.parse(budgetController.text)));
                  appModel.categories = values;
                }
                Navigator.pop(context);
              }:null,
              title: "Create Category",
            ),
            YMargin(30)
          ],),
        ),
      ),
    );
  }
}

class EnterMonthBudget extends StatefulWidget {
  const EnterMonthBudget({
    Key key,
  }) : super(key: key);

  @override
  _EnterMonthBudgetState createState() => _EnterMonthBudgetState();
}

class _EnterMonthBudgetState extends State<EnterMonthBudget> {

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.addListener(() {
      print("text ${textEditingController.text}");
      setState(() {

      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ABSAppModel appModel = Provider.of(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        color: AppColors.kWhite,
        width: 400,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              YMargin(30),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.kGreyBg,
                    borderRadius: BorderRadius.circular(7)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(

                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Budget for the montht",
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none
                  ),
                ),
              ),
              YMargin(100),
              PrimaryButtonNew(
                title: "Create Budget",
                onTap: textEditingController.text.length > 2 ? (){
                  appModel.monthlyBudget = double.parse(textEditingController.text);
                  Navigator.pop(context);
                }: null,
              ),
              YMargin(30)
            ],),
          ),
        ),
      ),
    );
  }
}
