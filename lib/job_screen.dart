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

class JobsScreen extends StatefulWidget {
  final Function onSubmit;

  JobsScreen(this.onSubmit);

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final _jobTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _salaryController = TextEditingController();

  String? jobTitleError, descriptionError, locationError, salaryError;

  BaseBloc baseBloc = BaseBloc(
      repository: BaseRepository(
        dataSource: BaseDataSource(),
      ));



  // Job Title validation
  void _validateJobTitle(String value) {
    setState(() {
      if (value.isEmpty) {
        jobTitleError = 'Please enter a job title';
      } else {
        jobTitleError = null;
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

  // Location validation
  void _validateLocation(String value) {
    setState(() {
      if (value.isEmpty) {
        locationError = 'Please enter a location';
      } else {
        locationError = null;
      }
    });
  }

  // Salary validation
  void _validateSalary(String value) {
    setState(() {
      if (value.isEmpty) {
        salaryError = 'Please enter a salary';
      } else if (int.parse(value) == 0) {
        salaryError = 'Please enter a valid salary';
      } else {
        salaryError = null;
      }
    });
  }

  @override
  void dispose() {
    _jobTitleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _salaryController.dispose();
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
          return Expanded(
            child: Padding(
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
                            child: Column(
                              children: [

                                Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(Images.ic_job, height: 100,),
                                    )),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _jobTitleController,
                                  decoration: inputDecoration(jobTitleError, "Job Title"),
                                  onChanged: _validateJobTitle,
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _descriptionController,
                                  decoration:
                                  inputDecoration(descriptionError, "Description"),
                                  onChanged: _validateDescription,
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _locationController,
                                  decoration: inputDecoration(locationError, "Location"),
                                  onChanged: _validateLocation,
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _salaryController,
                                  decoration: inputDecoration(salaryError, "Salary"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(
                                          r'[0-9\s]'), // Allow only letters, numbers, and spaces
                                    ),
                                  ],
                                  onChanged: _validateSalary,
                                ),
                                SizedBox(height: 30),

                                CustomButtonWidget(
                                  isLoading: false,
                                  buttonText: "Post Job",
                                  onPressed: () { // Trigger validation on button press
                                    _validateJobTitle(_jobTitleController.text);
                                    _validateDescription(_descriptionController.text);
                                    _validateLocation(_locationController.text);
                                    _validateSalary(_salaryController.text);

                                    if (jobTitleError == null &&
                                        descriptionError == null &&
                                        locationError == null &&
                                        salaryError == null) {


                                      ///Call Post Job API here
                                      // baseBloc.add(PostJobEvent(title: _jobTitleController.text,
                                      // desc: _descriptionController.text,
                                      // location: _locationController.text,
                                      // salary: _salaryController.text));



                                      print("Job posted successfully!");
                                      widget.onSubmit();
                                    }},
                                ),
                              ],
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
