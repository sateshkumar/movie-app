import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Common/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      setState(() {
        loading = false;
      });
      Navigator.restorablePushNamedAndRemoveUntil(
          context, homeScreenRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ImageIcon(
              AssetImage('assets/images/movie.png'),
              size: 150,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              'Movie App',
              style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Container()
        ],
      ),
    );
  }
}
