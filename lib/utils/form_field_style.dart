// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/font_text_Style.dart';






class FormFieldStyle {





  static InputDecoration defaultemailDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: AppColors.formFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: AppColors.boarderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: AppColors.boarderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: AppColors.formFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: AppColors.formFieldBorderColour,
          )),
      hintText: Constants.emailHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
  );










  static InputDecoration defaultPasswordInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    hintText: Constants.passwordHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.formFieldBackColour,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
  );



  static InputDecoration defaultAddressInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(28),
        ),
        borderSide: BorderSide(
          color: AppColors.formFieldBorderColour,
        )),
    hintText: Constants.addressHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.formFieldBackColour,
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  );

  static InputDecoration searchDecoration = InputDecoration(
    hintText: 'Search',
    hintStyle: FTextStyle.formhintTxtStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(23.0),
      borderSide: const BorderSide(
          color: AppColors.appSky, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(23.0),
      borderSide: const BorderSide(
          color: AppColors.appSky, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(23.0),
      borderSide: const BorderSide(
          color: AppColors.appSky, width: 1.0),
    ),
    contentPadding: const EdgeInsets.symmetric(
        vertical: 13.0, horizontal: 18.0),

    fillColor: Colors.grey[100],
    filled: true,
  );










  static InputDecoration dropDown=InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color:   AppColors.formFieldBorderColour),
      borderRadius: BorderRadius.circular(28),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.appSky),
      borderRadius: BorderRadius.circular(28),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      borderSide: BorderSide(color:AppColors.formFieldBackColour),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      borderSide: BorderSide(color: AppColors.formFieldBackColour),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.formFieldBorderColour),
      borderRadius: BorderRadius.circular(28),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    filled: true,
    fillColor: AppColors.formFieldBackColour,
    hintText: "Select Product Category",
    hintStyle:FTextStyle.formhintTxtStyle,
    errorStyle: TextStyle(color: AppColors.FormFielderrorColour),
  );
}
