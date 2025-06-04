import 'package:ecomerce_test/controllers/auth_controller.dart';
import 'package:ecomerce_test/views/login_screen.dart';
import 'package:ecomerce_test/views/product_listing_screen.dart';
import 'package:ecomerce_test/views/status_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/connection_controller.dart';
import 'controllers/product_controller.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',

      home: SplashScreen(),
       routes: {
        '/login': (_) => LoginScreen(),
        '/home': (_) => const ProductListingScreen(),
      },
    );
  }
}

