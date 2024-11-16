// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/constant.dart';
import 'package:smart_conference/utils/font_text_Style.dart';





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










  static InputDecoration dropDown=InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color:   AppColors.formFieldBorderColour),
      borderRadius: BorderRadius.circular(28),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColour),
      borderRadius: BorderRadius.circular(28),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      borderSide: BorderSide(color: Colors.red),
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
    errorStyle: TextStyle(color: Colors.red),
  );
}
