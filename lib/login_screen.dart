import 'package:demoapp/apicall/bloc/base_bloc.dart';
import 'package:demoapp/apicall/data/base_datasource.dart';
import 'package:demoapp/apicall/data/base_repository.dart';
import 'package:demoapp/controllers/loginController.dart';
import 'package:demoapp/custom_button_widget.dart';
import 'package:demoapp/dimensions.dart';
import 'package:demoapp/home_screen.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/register_screen.dart';
import 'package:demoapp/responsive_helper.dart';
import 'package:demoapp/spin_loader.dart';
import 'package:demoapp/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
export 'package:flutter_bloc/flutter_bloc.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  bool rememberMe = false;

  BaseBloc baseBloc = BaseBloc(
      repository: BaseRepository(
        dataSource: BaseDataSource(),
      ));


  // Email validation function
  void _validateEmail(String value) {
    setState(() {
      // Regular expression for email validation
      String pattern =
          r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(pattern);

      if (value.isEmpty) {
        emailError = 'Please enter a valid email';
      } else if (!regex.hasMatch(value!)) {
        emailError = 'Enter a valid email';
      } else {
        emailError = null;
      }
    });
  }

  // Password validation function
  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty || value.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      } else {
        passwordError = null;
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    double width = MediaQuery.of(context).size.width;
    return BlocListener<BaseBloc, BaseState>(
      bloc: baseBloc,
      listener: (context, state) {
        if(state.apiCallState==ApiCallState.success){
          ///Handle redirection Here
        }
      },
      child: BlocBuilder<BaseBloc, BaseState>(
        bloc: baseBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: ResponsiveHelper.isDesktop(context) ? null : AppBar(),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.ic_back,),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context)
                          ? 0
                          : Dimensions.paddingSizeLarge),
                      child: Center(
                          child: Container(
                            width: ResponsiveHelper.isMobile() ? width : 700,
                            padding: !ResponsiveHelper.isMobile()
                                ? const EdgeInsets.symmetric(horizontal: 100, vertical: 50)
                                : width > 700
                                ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
                                : null,
                            decoration: !ResponsiveHelper.isMobile()
                                ? BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ],
                            )
                                : null,
                            child: Obx(()=>
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(Images.ic_user, height: 100,),
                                      )),
                                  //SizedBox(height: 20),

                                  Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: 35),

                                  TextFormField(
                                    controller: _emailController,
                                    decoration: inputDecoration(emailError, "Email"),
                                    onChanged: _validateEmail,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: inputDecoration(passwordError, "Password"),
                                    onChanged: _validatePassword,
                                  ),

                                  SizedBox(
                                    height: 25,
                                  ),

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            rememberMe = !rememberMe;
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions.paddingSizeExtraSmall),
                                            child: Row(children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: rememberMe
                                                      ? Theme.of(context).primaryColor
                                                      : Theme.of(context).cardColor,
                                                  border: Border.all(
                                                      color: rememberMe
                                                          ? Colors.transparent
                                                          : Theme.of(context).primaryColor, width: 2),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                                child: rememberMe
                                                    ? const Icon(Icons.done,
                                                    color: Colors.white, size: 17)
                                                    : const SizedBox.shrink(),
                                              ),
                                              const SizedBox(
                                                  width: Dimensions.paddingSizeSmall),
                                              Text(
                                                "Remember Me",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                    fontSize:
                                                    Dimensions.fontSizeDefault,
                                                    color: Theme.of(context)
                                                        .hintColor
                                                        .withOpacity(0.6)),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(height: Dimensions.paddingSizeSmall),

                                  // for login button

                                  controller.isLoading.value? Center(child: const CircularProgressIndicator()):CustomButtonWidget(
                                    isLoading: false,
                                    buttonText: "Login",
                                    onPressed: () async{
                                      // Trigger validation manually if needed
                                      _validateEmail(_emailController.text);
                                      _validatePassword(_passwordController.text);

                                      if (emailError == null && passwordError == null) {
                                        // Process login logic here if both fields are valid
                                       String message = await controller.emailAndPasswordSignIn(_emailController.text.trim(),_passwordController.text.trim(),loaderKey);
                                       if(message=="success"){
                                         Fluttertoast.showToast(msg: "Login Successful",toastLength:Toast.LENGTH_LONG);
                                         callNextScreenAndClearStack(context, HomeScreen());
                                       }
                                       else{
                                         Fluttertoast.showToast(msg: "Error Login, Please confirm credentials",toastLength:Toast.LENGTH_LONG);
                                       }
                                      }
                                    },
                                  ),
                                  const SizedBox(height: Dimensions.paddingSizeLarge),

                                  // for create an account
                                  InkWell(
                                    onTap: () {

                                      ///Call Login API here
                                      // baseBloc.add(LoginUserEvent(strEmail: _emailController.text, strPassword: _passwordController.text));


                                      callNextScreen(context, RegisterScreen());
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Create Account",
                                                style: poppinsRegular.copyWith(
                                                    fontSize: Dimensions.fontSizeSmall,
                                                    color: Theme.of(context)
                                                        .hintColor
                                                        .withOpacity(0.6)),
                                              ),
                                              const SizedBox(
                                                  width: Dimensions.paddingSizeExtraSmall),
                                              Text(
                                                "Register",
                                                style: poppinsMedium.copyWith(
                                                    fontSize: Dimensions.fontSizeDefault,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ])),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

inputDecoration(String? emailError, String s) {
  return InputDecoration(
    labelText: s,
    errorText: emailError,
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
          width: 1.5,
          color: Theme.of(GlobalVariable.navState.currentContext!)
              .hintColor
              .withOpacity(0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
          width: 1.5,
          color: Theme.of(GlobalVariable.navState.currentContext!)
              .primaryColor
              .withOpacity(0.6)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.0),
      borderSide: BorderSide(
          width: 1.5,
          color: Theme.of(GlobalVariable.navState.currentContext!)
              .hintColor
              .withOpacity(0.6)),
    ),
    isDense: true,
    hintText: s,
    fillColor: Theme.of(GlobalVariable.navState.currentContext!).cardColor,
    filled: true,
    prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
  );
}
