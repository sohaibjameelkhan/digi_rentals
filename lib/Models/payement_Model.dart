// To parse this JSON data, do
//
//     final payementModel = payementModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PayementModel payementModelFromJson(String str) =>
    PayementModel.fromJson(json.decode(str));

String payementModelToJson(PayementModel data) =>
    json.encode(data.toJson(data.paymentID.toString()));

class PayementModel {
  PayementModel({
    this.userId,
    this.paymentID,
    this.payementAmount,

    //   this.paymentDate,
  });

  String? userId;
  String? paymentID;
  num? payementAmount;

  // Timestamp? paymentDate;

  factory PayementModel.fromJson(Map<String, dynamic> json) => PayementModel(
        userId: json["userID"],
        paymentID: json["paymentID"],
        payementAmount: json["PayementAmount"],
        //  paymentDate: json["paymentDate"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": userId,
        "paymentID": docID,
        "PayementAmount": payementAmount,
        // "paymentDate": paymentDate,
      };
}
