part of 'base_bloc.dart';

@immutable
abstract class BaseEvent {}

//This event is use for log in API.
class LoginUserEvent extends BaseEvent {
  final String? strEmail;
  final String? strPassword;
  LoginUserEvent({this.strEmail, this.strPassword});
}


//This event is use for log in API.
class RegisterEvent extends BaseEvent {
  final String? strName;
  final String? strEmail;
  final String? strPassword;
  RegisterEvent({this.strName, this.strEmail, this.strPassword});
}


//This event is use for log in API.
class PostJobEvent extends BaseEvent {
  final String? title;
  final String? desc;
  final String? location;
  final String? salary;
  PostJobEvent({this.title, this.desc, this.location, this.salary});
}

//This event is use for log in API.
class AccomodationEvent extends BaseEvent {
  final String? desc;
  final String? location;
  final String? rent;
  AccomodationEvent({this.desc, this.location, this.rent});
}
