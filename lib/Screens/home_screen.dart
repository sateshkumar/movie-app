import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Common/const.dart';
import 'package:movie_app/Models/movie_listining.dart';
import 'package:movie_app/Network/api.dart';
import 'package:movie_app/Screens/movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   ApiAuth().getMovieListining();
      // }),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text(
          'Movies List',
          style: GoogleFonts.lobster(letterSpacing: 1, fontSize: 22.sp),
        ),
      ),
      body: FutureBuilder<Movielistining>(
          future: ApiAuth().getMovieListining(),
          builder:
              (BuildContext context, AsyncSnapshot<Movielistining> snapshot) {
            print("here ${snapshot.data}");
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                  //shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.data!.movies!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.52),
                  itemBuilder: (BuildContext ctx, index) {
                    String imageUrl = snapshot
                        .data!.data!.movies![index].thumbnail!
                        .replaceAll('thumb/', 'medium/');

                    var data = snapshot.data!.data!.movies![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                    name: snapshot
                                        .data!.data!.movies![index].name
                                        .toString(),
                                    movieId: snapshot
                                        .data!.data!.movies![index].id
                                        .toString())));
                      },
                      child: Column(
                        children: [
                          Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5),
                              width: double.infinity,
                              height: 300.h,
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
                            data!.year!.isEmpty
                                ? Container()
                                : Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 20.h,
                                    child: Center(
                                      child: Text(
                                        "Year : " + data.year.toString(),
                                        style: GoogleFonts.courgette(
                                            fontSize: 22.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                          ]),
                          data!.name!.isEmpty
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(left: 20.w),
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    data.name.toString(),
                                    style: GoogleFonts.teko(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
