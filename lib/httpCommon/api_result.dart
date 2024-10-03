// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:demoapp/constant/strings.dart';
import 'package:demoapp/httpCommon/error_model.dart';
import 'package:demoapp/httpCommon/http_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'api_result.freezed.dart';


@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required String error}) = Failure<T>;
}

class HandleAPI {
  static String handleAPIError(e) {
    try {
      if (e.toString().contains(
          "(OS Error: No address associated with hostname, errno = 7)")) {
        return MyStrings.nointernet;
      }
      return e.toString();
    } catch (e) {
      return MyStrings.somethingwentwrong;
    }
  }

  static String checkStatusCode(HttpResponse response) {
    if (response.data.toString().contains('errors')) {
      ErrorModel model = ErrorModel.fromJson(response.data);

      if (model == null) {
        return "1";
      } else {
        print("Display Alert dialog here.");
        return model.errors?[0].message ?? 'Something Went Wrong';
      }
    } else {
      return "1";
    }
  }

  static String checkStatusCodeMultipart(Response response) {
    if (response.body.toString().contains('error_message')) {
      ErrorModel model = ErrorModel.fromJson(json.decode(response.body));

      if (model == null) {
        return "1";
      } else {
        print("Display Alert dialog here.");
        return model.errors?[0].message ?? 'Something Went Wrong';
      }
    } else {
      return "1";
    }
  }
}
