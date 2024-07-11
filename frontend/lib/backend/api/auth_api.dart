import 'package:dio/dio.dart';

import '../shared_variables.dart';

Future<List> login(Map<String, dynamic> body) async {
  Dio dio = Dio();
  try {
    final response = await dio.post("$AuthBackendLink/login", data: body);
    dio.close();
    return [200, response.data];
  } on DioException catch (error) {
    List response = [-1, error.message];
    dio.close();
    if (error.response != null) {
      print("login ${error.response!.statusCode} - ${error.response!.data}");

      response = [error.response!.statusCode, error.response!.data["error"]];
    } else {
      print("login $error");
    }
    return response;
  }
}

// Future<List> getUserCampaigns() async {
//   Dio dio = Dio();
//   final body = {"_id": box.get("_id"), "activated": true};
//   try {
//     final response = await dio.post("$BackendLink/user_campaign", data: body);
//     dio.close();
//     return [200, response.data];
//   } on DioException catch (error) {
//     List response = [-1, error.message];
//     dio.close();
//     if (error.response != null) {
//       writeError("getUserCampaigns", "${error.response!.statusCode} - ${error.response!.data}");
//       response = [error.response!.statusCode, error.response!.data["error"]];
//     } else {
//       writeError("getUserCampaigns", error);
//     }
//     return response;
//   }
// }
