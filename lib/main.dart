import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Common/const.dart';
import 'package:movie_app/Utils/routing.dart' as route;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Staguard Guardian',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        onGenerateRoute: route.Router.generateRoute,
        initialRoute: splashScreenRoute,
      ),
    );
    // MaterialApp(
    //   title: 'Movie App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    // );
  }
}
