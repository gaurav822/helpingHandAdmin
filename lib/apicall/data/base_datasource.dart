import 'package:demoapp/constant/apiconstants.dart';
import 'package:demoapp/httpCommon/http_response.dart';
import 'package:demoapp/httpCommon/my_app_http.dart';

import 'package:path/path.dart' as path;


class BaseDataSource extends HttpActions {
  BaseDataSource();
  /* *
  Commented By Prashant Dabhi
  Date: 31-05-2023
  - call API using this Fnctions
  * */



  Future<HttpResponse?> doLogIn(String strEmail, String strPassword) async {
    final response = await postMethod(URLS.logIn,
        data: {"email": strEmail, 'password': strPassword});
    return response;
  }

  Future<HttpResponse?> doRegister(String strEmail, String strPassword, String name) async {
    final response = await postMethod(URLS.register,
        data: {"name":name, "email": strEmail, 'password': strPassword});
    return response;
  }


  Future<HttpResponse?> postJob(String title, String desc, String location, String salary) async {
    final response = await postMethod(URLS.register,
        data: {"title":title, "desc": desc, 'location': location, 'salary':salary});
    return response;
  }

  Future<HttpResponse?> accomodationEvent(String desc, String location, String rent) async {
    final response = await postMethod(URLS.register,
        data: {"desc": desc, 'location': location, 'salary':rent});
    return response;
  }



}
