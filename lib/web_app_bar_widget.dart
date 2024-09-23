import 'package:demoapp/dimensions.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/login_screen.dart';
import 'package:demoapp/my_cm.dart';
import 'package:demoapp/styles.dart';
import 'package:demoapp/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0,10),
          )
        ]
      ),
      child: Container(color: Theme.of(context).cardColor,
        child: Center(
          child: SizedBox(
              width: 1250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                Row(
                  children: [

                    GestureDetector(
                      onTap: (){
                        widget.tabController.index = 0;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset(Images.ic_logo_name, ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    InkWell(
                      onTap: () {
                        widget.tabController.index=0;
                        setState(() {});
                      },
                      child: Container(
                        decoration: widget.tabController.index==0?BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ):null,
                        padding: EdgeInsets.all(6).copyWith(left: 13, right: 13),
                        child: Text("Home", style:
                        poppinsSemiBold.copyWith(color: widget.tabController.index==0?Colors.white:Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeLarge)),
                      ),
                    ),

                    const SizedBox(width: 20),

                    InkWell(
                      onTap: () {
                        widget.tabController.index=1;
                        setState(() {});
                      },
                      child: Container(
                        decoration: widget.tabController.index==1?BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ):null,
                        padding: EdgeInsets.all(6).copyWith(left: 13, right: 13),
                        child: Text("Users", style:
                        poppinsSemiBold.copyWith(color: widget.tabController.index==1?Colors.white:Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeLarge)),
                      ),
                    ),
                    const SizedBox(width: 20),

                    InkWell(
                      onTap: () {
                        widget.tabController.index=2;
                        setState(() {});
                      },
                      child: Container(
                        decoration: widget.tabController.index==2?BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ):null,
                        padding: EdgeInsets.all(6).copyWith(left: 13, right: 13),
                        child: Text("Payments", style:
                        poppinsSemiBold.copyWith(color: widget.tabController.index==2?Colors.white:Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeLarge)),
                      ),
                    ),
                    const SizedBox(width: 20),

                    InkWell(
                      onTap: () {
                        widget.tabController.index=3;
                        setState(() {});
                      },
                      child: Container(
                        decoration: widget.tabController.index==3?BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ):null,
                        padding: EdgeInsets.all(6).copyWith(left: 13, right: 13),
                        child: Text("Jobs", style:
                        poppinsSemiBold.copyWith(color: widget.tabController.index==3?Colors.white:Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeLarge)),
                      ),
                    ),
                    const SizedBox(width: 20),

                    InkWell(
                      onTap: () {
                        widget.tabController.index=4;
                        setState(() {});
                      },
                      child: Container(
                        decoration: widget.tabController.index==4?BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ):null,
                        padding: EdgeInsets.all(6).copyWith(left: 13, right: 13),
                        child: Text("Accommodation", style:
                        poppinsSemiBold.copyWith(color: widget.tabController.index==4?Colors.white:Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeLarge)),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),


          PopupMenuButton<int>(
            icon: Image.asset(Images.ic_user, height: 100,),  // Icon to open popup
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
                  value: 1,  // Option value
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Logout'),
                ),
              ];
            },
          ),

              ])
          ),
        ),
      ),
    );
  }

  Size get preferredSize => const Size(double.maxFinite, 160);
}

