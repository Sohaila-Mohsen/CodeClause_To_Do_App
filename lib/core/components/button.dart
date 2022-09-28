import 'package:flutter/material.dart';

import '../style/app_colors/app_colors.dart';
import '../style/app_text_style/app_text_style.dart';

class AppButton extends StatelessWidget {
  Function onPress;
  String text;
  double? width;
  double? height;
  double? textSize;
  double? radius;
  bool? enabeled;
  AppButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.width,
      this.enabeled =true,
      this.height = 50,
      this.textSize = 14,
      this.radius = 5})
      : super(key: key) {
    if (width == null) {
      width = double.infinity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          //color: AppColors.primaryColorLight
        ),
        child: ElevatedButton(
          onPressed: () {
            onPress();
          },
          style: ElevatedButton.styleFrom(
              primary: (enabeled!)?AppColors.primaryColorLight : Color.fromARGB(255, 188, 188, 188),
              fixedSize: Size(width!, height!)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.buttonTextStyle(textSize! , enabeled!),
              ),
            ],
          ),
        ));
  }
}
