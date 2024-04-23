import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.backgroundColor,
    required this.textButton,
     this.borderRadius, required this.text, this.fontSize, this.onPressed});

  final Color backgroundColor ;
  final Color textButton ;
  final BorderRadius ? borderRadius;
  final double ?fontSize ;
  final String text ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor:backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius ?? BorderRadius.circular(12)
            )
          ),
          child: Text(
              text,
            style: Styles.textStyle16.copyWith(
              color: textButton,
              fontWeight: FontWeight.w900,
              fontSize:fontSize
            ),
              )),
    );
  }
}
