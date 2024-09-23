import 'package:demoapp/apicall/bloc/base_bloc.dart';
import 'package:demoapp/apicall/data/base_datasource.dart';
import 'package:demoapp/apicall/data/base_repository.dart';
import 'package:demoapp/custom_button_widget.dart';
import 'package:demoapp/dimensions.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/login_screen.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccommodationScreen extends StatefulWidget {
  final Function onSubmit;
  AccommodationScreen(this.onSubmit);
  @override
  _AccommodationScreenState createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  final _locationController = TextEditingController();
  final _rentController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? locationError, rentError, descriptionError;

  BaseBloc baseBloc = BaseBloc(
      repository: BaseRepository(
        dataSource: BaseDataSource(),
      ));



  // Location validation
  void _validateLocation(String value) {
    setState(() {
      if (value.isEmpty) {
        locationError = 'Please enter the location';
      } else {
        locationError = null;
      }
    });
  }

  // Rent validation
  void _validateRent(String value) {
    setState(() {
      if (value.isEmpty ) {
        rentError = 'Please enter a rent amount';
      } else if (int.parse(value)==0) {
        rentError = 'Please enter a valid rent amount';
      } else {
        rentError = null;
      }
    });
  }

  // Description validation
  void _validateDescription(String value) {
    setState(() {
      if (value.isEmpty) {
        descriptionError = 'Please enter a description';
      } else {
        descriptionError = null;
      }
    });
  }

  @override
  void dispose() {
    _locationController.dispose();
    _rentController.dispose();
    _descriptionController.dispose();
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
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [

                                    Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(Images.ic_accom, height: 100,),
                                        )),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      controller: _locationController,
                                      decoration: inputDecoration(locationError, "Location"),
                                      onChanged: _validateLocation,
                                    ),
                                    SizedBox(height: 15),

                                    TextFormField(
                                      controller: _rentController,

                                      decoration: inputDecoration(rentError, "Rent"),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9\s]'), // Allow only letters, numbers, and spaces
                                        ),
                                      ],
                                      onChanged: _validateRent,
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      controller: _descriptionController,
                                      decoration: inputDecoration(descriptionError, "Description"),
                                      onChanged: _validateDescription,
                                    ),
                                    SizedBox(height: 30),


                                    CustomButtonWidget(
                                      isLoading: false,
                                      buttonText: "Post Accommodation",
                                      onPressed: () {
                                        // Manually validate the fields if needed
                                        _validateLocation(_locationController.text);
                                        _validateRent(_rentController.text);
                                        _validateDescription(_descriptionController.text);

                                        if (locationError == null &&
                                            rentError == null &&
                                            descriptionError == null) {

                                          ///Call Accomodation API here
                                          // baseBloc.add(AccomodationEvent(
                                          // desc: _descriptionController.text,
                                          // location: _locationController.text,
                                          // rent: _rentController.text));


                                          print("Accommodation submitted successfully!");
                                          widget.onSubmit();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
