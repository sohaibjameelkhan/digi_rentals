// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:digi_rentals/Models/order_model.dart';
import 'package:digi_rentals/Services/order_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Colors.dart';
import '../../../res.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({Key? key}) : super(key: key);

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: _orderServices
            .streamMyOrders(FirebaseAuth.instance.currentUser!.uid),
        initialData: [OrderModel()],
        builder: (context, child) {
          List<OrderModel> _orderList = context.watch<List<OrderModel>>();
          return Scaffold(
              backgroundColor: MyAppColors.whitecolor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _orderList.length,
                        itemBuilder: (_, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                elevation: 6,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            child: SvgPicture.asset(
                                                Res.invitefriendbanner),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "\$" +
                                                      _orderList[i]
                                                          .totalBill
                                                          .toString(),
                                                  style: GoogleFonts.roboto(
                                                      // fontFamily: 'Gilroy',
                                                      color: MyAppColors
                                                          .blackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18)),
                                              Text(
                                                  "order description will be here ",
                                                  style: GoogleFonts.roboto(
                                                      // fontFamily: 'Gilroy',
                                                      color: MyAppColors
                                                          .blackcolor
                                                          .withOpacity(0.9),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                                _orderList[i]
                                                                    .user!
                                                                    .userImage
                                                                    .toString())
                                                            as ImageProvider),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            33)),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                child: Text(
                                                    _orderList[i]
                                                        .user!
                                                        .fullName
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                        // fontFamily: 'Gilroy',
                                                        color: MyAppColors
                                                            .blackcolor
                                                            .withOpacity(0.9),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                          Text("IN PROGRESS ",
                                              style: GoogleFonts.roboto(
                                                  // fontFamily: 'Gilroy',
                                                  color: MyAppColors.appColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text("Due in 1h 32min ",
                                              style: GoogleFonts.roboto(
                                                  // fontFamily: 'Gilroy',
                                                  color: MyAppColors.blackcolor
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ));
        });
  }
}
