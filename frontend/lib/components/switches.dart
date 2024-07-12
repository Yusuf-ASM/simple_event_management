import 'package:flutter/material.dart';

import '../backend/api/hacker_api.dart';
import 'shared_components.dart';

Widget customSwitch(String id, Map checkList, String key, VoidCallback update) {
  bool value = checkList[key];
  return StatefulBuilder(
    builder: (context, setState) {
      return Switch(
        activeColor: Colors.blueAccent,
        activeTrackColor: Colors.grey.shade400,
        inactiveThumbColor: Colors.blueGrey.shade600,
        inactiveTrackColor: Colors.grey.shade400,
        splashRadius: 25,
        value: value,
        onChanged: (updated) async {
          loadingIndicatorDialog(context);
          checkList[key] = updated;
          final response = await updateHackerCheckList(id, {"checkList": checkList});
          if (response[0] == 200) {
            if (context.mounted) {
              value = updated;
              print(value);
              setState(() {});
              update();
            }
          } else {
            if (context.mounted) {
              snackBar(response[1], context);
            }
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
      );
    },
  );
}
