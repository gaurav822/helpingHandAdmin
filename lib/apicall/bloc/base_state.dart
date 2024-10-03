part of 'base_bloc.dart';

class BaseInitial extends BaseState {}

class BaseState {
  final ApiCallState? apiCallState;


  BaseState({
    this.apiCallState = ApiCallState.busy,
  
  });

  List<Object> get props => [
    apiCallState!,

  ];

  BaseState copyWith({
    ApiCallState? apiCallState,


  }) {
    return BaseState(
      apiCallState: apiCallState ?? this.apiCallState,
    );
  }
}


