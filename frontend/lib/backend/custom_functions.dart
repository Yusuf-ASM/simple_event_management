// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';

import 'shared_variables.dart';
import 'package:dio/dio.dart';

Future<bool> checkInternetConnection() async {
  if (Testing) {
    return true;
  }
  Dio dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 3)));
  try {
    await dio.get('https://example.com');
    return true;
  } on DioException catch (_) {
    return false;
  }
}

class LoadingStateNotifier with ChangeNotifier {
  LoadingStateNotifier({this.loading = true});
  bool loading = true;
  List<dynamic> response = [];
  void change() {
    loading = !loading;
    notifyListeners();
  }
}

class VariableNotifier<T> with ChangeNotifier {
  void change() {
    notifyListeners();
  }
}

int currentTimeEpoch() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, 2).millisecondsSinceEpoch ~/ 1000;
}
