import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/authFlow/splash_screen.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/connectivity_service.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/shared_preference.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Prefs.init();
//
//   runApp(const MyApp());
//
// }
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 840),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (BuildContext context, Widget? child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//           home: SplashScreen(), // Handle the case when not logged in if needed
//         );
//       },
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NexCon',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            primaryColor: AppColors.appSkyDark,
            fontFamily: 'Montserrat',
            textTheme: TextTheme(
              headlineLarge: FTextStyle.heading,
              bodyLarge: FTextStyle.body,
              titleMedium: FTextStyle.subheading,
              bodySmall: FTextStyle.label,
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.formFieldBackColour,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.formFieldBorderColour),
              ),
              hintStyle: FTextStyle.formhintTxtStyle,
              errorStyle: FTextStyle.formErrorTxtStyle,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appSky,
                foregroundColor: Colors.white,
                textStyle: FTextStyle.loginBtnStyle,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
