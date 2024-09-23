import 'package:demoapp/apicall/bloc/base_bloc.dart';
import 'package:demoapp/apicall/data/base_datasource.dart';
import 'package:demoapp/apicall/data/base_repository.dart';
import 'package:demoapp/custom_button_widget.dart';
import 'package:demoapp/dimensions.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/login_screen.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/responsive_helper.dart';
import 'package:demoapp/styles.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool rememberMe = false;
  bool click = false;

  BaseBloc baseBloc = BaseBloc(
      repository: BaseRepository(
        dataSource: BaseDataSource(),
      ));



  String? firstNameError,
      lastNameError,
      emailError,
      passwordError,
      confirmPasswordError;

  // First Name validation
  void _validateFirstName(String value) {
    setState(() {
      if (value.isEmpty) {
        firstNameError = 'Please enter your first name';
      } else {
        firstNameError = null;
      }
    });
  }

  // Last Name validation
  void _validateLastName(String value) {
    setState(() {
      if (value.isEmpty) {
        lastNameError = 'Please enter your last name';
      } else {
        lastNameError = null;
      }
    });
  }

  // Email validation
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

  // Password validation
  void _validatePassword(String value) {
    setState(() {
      if (value.length < 6) {
        passwordError = 'Password must be at least 6 characters long';
      } else {
        passwordError = null;
      }
    });
  }

  // Confirm Password validation
  void _validateConfirmPassword(String value) {
    setState(() {
      if (value != _passwordController.text) {
        confirmPasswordError = 'Passwords do not match';
      } else {
        confirmPasswordError = null;
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(Images.ic_user, height: 100,),
                                      )),
                                  //SizedBox(height: 20),

                                  Center(
                                      child: Text(
                                        "Create Account",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: 35),

                                  TextFormField(
                                    controller: _firstNameController,
                                    decoration:
                                    inputDecoration(firstNameError, "First Name"),
                                    onChanged: _validateFirstName,
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _lastNameController,
                                    decoration: inputDecoration(lastNameError, "Last Name"),
                                    onChanged: _validateLastName,
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: inputDecoration(emailError, "Email"),
                                    onChanged: _validateEmail,
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: inputDecoration(passwordError, "Password"),
                                    obscureText: true,
                                    onChanged: _validatePassword,
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    decoration: inputDecoration(
                                        confirmPasswordError, "Confirm Password"),
                                    obscureText: true,
                                    onChanged: _validateConfirmPassword,
                                  ),
                                  const SizedBox(height: 25),

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            rememberMe = !rememberMe;

                                            if(click && !rememberMe){
                                              click = false;

                                            }
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
                                                          : (click)?Colors.red:Theme.of(context).primaryColor, width: 2),
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
                                                "I agree to the terms and conditions",
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
                                  CustomButtonWidget(
                                    isLoading: false,
                                    buttonText: "Register",
                                    onPressed: () {
                                      click = true;
                                      // Manually validate fields if needed
                                      _validateFirstName(_firstNameController.text);
                                      _validateLastName(_lastNameController.text);
                                      _validateEmail(_emailController.text);
                                      _validatePassword(_passwordController.text);
                                      _validateConfirmPassword(
                                          _confirmPasswordController.text);

                                      if (firstNameError == null &&
                                          lastNameError == null &&
                                          emailError == null &&
                                          passwordError == null &&
                                          confirmPasswordError == null) {
                                        // Process registration logic here
                                        if(rememberMe){


                                          ///Call Register API here
                                          // baseBloc.add(RegisterEvent(strEmail: _emailController.text, strPassword: _passwordController.text));


                                          print("Registration successful!");
                                          pop(context);

                                        }

                                      }
                                    },
                                  ),

                                  InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pushNamed(RouteHelper.getCreateAccount());
                                      pop(context);
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Already have an account?",
                                                style: poppinsRegular.copyWith(
                                                    fontSize: Dimensions.fontSizeSmall,
                                                    color: Theme.of(context)
                                                        .hintColor
                                                        .withOpacity(0.6)),
                                              ),
                                              const SizedBox(
                                                  width: Dimensions.paddingSizeExtraSmall),
                                              Text(
                                                "Login",
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
                    SizedBox(height: 20,),
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
