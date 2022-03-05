// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_final_fields

import 'dart:io';

import 'package:digi_rentals/UI/Screens/AuthSection/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../Models/user_model.dart';
import '../../../Services/auth_services.dart';
import '../../../Services/user_services.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/res.dart';
import '../../Widgets/appbutton.dart';
import '../../../Helpers/BottomNavBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/auth_textfield_widget.dart';
import 'otp_verfication.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  AuthServices authServices = AuthServices();
  UserServices userServices = UserServices();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  File? _file;
  bool isChecked = false;

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final spinkit = SpinKitWave(
    color: Colors.white,
    size: 50.0,
  );
  bool isLoadingspin = false;

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: SpinKitWave(
        color: MyAppColors.appColor,
      ),
      child: Scaffold(
        backgroundColor: MyAppColors.bgcolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(Res.logogreen)],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Create Account",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Enter fill the info below to continue",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 30),
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: SvgPicture.asset(
                            Res.personicon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: MyAppColors.bgtextfieldcolor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned.fill(
                        top: -50,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                                onTap: () {
                                  //  getFile();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(Res.cameraicon),
                                )),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyAppColors.appColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Full Name",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      visible: isvisible,
                      isPasswordField: false,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.personicon,
                      showpassoricon: false,
                      maxlength: 20,
                      keyboardtype: TextInputType.text,
                      authcontroller: _fullNameController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "John Doe",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Phone Number",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      visible: isvisible,
                      isPasswordField: false,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.phonenumbericon,
                      maxlength: 20,
                      showpassoricon: false,
                      keyboardtype: TextInputType.text,
                      authcontroller: _fullNameController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "JohnDoe@gmail.com",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Email",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      visible: isvisible,
                      isPasswordField: false,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.emailicon,
                      maxlength: 20,
                      keyboardtype: TextInputType.text,
                      authcontroller: _emailController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "JohnDoe@gmail.com",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Address",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      visible: isvisible,
                      isPasswordField: false,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.locationicon,
                      maxlength: 20,
                      showpassoricon: false,
                      keyboardtype: TextInputType.text,
                      authcontroller: _fullNameController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "Enter your Address",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Password",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      showpassoricon: true,
                      visible: isvisible,
                      isPasswordField: true,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.passwordicon,
                      maxlength: 20,
                      keyboardtype: TextInputType.text,
                      authcontroller: _passwordController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "John Doe",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: authtextfieldWidget(
                      headingtext: "Confirm Password",
                      onPwdTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      showpassoricon: true,
                      visible: isvisible,
                      isPasswordField: true,
                      suffixIcon2: Icons.visibility_off,
                      suffixIcon: Res.passwordicon,
                      maxlength: 20,
                      keyboardtype: TextInputType.text,
                      authcontroller: _fullNameController,
                      showImage: false,
                      showsuffix: false,
                      suffixImage: Res.personicon,
                      text: "Enter your password again",
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter more than 6 digit password";
                        } else if (value.length < 6)
                          return "Please Enter atleast 6 password";
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("I agree to",
                                  style: GoogleFonts.roboto(
                                      // fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              Text(" Terms and Condition ",
                                  style: GoogleFonts.roboto(
                                      color: MyAppColors.appColor,
                                      decoration: TextDecoration.underline,

                                      // fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              Text("and",
                                  style: GoogleFonts.roboto(
                                      // fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("Privacy Policy",
                              style: GoogleFonts.roboto(
                                  // fontFamily: 'Gilroy',
                                  color: MyAppColors.appColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AppButton(
                  onTap: () {
                    _signUpUser(context);
                    //  Get.to(OtpVerfication());
                  },
                  text: "Continue",
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account",
                        style: GoogleFonts.roboto(
                            // fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(" Login",
                          style: GoogleFonts.roboto(
                              // fontFamily: 'Gilroy',
                              color: MyAppColors.appColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUpUser(BuildContext context) async {
    makeLoadingTrue();

    try {
      ///This will allow user to register in firebase
      return await authServices
          .registerUser(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        userServices.createUser(UserModel(
          fullName: _fullNameController.text,
          userEmail: _emailController.text,
          //   isapprove: false,
          //    password: _passwordController.text,
          //  userID: getUserID()
        ));
        makeLoadingFalse();
      }).then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OtpVerfication()));
        return Fluttertoast.showToast(msg: "Registered SucessFully");
      });
    } on FirebaseAuthException catch (e) {
      makeLoadingFalse();
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('ALert!'),
            content: Text(e.message.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  makeLoadingFalse();
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    }
  }
}

//   Future getFile() async {
//     _file = await FilePicker.getFile();
//     setState(() {
//       if (_file != null) {
//         _file = File(_file!.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
// }
