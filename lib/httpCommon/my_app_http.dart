// ignore_for_file: unused_local_variable, null_argument_to_non_null_type, duplicate_ignore
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demoapp/constant/apiconstants.dart';
import 'package:demoapp/constant/strings.dart';
import 'package:demoapp/httpCommon/api_result.dart';
import 'package:demoapp/httpCommon/http_helpers.dart';
import 'package:demoapp/httpCommon/http_response.dart';
import 'package:demoapp/my_cm.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import 'package:path/path.dart' as path;


class HttpActions {
  HttpActions();

  Future<HttpResponse?> refreshTokenMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      // print("header - $headers");
      final enCodedData = jsonEncode(data);

      apiPrint(
        url: Uri.parse(URLS.baseUrl + url).toString(),
        headers: jsonEncode(headers),
        request: jsonEncode(data),
        methodtype: "POST",
      );

      http.Response response = await http.post(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);

      apiPrintResponse(
        methodtype: "POST",
        endPoint: url,
        responseBody: response.body,
        statusCode: response.statusCode,
      );

      if (!isAuthenticated(response.statusCode)) {
        try {
          String enCodedStr = utf8.decode(response.bodyBytes);
          print(response.statusCode.toString());
          log(response.body.toString());
          HttpResponse resp = HttpResponse(response.statusCode);
          if (enCodedStr.isNotEmpty) {
            resp.data = jsonDecode(utf8.decode(response.bodyBytes));
          }
          return resp;
        } catch (e) {
          return Future.error(MyStrings.somethingwentwrong);
        }
      } else {

      }
    } else {
      // var result = await Navigator.push(
      //   GlobalVariable.navState.currentContext!,
      //   MaterialPageRoute(builder: (context) => NoInternetScreen(onTap: (){
      //     postMethod(url, headers: headers, data: data);
      //   },)),
      // );
      // return postMethod(url, headers: headers, data: data);
    }
    return null;
  }

  Future<HttpResponse?> postMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      final enCodedData = jsonEncode(data);

      apiPrint(
        url: Uri.parse(URLS.baseUrl + url).toString(),
        headers: jsonEncode(headers),
        request: jsonEncode(data),
        methodtype: "POST",
      );

      http.Response response = await http.post(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);

      apiPrintResponse(
        methodtype: "POST",
        endPoint: url,
        responseBody: response.body,
        statusCode: response.statusCode,
      );

      if (!isAuthenticated(response.statusCode)) {
        try {
          String enCodedStr = utf8.decode(response.bodyBytes);
          print(response.statusCode.toString());
          log(response.body.toString());
          HttpResponse resp = HttpResponse(response.statusCode);
          if (enCodedStr.isNotEmpty) {
            resp.data = jsonDecode(utf8.decode(response.bodyBytes));
          }
          return resp;
        } catch (e) {
          return Future.error(MyStrings.somethingwentwrong);
        }
      } else {

      }
    } else {

    }
    return null;
  }

  Future<HttpResponse?> getMethod(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParam,
      bool? isGoogleAPI}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      String queryParamStr = "";
      if (queryParam != null) {
        queryParam.forEach((key, value) {
          if (queryParamStr.isEmpty) {
            queryParamStr += "?$key=$value";
          } else {
            queryParamStr += "&$key=$value";
          }
        });
      }
      String finalEndPoint = isGoogleAPI == true ? url : URLS.baseUrl + url;
      if (queryParamStr.isNotEmpty) {
        finalEndPoint += queryParamStr;
      }
      apiPrint(
        url: finalEndPoint.toString(),
        headers: jsonEncode(headers),
        request: "",
        methodtype: "GET",
      );
      http.Response response =
          await http.get(Uri.parse(finalEndPoint), headers: headers);

      apiPrintResponse(
        methodtype: "GET",
        endPoint: finalEndPoint,
        responseBody: response.body,
        statusCode: response.statusCode,
      );

      if (!isAuthenticated(response.statusCode)) {
        try {
          log(response.statusCode.toString());
          log(response.body.toString());
          String enCodedStr = utf8.decode(response.bodyBytes);
          HttpResponse resp = HttpResponse(response.statusCode);
          if (enCodedStr.isNotEmpty) {
            resp.data = jsonDecode(utf8.decode(response.bodyBytes));
          }
          return resp;
        } catch (e) {
          return Future.error(MyStrings.somethingwentwrong);
        }
      } else {
      }
    } else {

    }
    return null;
  }

  bool isAuthenticated(int statusCode) {
    try {
      if (statusCode == 401) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }

    //return false;
  }


  //API Call with multipart

  Future<HttpClientResponse> fileUploadMultipartWithProcess(String url,
      Map<String, dynamic> body, List<String> filePaths, List<String> fileKeys,
      {Function(int sentBytes, int totalBytes)?
          onUploadProgressCallback}) async {
    final httpClient = HttpClient();
    final request = await httpClient.postUrl(Uri.parse(URLS.baseUrl + url));
    int byteCount = 0;

    List<http.MultipartFile> newImageList = <http.MultipartFile>[];
    for (int i = 0; i < filePaths.length; i++) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        fileKeys[i],
        filePaths[i].toString(),
      );
      newImageList.add(multipartFile);
    }
    var requestMultipart =
        http.MultipartRequest("POST", Uri.parse(URLS.baseUrl + url));
    requestMultipart.files.addAll(newImageList);
    for (var entry in body.entries) {
      requestMultipart.fields[entry.key] = entry.value.toString();
    }
    Map<String, String> header = await getMultipartSessionData({});
    requestMultipart.headers.addAll(header);

    var msStream = requestMultipart.finalize();
    var totalByteLength = requestMultipart.contentLength;
    request.contentLength = totalByteLength;
    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader] ?? "");
    request.headers.set(HttpHeaders.authorizationHeader,
        requestMultipart.headers[HttpHeaders.authorizationHeader] ?? "");

    request.headers.set('DEVICE-TYPE', Platform.isAndroid ? "Android" : 'iOS');
    request.headers.set('DEVICE-ID', "deviceId");
    request.headers.set('USER-ID', 'id'
        // userResponseData != null ? userResponseData?.id.toString() ?? "" : ""
        );

    Stream<List<int>> streamUpload = msStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;
          if (onUploadProgressCallback != null) {
            onUploadProgressCallback(byteCount, totalByteLength);
          }
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();

          /// UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload).timeout(const Duration(hours: 1),
        onTimeout: () {
      // ignore: null_argument_to_non_null_type
      return Future<HttpClientResponse>.value(null);
    });
    final httpResponse =
        await request.close().timeout(const Duration(hours: 1), onTimeout: () {
      // ignore: null_argument_to_non_null_type
      return Future<HttpClientResponse>.value(null);
    });
    var statusCode = httpResponse.statusCode;
    print("statusCodestatusCodestatusCodestatusCodestatusCode");
    print(statusCode.toString());

    if (statusCode ~/ 100 != 2) {
      throw Exception(
          '${MyStrings.somethingwentwrong} : ${httpResponse.statusCode}');
    } else {
      return httpResponse;
    }
  }


  Future<void> download(String url,
      {required Function(int totalBytes, int receivedBytes) onDownloadProgress,
      required Function(List<int> totalBytes) onDownloadDone}) async {
    final streamedRequest = http.StreamedRequest("GET", Uri.parse(url));
    streamedRequest.headers.addAll(await getSessionData({}));
    var totalLength = streamedRequest.contentLength;
    Stream.value("")
        // Transform the string-stream to a byte stream (List<int>)
        .transform(utf8.encoder)
        // Start reading the stream in chunks, submitting them to the streamedRequest for upload
        .listen((chunk) {
      streamedRequest.sink.add(chunk);
    }, onDone: () {
      streamedRequest.sink.close();
    });

    int _total = 0, _received = 0;
    final List<int> _bytes = [];

    http.StreamedResponse _response = await http.Client().send(streamedRequest);

    _response.stream.listen((value) {
      _bytes.addAll(value);
      _received += value.length;
      onDownloadProgress(
        _total,
        _received,
      );
    }, onDone: () {
      onDownloadDone(_bytes);
    });
  }

  Future<Map<String, String>> getSessionData(
    Map<String, String> headers,
  ) async {
    // LoginResponseData? sessionData = await getUserData();
    // sessionData = await getUserData();

    String? accessToken = "";
    String? deviceId = "";



    headers["Content-Type"] = "application/json";
    // print("MY_TOKEN----$accessToken");
    if (accessToken?.isNotEmpty == true) {
      headers["Authorization"] = "Bearer ${accessToken}";
    }
    // headers['APP-VERSION'] = appVersion;
    headers['device-type'] = Platform.isAndroid ? "Android" : 'iOS';
    headers['DEVICE-ID'] = deviceId??"";
    // headers['USER-ID'] = 'id';
    // headers['x-api-key'] = 'eDa0EVpCf73Uxeti1JmKk1cgvWyyZu4D7eEQnKbi'; //PROD
    // headers['workspace-id'] = '65ea734b-d4a0-415e-9c4d-446dc076dac8'; //PROD
    // headers['workspace-id'] = '19bd910d-7683-4dc8-9117-08292a596099'; //STAGING
    headers['workspace-id'] = '24df4d84-95d2-45b3-b3ea-e5371b3e067b'; //DEV
    //userResponseData != null ? userResponseData?.id.toString() ?? "" : "";
    return headers;
  }

  Future<Map<String, String>> getMultipartSessionData(
      Map<String, String> headers) async {


    String? accessToken = "";
    String? deviceId = "";



    headers["Content-Type"] = "multipart/form-data";
    if (accessToken?.isNotEmpty == true) {
      headers["Authorization"] = "Bearer ${accessToken}";
    }
    // headers['x-api-key'] = 'eDa0EVpCf73Uxeti1JmKk1cgvWyyZu4D7eEQnKbi'; //PROD
    // headers['workspace-id'] = '65ea734b-d4a0-415e-9c4d-446dc076dac8'; //PROD
    // headers['workspace-id'] = '19bd910d-7683-4dc8-9117-08292a596099'; //STAGING
    headers['workspace-id'] = '24df4d84-95d2-45b3-b3ea-e5371b3e067b'; //DEV
    // headers['APP-VERSION'] = appVersion;
    headers['DEVICE-TYPE'] = Platform.isAndroid ? "Android" : 'iOS';
    headers['DEVICE-ID'] = deviceId??"";
    // headers['USER-ID'] = '';
    // userResponseData != null ? userResponseData?.id.toString() ?? "" : "";
    return headers;
  }

  Future<ConnectivityResult> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult;
  }
}

ApiResult<T> checkResponseStatusCode<T>(
    HttpResponse result, dynamic responseData) {
  if (result.statusCode == 200 ||
      result.statusCode == 201 ||
      result.statusCode == 204) {
    return ApiResult.success(data: responseData as T);
  } else if (result.statusCode == 422) {
    return ApiResult.failure(
        error: (result.data['statusCode'] ?? result.data['status'].toString())
                    .toString() ??
            HandleAPI.checkStatusCode(result));
  }

  ///Creator - Update due date more then requested then give alert dialog
  else if (result.statusCode == 400 && result.data['status'] == 1028) {
    return ApiResult.success(data: responseData as T);
  }

  else if (result.statusCode == 400 || result.statusCode == 401 || result.statusCode == 404) {
    return ApiResult.failure(
        error:
                (result.data['statusCode'] ?? result.data['status'].toString())
                    .toString() ??
            result.data['errors'] ??
            result.data['message']);
  } else if (result.statusCode == 500) {
    return ApiResult.failure(
        error:
                (result.data['statusCode'] ?? result.data['status'].toString())
                    .toString() ??
            result.data);
  } else {
    return const ApiResult.failure(error: MyStrings.somethingwentwrong);
  }
}
