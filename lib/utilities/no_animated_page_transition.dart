import 'package:flutter/material.dart';

noAnimatedTransition({
  required BuildContext context,
  required Widget destinationPage,
}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => destinationPage,
      transitionDuration: const Duration(seconds: 0),
    ),
  );
}

noAnimatedPushReplacement({
  required BuildContext context,
  required Widget destinationPage,
}) {
  return Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => destinationPage,
      transitionDuration: const Duration(seconds: 0),
    ),
  );
}
