import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterCustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign? textAlign;
  const InterCustomText(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontsize,
      required this.fontWeight, this.height, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: textAlign,

      style: GoogleFonts.inter(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}
class MontserratCustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const MontserratCustomText(
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
class LexendCustomText extends StatelessWidget {
  final TextAlign? textAlign;
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const LexendCustomText(
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

class WorkSansCustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const WorkSansCustomText(
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
class PoppinsCustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const PoppinsCustomText(
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
class SoraCustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const SoraCustomText(
      {super.key,
        required this.text,
        required this.textColor,
        this.fontsize,
        required this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
        textStyle: TextStyle(
            color: textColor, fontSize: fontsize, fontWeight: fontWeight,height:height ),
      ),
    );
  }
}