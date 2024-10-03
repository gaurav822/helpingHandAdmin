import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// GlobalKey to control the loader
final GlobalKey<LoaderState> loaderKey = GlobalKey<LoaderState>();

class Loader extends StatefulWidget {
  Loader({Key? key}) : super(key: loaderKey);

  @override
  LoaderState createState() => LoaderState();
}

class LoaderState extends State<Loader> {
  bool _isLoading = false;

  // Method to show the loader
  void showLoader() {
    setState(() {
      _isLoading = true;
    });
  }

  // Method to hide the loader
  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Center the loader in the screen
    return _isLoading
        ? Container(
      color: Colors.black.withOpacity(0.5), // Optional: darken background
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    )
        : SizedBox.shrink(); // Return nothing when not loading
  }
}
