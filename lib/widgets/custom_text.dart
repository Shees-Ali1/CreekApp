import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomText(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontsize,
      required this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}
class CustomTextTwo extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomTextTwo(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontsize,
      required this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}
class CustomTextThree extends StatelessWidget {
  final TextAlign? textAlign;
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomTextThree(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontsize,
      required this.fontWeight, this.height, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: GoogleFonts.lexend(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height, ),
      ),
    );
  }
}

class CustomTextFour extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomTextFour(
      {super.key,
        required this.text,
        required this.textColor,
        this.fontsize,
        required this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.workSans(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}
class CustomTextFive extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomTextFive(
      {super.key,
        required this.text,
        required this.textColor,
        this.fontsize,
        required this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}
