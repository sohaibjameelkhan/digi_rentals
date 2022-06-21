// ignore_for_file: prefer_const_constructors

import 'package:digi_rentals/Providers/cart_provider.dart';
import 'package:digi_rentals/Providers/user_provider.dart';
import 'package:digi_rentals/UI/Screens/ChatSection/user_provider.dart';
import 'package:digi_rentals/UI/Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'UI/Screens/AuthSection/CreateAccount.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Stripe.publishableKey =
      "pk_test_51InnRlIdxBCh70xgnPUTMKldbyysNjJNLe2uEhm9K11SnVDbfZMtyxafZXevuQV1TbWqlkulNwxN3KTfi4iCADcq00yJ1Hj6vG";
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => UserProviderCart()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
