import 'dart:convert';

import 'package:axact2/constants/strings.dart';
import 'package:axact2/models/pixabay.dart';
import 'package:http/http.dart' as http;
class API_Manager{
  Future<Welcome> getVideos() async {
    var client = http.Client();
    var welcomeModel = null;
    try{
    var response =await client.get(Strings.video_url);
    if(response.statusCode ==200){
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      return welcomeModel=Welcome.fromJson(jsonMap);
    }}
    catch(Exception){

    return welcomeModel;
  }}
}