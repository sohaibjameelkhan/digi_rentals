// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';
import 'ServiceMan.dart';

class Home extends StatelessWidget {
  const Home(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23)),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                              Res.personicon,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        decoration: const BoxDecoration(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("John Doe",
                          style: GoogleFonts.roboto(
                              // fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700,
                              fontSize: 24)),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border:
                            Border.all(color: MyAppColors.appColor, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Immediatly",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: MyAppColors.appColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                        Text("Order",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: MyAppColors.appColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 52,
                      width: 295,
                      decoration: BoxDecoration(
                          color: MyAppColors.bgtextfieldcolor,
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 25, top: 15),
                            hintText: "Search by category type ",
                            hintStyle: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                Res.searchicon,
                                height: 2,
                                width: 2,
                              ),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: MyAppColors.appColor,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                        child: SvgPicture.asset(Res.filter),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Container(
                      height: 141,
                      width: 287,
                      child: SvgPicture.asset(
                        Res.invitefriendbanner,
                        fit: BoxFit.cover,
                      ),
                      decoration: const BoxDecoration(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("Assets/Rectangle 5831.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("Assets/Rectangle 5831.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("Assets/Rectangle 5831.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("Assets/Rectangle 5831.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      child: SvgPicture.asset(Res.ourmotto),
                      decoration: const BoxDecoration(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      child: SvgPicture.asset(Res.ourmotto),
                      decoration: const BoxDecoration(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 141,
                      width: 287,
                      child: SvgPicture.asset(Res.ourmotto),
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
                      style: GoogleFonts.roboto(
                          // fontFamily: 'Gilroy',
                          //color: MyAppColors.appColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  Text("View all",
                      style: GoogleFonts.roboto(
                          // fontFamily: 'Gilroy',
                          color: MyAppColors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(Res.electrical),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Tech",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                //color: MyAppColors.appColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Construction",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Cloths",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Wedding",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Books",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Property",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SvgPicture.asset(Res.cleaning),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("House",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  //color: MyAppColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 1),
                    child: Container(
                      height: 285,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(ServiceManProfile());
                                          },
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: SvgPicture.asset(
                                                Res.personicon,
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                            decoration: const BoxDecoration(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Tech",
                                                style: GoogleFonts.roboto(
                                                    // fontFamily: 'Gilroy',
                                                    color: MyAppColors.blue,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16)),
                                            Row(
                                              children: [
                                                Text("Dial Criage (5+ Years)",
                                                    style: GoogleFonts.roboto(
                                                        // fontFamily: 'Gilroy',
                                                        //color: MyAppColors.blue,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                      color: MyAppColors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40)),
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                        Res.tickmark),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 15,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 0.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text("Mo",
                                                    style: GoogleFonts.roboto(
                                                        // fontFamily: 'Gilroy',
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Tu",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Wed",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Th",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Fr",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Sa",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text("Su",
                                                      style: GoogleFonts.roboto(
                                                          // fontFamily: 'Gilroy',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.favorite_outline_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                color: MyAppColors.blue,
                                height: 0.2,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("DSLR",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("\$10-35\$",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Speakers",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("\$10-35\$",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Lights",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                  Text("\$10-35\$",
                                      style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                          // color: Colors.grey,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17)),
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
      ),
    ));
  }
}

//
