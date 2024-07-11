import 'package:dio/dio.dart';

import '../shared_variables.dart';

Future<List> getHackerData(String id) async {
  Dio dio = Dio();
  try {
    final response =
        await dio.get("$HackerBackendLink/$id", options: Options(headers: organizerCredentials));
    dio.close();
    return [200, response.data];
  } on DioException catch (error) {
    List response = [-1, error.message];
    dio.close();
    if (error.response != null) {
      print("getHackerData ${error.response!.statusCode} - ${error.response!.data}");
      response = [error.response!.statusCode, error.response!.data];
    } else {
      print("getHackerData $error");
    }
    return response;
  }
}

Future<List> updateHackerCheckList(dynamic id, Map body) async {
  Dio dio = Dio();
  try {
    final response = await dio.put(
      "$HackerBackendLink/$id/check-list",
      data: body,
      options: Options(headers: organizerCredentials),
    );
    dio.close();
    return [200, response.data];
  } on DioException catch (error) {
    List response = [-1, error.message];
    dio.close();
    if (error.response != null) {
      print("updateHackerCheckList ${error.response!.statusCode} - ${error.response!.data}");
      response = [error.response!.statusCode, error.response!.data];
    } else {
      print("updateHackerCheckList $error");
    }
    print(response);
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
