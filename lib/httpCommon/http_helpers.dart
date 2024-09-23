import 'dart:convert';
import 'dart:developer';

import 'package:demoapp/httpCommon/base_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum HttpRequestNames { GET, POST, PATCH, PUT, DELETE }


class ErrorHelpers {
  static String generateErrorMessage(BaseErrors error, BuildContext context) {
    return error.errorMessage ?? "";
  }
}



void apiPrint({
  String url = "",
  String headers = "",
  String request = "",
  String methodtype = "",
}) {
  log("┌───────────────────────────────────────────────────────────────────────────────────────────────────────");
  log("URL : "+url);
  log("HEADER : "+headers);
  log("REQUEST :  ($methodtype) "+request);
  log("START_TIME---------${DateTime.now().toString()}");
}


void apiPrintResponse({
  String endPoint = "",
  int statusCode = 0,
  String responseBody = "",
  String methodtype = "",
}) {
  log('RESPONSE :  ($methodtype - $endPoint) $statusCode: $responseBody');
  log("END_TIME---------${DateTime.now().toString()}");
  log("└───────────────────────────────────────────────────────────────────────────────────────────────────────");
}