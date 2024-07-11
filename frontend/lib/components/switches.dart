import 'package:flutter/material.dart';

import '../backend/api/hacker_api.dart';
import 'shared_components.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final Map json;
  final String jsonKey;
  const CustomSwitch({
    super.key,
    required this.json,
    required this.initialValue,
    required this.jsonKey,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool switchValue = false;
  @override
  void initState() {
    switchValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Switch(
        activeColor: Colors.blueAccent,
        activeTrackColor: Colors.grey.shade400,
        inactiveThumbColor: Colors.blueGrey.shade600,
        inactiveTrackColor: Colors.grey.shade400,
        splashRadius: 25,
        value: switchValue,
        onChanged: (value) async {
          loadingIndicatorDialog(context);
          Map json = widget.json;
          Map checkList = json["checkList"];
          checkList[widget.jsonKey] = value;
          final response = await updateHackerCheckList(json["id"], {"checkList": checkList});
          if (response[0] == 200) {
            if (context.mounted) {
              setState(() => switchValue = !switchValue);
            }
          } else {
            snackBar(response[1], context);
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
