import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';

class ShopReviews extends StatelessWidget {
  const ShopReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 50,
                              width: 50,

                              decoration:  BoxDecoration(
                               borderRadius: BorderRadius.circular(13),
                                border: Border.all(width: 1.5,color: MyAppColors.appColor),

                               // color: MyAppColors.appColor,
                                image: DecorationImage(
                                    fit: BoxFit.cover,

                                    image: AssetImage(
                                        "Assets/Ellipse 1.png")),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}
