import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_event_management/home_page.dart';

import '../backend/api/auth_api.dart';
import '../../components/shared_components.dart';
import '../backend/shared_variables.dart';

Future<void> loginButton({
  required String username,
  required String password,
  required BuildContext context,
}) async {
  FocusScope.of(context).unfocus();
  username = username.trim().toLowerCase();

  if (username.isNotEmpty && password.isNotEmpty) {
    loadingIndicatorDialog(context);
    final response = await login({"username": username, "password": password});
    if (context.mounted) {
      Navigator.of(context).pop();
      if (response[0] == 200) {
        organizerCredentials = response[1];
        Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false,
        );
      } else {
        snackBar(response[1], context);
      }
    }
  } else {
    snackBar("Please fill Username/Password field :)", context);
  }
}
