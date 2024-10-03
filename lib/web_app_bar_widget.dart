import 'package:demoapp/dimensions.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/login_screen.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/styles.dart';
import 'package:flutter/material.dart';

class WebAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  TabController tabController;

  WebAppBarWidget(this.tabController, {Key? key}) : super(key: key);

  @override
  State<WebAppBarWidget> createState() => _WebAppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _WebAppBarWidgetState extends State<WebAppBarWidget> {
  String? chooseLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.10),
          blurRadius: 20,
          offset: const Offset(0, 10),
        )
      ]),
      child: Container(
        color: Theme.of(context).cardColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  widget.tabController.index = 0;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    Images.ic_logo_name,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                      width: 30,
                      child: Icon(Icons.notifications_active, color: Colors.blue,)),
                  SizedBox(width: 10,),
                  Image.asset(
                    Images.ic_user,
                    height: 40,
                  ),
                  SizedBox(width: 10,),
                  PopupMenuButton<int>(
                    icon: Image.asset(
                      Images.ic_menu,
                      height: 80,
                    ),
                    // Icon to open popup
                    onSelected: (value) {
                      // Handle the selected option here
                      if (value == 1) {
                      } else if (value == 2) {
                        callNextScreenAndClearStack(context, LoginScreen());
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 1, // Option value
                          child: Text('Profile'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Logout'),
                        ),
                      ];
                    },
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Size get preferredSize => const Size(double.maxFinite, 160);
}
