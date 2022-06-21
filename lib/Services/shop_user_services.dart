import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_rentals/Models/shop_user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../Models/user_model.dart';

class ShopUserServices {
  ///Create User
  Future createUser(ShopUserModel shopUserModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(shopUserModel.userID);
    return await docRef.set(shopUserModel.toJson(docRef.id));
  }

  ///Fetch User Record
  Stream<ShopUserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(userID)
        .snapshots()
        .map((userData) => ShopUserModel.fromJson(userData.data()!));
  }

  ///Update user record with Image

  Future updateUserDetailswithImage(ShopUserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      //"firstName": userModel.firstName,
      // "userNumber": userModel.userNumber,
      "userImage": userModel.userImage,
    }, SetOptions(merge: true));
  }

  ///Update user record with Image

  Future updateUserDetailsWithoutImage(ShopUserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      //  "firstName": userModel.firstName,
      //  "userNumber": userModel.userNumber,
      // "userImage": userModel.userImage,
    }, SetOptions(merge: true));
  }
}
