import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clom/pages/SignIn.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
   Timer(Duration(seconds: 3),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => SignIn())));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
             Color.fromARGB(255, 27, 143, 186),
              Color.fromARGB(255, 198, 9, 135),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(fontSize: 46, color: Colors.white,fontFamily: "Billabong"),
                ),
              ),
            ),
            Text(
              "All rights reserved",
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
