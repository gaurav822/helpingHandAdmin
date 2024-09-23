import 'package:bloc/bloc.dart';
import 'package:demoapp/apicall/data/base_repository.dart';
import 'package:demoapp/apicall/model/success_model.dart';
import 'package:demoapp/my_cm.dart';

import 'package:meta/meta.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final BaseRepository _repository;

  BaseBloc({required BaseRepository repository})
      : _repository = repository,
        super(BaseInitial()) {

    on<LoginUserEvent>(
          (event, emit) => logingAPIEvent(event, emit),
    );
    on<RegisterEvent>(
          (event, emit) => registerEvent(event, emit),
    );
    on<PostJobEvent>(
          (event, emit) => postJobEvent(event, emit),
    );
   on<AccomodationEvent>(
          (event, emit) => accomodationEvent(event, emit),
    );

  }


  logingAPIEvent(LoginUserEvent event, emit) async {
    emit(state.copyWith(apiCallState: ApiCallState.busy));
    final result = await _repository.logInUser(event.strEmail!, event.strPassword!);
    result.when(success: (SuccessModel response) {
      // add(DocumentListAPIEvent(event.taskId, 0, fromDelete: true));
      emit(state.copyWith(apiCallState: ApiCallState.success));
      emit(state.copyWith(apiCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(apiCallState: ApiCallState.failure));
    });
  }


  registerEvent(RegisterEvent event, emit) async {
    emit(state.copyWith(apiCallState: ApiCallState.busy));
    final result = await _repository.registerUser(event.strEmail!, event.strPassword!, event.strName!);
    result.when(success: (SuccessModel response) {
      // add(DocumentListAPIEvent(event.taskId, 0, fromDelete: true));
      emit(state.copyWith(apiCallState: ApiCallState.success));
      emit(state.copyWith(apiCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(apiCallState: ApiCallState.failure));
    });
  }


  postJobEvent(PostJobEvent event, emit) async {
    emit(state.copyWith(apiCallState: ApiCallState.busy));
    final result = await _repository.postJob(event.title!, event.desc!, event.location!, event.salary!);
    result.when(success: (SuccessModel response) {
      // add(DocumentListAPIEvent(event.taskId, 0, fromDelete: true));
      emit(state.copyWith(apiCallState: ApiCallState.success));
      emit(state.copyWith(apiCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(apiCallState: ApiCallState.failure));
    });
  }


  accomodationEvent(AccomodationEvent event, emit) async {
    emit(state.copyWith(apiCallState: ApiCallState.busy));
    final result = await _repository.accomodationEvent(event.desc!, event.location!, event.rent!);
    result.when(success: (SuccessModel response) {
      // add(DocumentListAPIEvent(event.taskId, 0, fromDelete: true));
      emit(state.copyWith(apiCallState: ApiCallState.success));
      emit(state.copyWith(apiCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(apiCallState: ApiCallState.failure));
    });
  }




}
