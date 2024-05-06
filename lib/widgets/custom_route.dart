import 'package:flutter/material.dart';

class CustomRoute {
  static void navigateTo(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}


class CustomRoute1 {
  static void navigateAndRemoveUntil(BuildContext context, Widget route, RoutePredicate predicate) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => route),
      predicate,
    );
  }
}
