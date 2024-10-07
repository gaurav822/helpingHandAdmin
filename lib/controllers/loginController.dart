import 'package:demoapp/repository/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../spin_loader.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<String> emailAndPasswordSignIn(String emailAddress,String password, GlobalKey<LoaderState> loaderKey) async {
    try {
      isLoading(true); // Start l
    String response = await AuthenticationRepository.instance.signInWithEmailPass(email: emailAddress,password:password);
    isLoading(false); // Start l
    return response;
      //
    } catch (e) {
      isLoading(false); // Start l
      Exception(e);
    }
    return "failed";
  }
}