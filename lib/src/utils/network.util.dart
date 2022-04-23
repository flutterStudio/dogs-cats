import 'dart:async';
import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';

typedef ResponseHandler<T> = Future<T> Function(Response response);
typedef RequestHandler = Future<Response> Function();
typedef OnError<T> = Future<T> Function(String? error, String? message);

class NetworkUtils {
  static Future<T> handleRequest<T>(
      {required RequestHandler request,
      required ResponseHandler<T> handler,
      required OnError<T> onError}) async {
    try {
      Response response = await request();
      if (response.statusCode == 200) {
        return await handler(response);
      } else {
        var error = jsonDecode(response.body)["error"];
        var message = jsonDecode(response.body)["message"];
        return onError(error, message);
      }
    } on TimeoutException {
      return onError(
          "error-timeout".tr, "${"error-timeout".tr}, ${"try-again".tr}. ");
    } catch (e) {
      return onError(null, "error-unknown".tr);
    }
  }
}
