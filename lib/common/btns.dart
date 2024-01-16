import 'package:entaqel_task/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:35.0),
        child: Container(
          height: 46.0,
          decoration: BoxDecoration(
            color: ColorsHelper.frist,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
