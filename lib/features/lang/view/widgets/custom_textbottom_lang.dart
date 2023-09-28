
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/constants/colors_manager.dart';

class CustomTextBottomLang extends StatelessWidget {
   CustomTextBottomLang({super.key,required this.text,required this.fun, required this.color});
final String text;
 void Function()? fun;
 final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: MaterialButton(
        onPressed:fun,
        child:  Text(
          text,
          style:const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.white,
              fontSize: 20),
        ),
      ),
    );
  }
}
