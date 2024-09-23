


import 'package:flutter/material.dart';

void pop(BuildContext context) {
  Navigator.of(context).pop();
}

void pop1(BuildContext context, dynamic arg) {
  Navigator.pop(context, arg);
}

// Push to next screen
void callNextScreen(BuildContext context, Object nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => nextScreen as Widget,
        settings: RouteSettings(name: nextScreen.runtimeType.toString())),
  );
}

Future callNextScreenWithResult(BuildContext context, Object nextScreen) async {
  var action = await Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => nextScreen as Widget,
        settings: RouteSettings(name: nextScreen.runtimeType.toString())),
  );
  return action;
}

void callNextScreenFromBottom(BuildContext context, Object nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => nextScreen as Widget,
        settings: RouteSettings(name: nextScreen.runtimeType.toString())),
  );
}

void callNextScreenFinishOld(BuildContext context, Object nextScreen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
        builder: (context) => nextScreen as Widget,
        settings: RouteSettings(name: nextScreen.runtimeType.toString())),
        (route) => false,
  );
}

void callNextScreenAndClearStack(BuildContext context, Object nextScreen) {
  Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextScreen as Widget,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        settings: RouteSettings(name: nextScreen.runtimeType.toString())),
        (_) => false, //3 is count of your pages you want to pop
  );
}
//
//
// Widget commonField(Widget child){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(ResponsiveHelper.isDesktop(context)? 20 : 12),
//       boxShadow: [
//         BoxShadow(
//           color: widget.isElevation ? Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]! : Colors.transparent,
//           spreadRadius: 0.5,
//           blurRadius: 0.5,
//           // changes position of shadow
//         ),
//       ],
//     ),
//   );
// }

class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  // static final GlobalKey<ScaffoldMessengerState> navState =
  //     GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

enum ApiCallState { none, busy, success, failure }
