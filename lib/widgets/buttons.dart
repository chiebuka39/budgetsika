import 'package:budgetsika/styles/colors.dart';
import 'package:budgetsika/utils/strings.dart';
import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  final Color textColor;
  final bool loading;
  final double horizontalMargin;

  const PrimaryButton(
      {Key key,
        @required this.onPressed,
        @required this.title,
        this.color = AppColors.kAccentColor,
        this.loading = false, this.horizontalMargin = 0, this.textColor = AppColors.kWhite})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: ButtonTheme(
          minWidth: double.infinity,
          buttonColor: color,
          height: 55,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            onPressed: onPressed,
            child: loading == true
                ? SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : Text(
              title,
              style: TextStyle(
                fontSize: 14,
                  color: textColor, fontFamily: "Caros-Bold"),
            ),
          )),
    );
  }
}
class OutlinePrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final bool loading;
  final double horizontalMargin;

  const OutlinePrimaryButton(
      {Key key,
        @required this.onPressed,
        @required this.title,
        this.color = AppColors.kWhite,
        this.loading = false,
        this.horizontalMargin = 0,
        this.textColor = AppColors.kAccentColor,
        this.borderColor = AppColors.kAccentColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: ButtonTheme(
          minWidth: double.infinity,
          buttonColor: color,
          height: 55,
          child: RaisedButton(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: borderColor,width: .8)
            ),
            onPressed: onPressed,
            child: loading == true
                ? SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : Text(
              title,
              style: TextStyle(
                fontSize: 14,
                  color: textColor, fontFamily: "Caros-Bold"),
            ),
          )),
    );
  }
}

class PrimaryButtonNew extends StatelessWidget {
  const PrimaryButtonNew({
    Key key, this.onTap, this.width = 200, this.height = 55, this.title,
    this.bg = AppColors.kPrimaryColor, this.textColor = Colors.white, this.loading = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final double width;
  final Color bg;
  final Color textColor;
  final double height;
  final String title;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    print("fjjfjf $onTap");
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: onTap == null ?AppColors.kGreyText.withOpacity(0.6): bg,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),): Text(title,
          style: TextStyle(color: textColor,fontSize: 13,fontFamily: AppStrings.fontNormal),),),
      ),
    );
  }
}

class RoundedNextButton extends StatelessWidget {
  const RoundedNextButton({
    Key key, this.onTap, this.loading = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 74,
          height: 74,
          child: Stack(
            children: [
              Container(
                width: 74,
                height: 74,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kPrimaryColorLight
                ),

              ),
              Positioned(
                left: 0,
                right: 0,
                top: 7,

                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: onTap == null ? AppColors.kPrimaryColor.withOpacity(0.5) : AppColors.kPrimaryColor
                  ),
                  child: Center(child: loading ?
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),): Icon(Icons.navigate_next,color: Colors.white,),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}