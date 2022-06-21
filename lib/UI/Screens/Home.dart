// ignore_for_file: prefer_const_constructors, avoid_print, prefer_final_fields

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digi_rentals/Models/add_shop_model.dart';
import 'package:digi_rentals/Models/categoriesModel.dart';
import 'package:digi_rentals/Models/user_model.dart';
import 'package:digi_rentals/Services/category_services.dart';
import 'package:digi_rentals/Services/product_services.dart';
import 'package:digi_rentals/Services/shop_services.dart';
import 'package:digi_rentals/Services/shop_user_services.dart';
import 'package:digi_rentals/Services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Models/product_Model.dart';
import '../../Models/shop_user_model.dart';
import '../../Utils/Colors.dart';
import '../../Utils/res.dart';
import '../Widgets/category_widget.dart';
import '../Widgets/product_widget.dart';
import '../Widgets/shop_card_widget.dart';
import 'CartSection/Cart_View_Screen.dart';
import 'ProductsSection/viewAll_products.dart';
import 'my_profile.dart';
import 'shop_details.dart';

class Home extends StatefulWidget {
  const Home(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryServices _categoryServices = CategoryServices();
  ProductServices _productServices = ProductServices();
  AddShopServices _shopServices = AddShopServices();
  ShopUserServices _userServicesRental = ShopUserServices();
  UserServices _userServicesuser = UserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: StreamProvider.value(
            value: _userServicesuser
                .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
            initialData: UserModel(),
            builder: (context, child) {
              UserModel model = context.watch<UserModel>();
              return Column(
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
                            InkWell(
                              onTap: () {
                                Get.to(MyProfileScreen());
                              },
                              child: Container(
                                child: Stack(
                                  children: [
                                    model.userImage == null
                                        ? CircleAvatar(
                                            radius: 25,
                                            backgroundImage:
                                                AssetImage(Res.personicon),
                                          )
                                        : CachedNetworkImage(
                                            height: 50,
                                            width: 50,
                                            imageBuilder: (context,
                                                    imageProvider) =>
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                            imageUrl:
                                                model.userImage.toString(),
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                SpinKitWave(
                                                    color: MyAppColors.appColor,
                                                    type:
                                                        SpinKitWaveType.start),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(model.fullName.toString(),
                                style: GoogleFonts.roboto(
                                    // fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(CartView());
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                                    color: MyAppColors.appColor, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("My Cart",
                                    style: GoogleFonts.roboto(
                                        // fontFamily: 'Gilroy',
                                        color: MyAppColors.appColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            ),
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
                                  hintText: "Search Products... ",
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
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 18),
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(
                  //             Res.easypaisa,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(
                  //             Res.mobileapplication,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(
                  //             Res.camera,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           decoration: const BoxDecoration(
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage("Assets/Rectangle 5831.png"))),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           decoration: const BoxDecoration(
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage("Assets/Rectangle 5831.png"))),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(Res.ourmotto),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(Res.ourmotto),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           height: 141,
                  //           width: 287,
                  //           child: SvgPicture.asset(Res.ourmotto),
                  //           decoration: const BoxDecoration(),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
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
                    height: 18,
                  ),
                  StreamProvider.value(
                      value: _categoryServices.streamCategories(),
                      initialData: [CategoriesModel()],
                      builder: (context, child) {
                        //     contactListDB = context.watch<List<EventModel>>();
                        List<CategoriesModel> list =
                            context.watch<List<CategoriesModel>>();
                        return list.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.only(top: 100.0),
                                child: Text("No Categories Available",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ))
                            : list[0].shopId == null
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: SpinKitWave(
                                          color: Colors.green,
                                          type: SpinKitWaveType.start),
                                    ),
                                  )
                                : Container(
                                    height: 90,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: list.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: categoryWidget(
                                              list[i].shopId.toString(),
                                              list[i].categoryId.toString(),
                                              list[i].categoryImage.toString(),
                                              list[i].categoryName.toString(),
                                            ),
                                          );
                                        }),
                                  );
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Products on Rent",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                //color: MyAppColors.appColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                        InkWell(
                          onTap: () {
                            Get.to(ViewAllProducts());
                          },
                          child: Text("View all",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamProvider.value(
                      value: _productServices.streamProducts(),
                      initialData: [ProductModel()],
                      builder: (context, child) {
                        //     contactListDB = context.watch<List<EventModel>>();
                        List<ProductModel> list =
                            context.watch<List<ProductModel>>();
                        return list.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.only(top: 100.0),
                                child: Text("No Product Available",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ))
                            : list[0].productId == null
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: SpinKitWave(
                                          color: Colors.green,
                                          type: SpinKitWaveType.start),
                                    ),
                                  )
                                : Container(
                                    height: 90,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: list.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ProductWidget(
                                              //  list[i].productId.toString(),
                                              list[i].categoryId.toString(),
                                              list[i].productName.toString(),
                                              list[i].productPrice.toString(),
                                              list[i]
                                                  .productquantity
                                                  .toString(),
                                              list[i].productDesc.toString(),
                                              list[i].productImage.toString(),
                                            ),
                                          );
                                        }),
                                  );
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rental Shops",
                            style: GoogleFonts.roboto(
                                // fontFamily: 'Gilroy',
                                //color: MyAppColors.appColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamProvider.value(
                      value: _shopServices.streamShops(),
                      initialData: [AddShopModel()],
                      builder: (context, child) {
                        //     contactListDB = context.watch<List<EventModel>>();
                        List<AddShopModel> list =
                            context.watch<List<AddShopModel>>();
                        return list.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.only(top: 100.0),
                                child: Text("No Past Event Available",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ))
                            : list[0].shopID == null
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: SpinKitWave(
                                          color: Colors.green,
                                          type: SpinKitWaveType.start),
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: list.length,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return StreamProvider.value(
                                          value: _userServicesRental
                                              .fetchUserRecord(
                                                  list[i].userID.toString()),
                                          initialData: ShopUserModel(),
                                          builder: (context, child) {
                                            ShopUserModel _userrentalModel =
                                                context.watch<ShopUserModel>();
                                            // return StreamProvider.value(
                                            //     value: _productServices
                                            //         .streamonlyProducts(
                                            //             list[i].userID.toString()),
                                            //     initialData: ProductModel(),
                                            //     builder: (context, child) {
                                            //       ProductModel _productmodel =
                                            //           context.watch<ProductModel>();
                                            return StreamProvider.value(
                                              value: _userServicesuser
                                                  .fetchUserRecord(list[i]
                                                      .userID
                                                      .toString()),
                                              initialData: UserModel(),
                                              builder: (context, child) {
                                                UserModel _useruserModel =
                                                    context.watch<UserModel>();

                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: ShopCardWidget(
                                                    //  list[i].productId.toString(),
                                                    list[i].shopName.toString(),
                                                    list[i].shopID.toString(),
                                                    _userrentalModel.fullName
                                                        .toString(),
                                                    _userrentalModel.userImage
                                                        .toString(),
                                                    _userrentalModel.userID
                                                        .toString(),
                                                    _useruserModel.userID
                                                        .toString(),
                                                    //  _productmodel.UserId.toString()

                                                    // list[i].productPrice.toString(),
                                                    // list[i].productquantity.toString(),
                                                    // list[i].productDesc.toString(),
                                                    // list[i].productImage.toString(),
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                    });
                        //    });
                      }),
                ],
              );
            }),
      ),
    ));
  }
}
