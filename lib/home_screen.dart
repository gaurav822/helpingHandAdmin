import 'package:demoapp/accomodation_scren.dart';
import 'package:demoapp/dimensions.dart';
import 'package:demoapp/images.dart';
import 'package:demoapp/job_screen.dart';
import 'package:demoapp/line_chart_widget.dart';
import 'package:demoapp/payment_history_page.dart';
import 'package:demoapp/pie_chart_widget.dart';
import 'package:demoapp/responsive_helper.dart';
import 'package:demoapp/service_screen.dart';
import 'package:demoapp/spin_loader.dart';
import 'package:demoapp/styles.dart';
import 'package:demoapp/user_list_page.dart';
import 'package:demoapp/web_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/dashboard_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(DashboardController());
    loaderKey.currentState?.showLoader();
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Opacity(
            opacity: 0.4,
            child: Image.asset(
              Images.ic_back, // Your background image asset
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ResponsiveHelper.isDesktop(context)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(90),
                  child: WebAppBarWidget(tabController))
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
        )*/
          ,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                color: Colors.blue.withOpacity(0.8),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 0;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 0
                                ? BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                                EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Home",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 1;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 1
                                ? BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                            EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Users",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 2;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 2
                                ? BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                            EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Payment",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 3;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 3
                                ? BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                                EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Services",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 4;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 4
                                ? BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                                EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Jobs",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            tabController.index = 5;
                            setState(() {});
                          },
                          child: Container(
                            decoration: tabController.index == 5
                                ? BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))
                                : null,
                            width: double.infinity,
                            padding:
                                EdgeInsets.all(6).copyWith(left: 13, right: 13),
                            child: Text("Accommodation",
                                style: poppinsSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              if (tabController.index == 0)
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome, Test User",
                            style: poppinsBold.copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Thank you for being a part of Helping Hand.",
                            style: poppinsRegular.copyWith(fontSize: 15),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: cardWidget(6, 0,
                                                "Total Services", Images.ic_doc)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: cardWidget(
                                                5,
                                                1,
                                                "Today's News",
                                                Images.ic_today)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: cardWidget(
                                                10,
                                                2,
                                                "Document need to Approve",
                                                Images.ic_search)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: cardWidget(
                                                20,
                                                3,
                                                "Total Users",
                                                Images.ic_client)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white.withOpacity(0.5),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                            color: Colors.white.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.withOpacity(0.5),
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                ),
                                                padding: EdgeInsets.all(4),
                                                child: Text("Today",  style: poppinsRegular.copyWith(fontSize: 10, color: Colors.white),),
                                              ),

                                              Align(
                                                alignment: Alignment.center,
                                                  child: Image.asset(Images.ic_cloud, height: 60,)),
                                              Text(
                                                "23°C",
                                                style: poppinsSemiBold.copyWith(fontSize: 15),
                                              ),
                                              Text(
                                                "28°C - 36°C",
                                                style: poppinsRegular.copyWith(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),


                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(Images.ic_client, height: 30,),
                                          SizedBox(width: 10,),
                                          Text(
                                            "Student Orders",
                                            style: poppinsBold.copyWith(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(width: 130, height: 5, color: Colors.blue,),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    LineChartSample2(),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width/3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(Images.ic_client, height: 30,),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Detail Report",
                                        style: poppinsBold.copyWith(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(width: 130, height: 5, color: Colors.blue,),
                                SizedBox(
                                  height: 20,
                                ),

                                PieChartSample2(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (tabController.index == 1) UsersListPage(),
              if (tabController.index == 2) PaymentHistoryPage(),
              if (tabController.index == 3) ServiceListScreen(),
              if (tabController.index == 4)
                JobsScreen(() {
                  tabController.index = 0;
                  setState(() {});
                }),
              if (tabController.index == 5)
                AccommodationScreen(() {
                  tabController.index = 0;
                  setState(() {});
                }),
            ],
          ),
        )
      ],
    );
  }

  Widget cardWidget(int count, int index, String title, String image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Colors.white.withOpacity(0.3),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count.toString(),
                style: poppinsBold.copyWith(fontSize: 18),
              ),
              Image.asset(
                image,
                height: 30,
                width: 30,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: poppinsMedium.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}