import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'light_theme_color.dart';
import 'loader_widget.dart';

class FullScreenLoader {

  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs barrierDismissible: false, // The dialog can't be dismissed by tapping outside it builder: (_) => PopScope (
      barrierDismissible: false,
      builder: (_) =>
          PopScope(
              canPop: false,
              child: Container(
                color: LightThemeColor.colorLightGrey,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 30,),
                    LoaderWidget(text: text)
                  ],
                ),
              )),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}