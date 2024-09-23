import 'package:demoapp/apicall/data/base_datasource.dart';
import 'package:demoapp/apicall/model/success_model.dart';
import 'package:demoapp/httpCommon/api_result.dart';
import 'package:demoapp/httpCommon/my_app_http.dart';


class BaseRepository {
  BaseRepository({
    required BaseDataSource dataSource,
  }) : _profilePageDataSource = dataSource;

  final BaseDataSource _profilePageDataSource;
  /* *
Commented By Prashant Dabhi
Date: 31-05-2023
  - get response and byfergate it according to status code
  * */


  Future<ApiResult<SuccessModel>> logInUser(
      String strEmail, String strPassword) async {
    final result = await _profilePageDataSource.doLogIn(strEmail, strPassword);
    SuccessModel responseData = SuccessModel.fromJson(result!.data);
    return checkResponseStatusCode<SuccessModel>(result, responseData);
  }

  Future<ApiResult<SuccessModel>> registerUser(
      String strEmail, String strPassword, String name) async {
    final result = await _profilePageDataSource.doRegister(strEmail, strPassword, name);
    SuccessModel responseData = SuccessModel.fromJson(result!.data);
    return checkResponseStatusCode<SuccessModel>(result, responseData);
  }

  Future<ApiResult<SuccessModel>> postJob(
      String title, String desc, String location, String salary) async {
    final result = await _profilePageDataSource.postJob( title,  desc,  location,  salary);
    SuccessModel responseData = SuccessModel.fromJson(result!.data);
    return checkResponseStatusCode<SuccessModel>(result, responseData);
  }

  Future<ApiResult<SuccessModel>> accomodationEvent(
      String desc, String location, String rent) async {
    final result = await _profilePageDataSource.accomodationEvent(  desc,  location,  rent);
    SuccessModel responseData = SuccessModel.fromJson(result!.data);
    return checkResponseStatusCode<SuccessModel>(result, responseData);
  }


}
