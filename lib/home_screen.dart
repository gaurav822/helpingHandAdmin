import 'package:demoapp/accomodation_scren.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/job_screen.dart';
import 'package:demoapp/payment_list.dart';
import 'package:demoapp/responsive_helper.dart';
import 'package:demoapp/styles.dart';
import 'package:demoapp/usersList.dart';
import 'package:demoapp/web_app_bar_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Opacity(
            opacity: 0.4,
            child: Image.asset(
              Images.ic_back,  // Your background image asset
              fit: BoxFit.cover,  // Cover the entire screen
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ResponsiveHelper.isDesktop(context)
              ? PreferredSize(
              preferredSize: const Size.fromHeight(120), child: WebAppBarWidget(_tabController))
              : null /*AppBar(
          title: Text("Home"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Service"),
              Tab(text: "Jobs"),
              Tab(text: "Accommodation"),
            ],
          ),
          actions: [IconButton(icon: Icon(Icons.account_circle), onPressed: () {})],
        )*/,
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ic_logo_icon, height: 80,),
                  const SizedBox(height: 15,),
                  Text("Welcome, Admin", style: poppinsBold.copyWith(
                      fontSize: 25
                  ),),
                  SizedBox(height: 15,),
                  Text("Thank you for being a part of Helping Hand.\nManage your services, connect with students, and provide them services.",
                    textAlign: TextAlign.center,
                    style: poppinsRegular.copyWith(
                      fontSize: 16,
                    ),),
                ],
              ),
              //Users list
             UsersList(),

              //Payment List
              PaymentListScreen(),
              JobsScreen((){
                _tabController.index = 0;
                setState(() {});
              }),
              AccommodationScreen((){
                _tabController.index = 0;
                setState(() {});
              }),
            ],
          ),
        )
      ],
    );
  }
}
