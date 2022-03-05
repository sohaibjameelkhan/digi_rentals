// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:digi_rentals/UI/Screens/ManageOrders/active_orders.dart';
import 'package:digi_rentals/UI/Screens/ManageOrders/cancelled_orders.dart';
import 'package:digi_rentals/UI/Screens/ManageOrders/completed_orders.dart';

import 'package:digi_rentals/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyAppColors.whitecolor,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text("Manage Orders",
                    style: GoogleFonts.roboto(
                        // fontFamily: 'Gilroy',
                        color: MyAppColors.blackcolor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                SvgPicture.asset(Res.notificationicon)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: MyAppColors.Lightgrey,
            labelColor: MyAppColors.appColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: MyAppColors.appColor,
            tabs: [
              Tab(
                text: "Active(2)",
              ),
              Tab(text: "Completed(9)"),
              Tab(
                text: "Cancelled(2)",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveOrders(),
            CompletedOrders(),
            CancelledOrders(),
          ],
        ),
      ),
    );
  }
}
