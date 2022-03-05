import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_rentals/Models/user_model.dart';

import 'package:flutter/cupertino.dart';

class ExpertServices {
  ///Get Specific User Details
  Stream<UserModel> getUserDetails(String docID) {

    return FirebaseFirestore.instance
        .collection('expertsCollection')
        .doc(docID)
        .snapshots()
        .map((event) =>
        UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  ///Create User
  Future createUser(BuildContext context,
      {required UserModel model, required String uid}) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('expertsCollection').doc(uid);
    return await docRef.set(model.toJson(uid));
  }

  ///Edit Profile
  Future<void> editProfile(UserModel model) async {
    return await FirebaseFirestore.instance
        .collection('expertsCollection')
        .doc(model.docId)
        .update({
      'name': model.fullName.toString(),
      'profileImage': model.userImage.toString(

      )
    });
  }
}
