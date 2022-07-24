import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Common/const.dart';
import 'package:movie_app/Models/movie_description.dart';
import 'package:movie_app/Network/api.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;
  final String name;
  const MovieDetailScreen({Key? key, required this.movieId, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          '$name',
          style: GoogleFonts.lobster(letterSpacing: 1, fontSize: 22.sp),
        ),
      ),
      body: FutureBuilder<MovieDescriptionModel>(
          future: ApiAuth().getMovieDetail(movieId),
          builder: (BuildContext context,
              AsyncSnapshot<MovieDescriptionModel> snapshot) {
            print("here ${snapshot.data}");
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              String imageUrl = snapshot.data!.data!.movie!.thumbnail!
                  .replaceAll('thumb/', 'medium/');
              var data = snapshot.data!.data!.movie!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 300.h,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: imageUrl.length == 0
                                ? Container(
                                    color: Colors.grey,
                                  )
                                : Image.network(
                                    imageUrl.toString(),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          child: Text(
                            "Year : " + data.year.toString(),
                            style: GoogleFonts.courgette(
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    data!.name!.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(top: 10.h, left: 20.w),
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.left,
                              "Title : " + data.name.toString(),
                              style: GoogleFonts.teko(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                    data!.director!.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(
                                top: 10.h, left: 20.w, bottom: 10.h),
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.left,
                              "Director : " + data.director.toString(),
                              style: GoogleFonts.teko(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                    data!.mainStar!.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(
                                top: 10.h, left: 20.w, bottom: 10.h),
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.left,
                              "Main Star : " + data.mainStar.toString(),
                              style: GoogleFonts.teko(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                    data!.director!.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(
                                top: 10.h, left: 20.w, bottom: 10.h),
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.left,
                              "Director : " + data.director.toString(),
                              style: GoogleFonts.teko(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                    data!.description!.isEmpty
                        ? Container()
                        : Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              data.description.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.courgette(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                    data.genres!.length == 0
                        ? Container()
                        : Container(
                            child: Text(
                              'Genres',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.teko(
                                  fontSize: 22.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                    data.genres!.length == 0
                        ? Container()
                        : Container(
                            height: 140.h,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: false,
                                padding: EdgeInsets.zero,
                                itemCount: data.genres!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      data.genres![index].toString(),
                                      style: GoogleFonts.courgette(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }),
                          ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
