import 'dart:convert';
import 'dart:developer';

import 'package:final_project/Data/Models/home%20screen%20model.dart';
import 'package:final_project/Data/Models/images%20model.dart';
import 'package:final_project/Data/Models/inf%20screen%20model.dart';
import 'package:http/http.dart' as http;

class ApiCallClass {
  static String apiUrl =
      "https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b";

  // static Map<String, String>? myHeaders = {
  //   "Host": "<calculated when request is sent>",
  //   "User-Agent": "PostmanRuntime/2.42.0",
  //   "Accept": "*/*",
  //   "Accept-Encoding": "gzip,deflate,br",
  //   "Connection": "keep-alive",
  //};

  static homeScreenRequest(
      {required Function(HomeScreenModel) onSuccess,
      required Function(int error)onError})
  async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http
        .get(
      Uri.parse(apiUrl),
      headers: headers
    )
        .then((response) {
      if (response.statusCode == 200) {
        Map<String,dynamic> decoded={};
        decoded=json.decode(response.body);
        HomeScreenModel homeScreenModel=HomeScreenModel.fromJson(decoded);
        onSuccess(homeScreenModel);
        log("success api");}
      else{onError(response.statusCode);}

    });

  }
  static infScreenRequest(
      {required int id,required Function(InfScreenModel) onSuccess,
      required Function(int error)onError})
  async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http
        .get(
      Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
      headers: headers
    )
        .then((response) {
      if (response.statusCode == 200) {
        Map<String,dynamic> decoded={};
        decoded=json.decode(response.body);
        InfScreenModel infScreenModel=InfScreenModel.fromJson(decoded);
        onSuccess(infScreenModel);
        log("success api");}
      else{onError(response.statusCode);}

    });

  }
  static imagesRequest(
      {required int id,required Function(ImagesModel) onSuccess,
      required Function(int error)onError})
  async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http
        .get(
      Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
      headers: headers
    )
        .then((response) {
      if (response.statusCode == 200) {
        Map<String,dynamic> decoded={};
        decoded=json.decode(response.body);
        ImagesModel imagesModel=ImagesModel.fromJson(decoded);
        onSuccess(imagesModel);
        log("success api");}
      else{onError(response.statusCode);}

    });

  }

}
