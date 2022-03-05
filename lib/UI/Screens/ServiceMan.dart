// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:digi_rentals/UI/Screens/single_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';

class ServiceManProfile extends StatelessWidget {
  const ServiceManProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: MyAppColors.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child:
                              Center(child: SvgPicture.asset(Res.arrowbackgreen)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline_outlined),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              child: SvgPicture.asset(Res.personicon)),

                          // Positioned.fill(
                          //   top: -50,
                          //   child: Align(
                          //     alignment: Alignment.bottomRight,
                          //     child: Container(
                          //       height: 40,
                          //       width: 40,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: MyAppColors.Lightgrey,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text("Dial Criage (5+ Years)",
                              style: GoogleFonts.roboto(
                                  //fontFamily: 'Gilroy',
                                  color: MyAppColors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21)),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: MyAppColors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: SvgPicture.asset(Res.tickmark),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 23,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(" 4.9 (206 Reviews)",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Res.hourclockicon),
                        const SizedBox(
                          width: 4,
                        ),
                        Text("2 Hours",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Res.jobsdone),
                        const SizedBox(
                          width: 4,
                        ),
                        Text("200 Jobs",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(SingleChat());
                      },
                      child: Container(
                        height: 42,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Send Message",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: 125,
                      decoration: BoxDecoration(
                          color: MyAppColors.appColor,
                          border:
                              Border.all(width: 2, color: MyAppColors.appColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Pay",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: MyAppColors.whitecolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyAppColors.blue),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text("Services",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 110,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.appColor)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(Res.lawncare),
                                  SvgPicture.asset(Res.detailsicon)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Electrical",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("\$05-\$30",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              //color: MyAppColors.appColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text("Availibilty",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Monday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Tuesday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Wednesday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Thursday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Friday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 95,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Saturday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7, color: MyAppColors.appColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text("Sunday",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text("Languages",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Res.languages),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("English",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      ],
                    ),
                    Text("Native",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Res.languages),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Spanish",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      ],
                    ),
                    Text("Fluent",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Res.languages),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Italian",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      ],
                    ),
                    Text("Conversational",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Reviews",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            //color: MyAppColors.appColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    Text("Reviews",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            color: MyAppColors.blue,
                            //decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 17)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 160,
                            width: 330,
                            decoration: BoxDecoration(
                                color: MyAppColors.bgcolor,
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "Assets/Ellipse 1.png")),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Maratha Sans",
                                                style: GoogleFonts.roboto(
                                                    // fontFamily: 'Gilroy',
                                                    //color: MyAppColors.blue,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              itemSize: 22,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            Text(" 4.9",
                                                style: GoogleFonts.roboto(
                                                    // fontFamily: 'Gilroy',
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Lore ipsum Lore ipsum Lore ipsum Lore Lore",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Lore ipsum Lore ipsum Lore ipsum Lore Lore",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Lore ipsum Lore ipsum Lore ipsum Lore Lore",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
