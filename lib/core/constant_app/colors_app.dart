
import 'package:flutter/material.dart';

class ColorsApp{
  static const Color primaryColor = Color(0xFFFFBB3B);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color lightGreyColor = Color(0xFFEEEEEE);
  static const Color darkGreyColor = Color(0xFF424242);
  static const Color goldColor = Color(0xFFFFD700);
  static const Color blueColor = Color(0xFF2196F3);
  static const Color greenColor = Color(0xFF4CAF50);
  static const Color redColor = Color(0xFFF44336);
  static const Color yellowColor = Color(0xFFFFEB3B);
  static const Color orangeColor = Color(0xFFFF9800);
  static const Color purpleColor = Color(0xFF9C27B0);

}
class CustomTeme{
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsApp.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.primaryColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: ColorsApp.primeryColor,
        backgroundColor: Colors.amber,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
  );
}
