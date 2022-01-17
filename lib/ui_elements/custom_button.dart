import 'package:flutter/material.dart';
import 'package:test_project/my_theme.dart';
class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  CustomButton({this.onTap, @required this.btnTxt, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor:  MyTheme.accent_color ,
      minimumSize: Size(MediaQuery.of(context).size.width, 60),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: TextButton(
        onPressed: onTap,
        style: flatButtonStyle,
        child: Text(btnTxt??"",
            style: Theme.of(context).textTheme.headline3.copyWith(color: MyTheme.white, fontSize: 16)),
      ),
    );
  }
}