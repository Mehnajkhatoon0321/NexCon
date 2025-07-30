import 'package:flutter/material.dart';
class  APIEndPoints {

  // demoUrl
  // static const String baseUrl = 'https://erp.studyhallfoundation.org/api/';
  // static const String baseUrlImage = 'https://demo.smartconference.org';
// live
//   static const String baseUrl = 'https://smartconference.in/sc/api/';
  static const String baseUrl = 'https://webgrade.in/sc/api/';
  static const String baseUrlImage = 'https://smartconference.in.org';
//   AuthFLow API

  static const String login = '${baseUrl}login';
  static const String conferenceDelegatesList = '${baseUrl}unit';
  static const String delegatesRegister = '${baseUrl}del_reg';



  //Organization Section
  static const String conferenceOrganizerList = '${baseUrl}conferenceList';
}