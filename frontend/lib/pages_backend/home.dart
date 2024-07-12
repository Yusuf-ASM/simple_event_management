import 'package:flutter/material.dart';
import 'package:simple_event_management/backend/api/hacker_api.dart';
import 'package:simple_event_management/components/switches.dart';

import '../../components/shared_components.dart';

Future<void> searchButton({
  required String id,
  required BuildContext context,
  required Function(dynamic) data,
}) async {
  FocusScope.of(context).unfocus();
  id = id.trim().toLowerCase();

  if (id.isNotEmpty) {
    loadingIndicatorDialog(context);
    final response = await getHackerData(id);
    if (context.mounted) {
      Navigator.of(context).pop();
      if (response[0] == 200) {
        data(response[1]);
        snackBar("hacker", context);
      } else {
        snackBar(response[1], context);
      }
    }
  } else {
    snackBar("Please fill Hacker ID field :)", context);
  }
}

TableCell labelCell(String text) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

TableCell dataCell(String text) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectableText(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

List<TableRow> hackerDataTable(Map json, BuildContext context, VoidCallback update) {
  List<TableRow> output = [];
  for (var key in json.keys) {
    if (key != "checkList") {
      output.add(TableRow(children: [labelCell(key), dataCell(json[key].toString())]));
    }
  }

  if (json["checkList"] != null) {
    for (var key in json["checkList"].keys) {
      print(json["checkList"][key]);
      output.add(TableRow(children: [
        labelCell(key),
        customSwitch(json["id"].toString(), json["checkList"], key, update)
      ]));
    }
  }

  return output;
}
