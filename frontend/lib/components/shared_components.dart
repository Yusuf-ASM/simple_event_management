import 'package:flutter/material.dart';

import '../backend/shared_variables.dart';

dynamic snackBar(dynamic message, BuildContext context, {int duration = 2000}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: duration),
      content: Text(
        message.toString(),
        style: const TextStyle(fontSize: SemiTextSize),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

dynamic loadingIndicatorDialog(BuildContext context, {bool dismissible = false}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PopScope(
        canPop: false,
        child: SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: [Center(child: CircularProgressIndicator())],
        ),
      );
    },
  );
}

Center loadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
