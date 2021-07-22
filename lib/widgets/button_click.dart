import 'package:coinhe/constant/app_color.dart';
import 'package:flutter/material.dart';

class ButtonClick extends StatelessWidget {
  final GestureTapCallback onTap;

  final String title;

  final Color titleColor;

  final Color backgroundColor;

  final Color colorBorder;

  ButtonClick({
    @required this.onTap,
    @required this.title,
    this.titleColor,
    this.backgroundColor,
    this.colorBorder
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor != null ? backgroundColor : AppColors.blue,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: colorBorder != null ? colorBorder : Colors.transparent,
              width: colorBorder != null ? 1 : 0,
            ),
            boxShadow: [
              BoxShadow(
                color: backgroundColor != null ? backgroundColor : AppColors.blue,
                offset: Offset(0.5,0.5),
                blurRadius: 1.0,
                spreadRadius: 1.0
              ),
              BoxShadow(
                  color: backgroundColor != null ? backgroundColor : AppColors.blue,
                  offset: Offset(-0.5,-0.5),
                  blurRadius: 1.0,
                  spreadRadius: 1.0
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                color: titleColor != null ? titleColor : AppColors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        )
    );
  }
}