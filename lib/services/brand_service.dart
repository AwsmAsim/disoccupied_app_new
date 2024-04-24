import 'dart:convert';

import 'package:disoccupied_app/exception/response_exception.dart';
import 'package:disoccupied_app/exception/unknown_internal_exception.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:http/http.dart' as http;

import '../model/Brand.dart';
import '../model/alternative.dart';


class BrandService{

  Future<Brand> getBrandData(String brandName) async {

    try{
      http.Response response = await http.get(
        Uri.parse(TextConstants.endpointDomain + "brand_api/" + brandName),
        headers: {
              "X-API-Key": "x4uB9pRw3YsF8aGz"
        }
      );

      if(response.statusCode != 200){
        if(response.statusCode >= 400 && response.statusCode < 500){
          ResponseException("CLIENT_EXCEPTION");
        }else if(response.statusCode >= 500){
          ResponseException("SERVER_EXCEPTION");
        }else{
          ResponseException("UNKNOWN_EXCEPTION");
        }
      }

      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return Brand.fromJson(responseJson);
    }catch(exception){
      if(exception.runtimeType == ResponseException){
        print("A response exception has occured");
        print(exception.toString());
        throw exception;
      }else{ 
        print("Unknown exception occured");
        print(exception.toString());
        throw UnknownInternalExceptiomn();
      }
    }

  }

  Future<List<String>> getRecommendations(String brandName) async {


    try{
      if(brandName == null || brandName.isEmpty) brandName = "a";
      http.Response response = await http.get(
          Uri.parse(TextConstants.endpointDomain + "autocomplete/?search_text=" + brandName + "&count=10"),
          headers: {
            "X-API-Key": "x4uB9pRw3YsF8aGz"
          }
      );

      if(response.statusCode != 200){
        if(response.statusCode >= 400 && response.statusCode < 500){
          ResponseException("CLIENT_EXCEPTION");
        }else if(response.statusCode >= 500){
          ResponseException("SERVER_EXCEPTION");
        }else{
          ResponseException("UNKNOWN_EXCEPTION");
        }
      }

      List<dynamic> responseJson = jsonDecode(response.body)["suggestions"];
      List<String> brands = [];
      responseJson.forEach((element) {brands.add(element);});
      return brands;

    }catch(exception){
      if(exception.runtimeType == ResponseException){
        print("A response exception has occured");
        print(exception.toString());
        throw exception;
      }else{
        print("Unknown exception occured");
        print(exception.toString());
        throw UnknownInternalExceptiomn();
      }
    }

  }

  Future<List<Alternative>> getBrandAlternatives(String brandName) async{
    try{

      http.Response response = await http.get(
          Uri.parse(TextConstants.endpointDomain + "brand_alternative_api/" + brandName),
          headers: {
            "X-API-Key": "x4uB9pRw3YsF8aGz"
          }
      );

      if(response.statusCode != 200){
        if(response.statusCode >= 400 && response.statusCode < 500){
          ResponseException("CLIENT_EXCEPTION");
        }else if(response.statusCode >= 500){
          ResponseException("SERVER_EXCEPTION");
        }else{
          ResponseException("UNKNOWN_EXCEPTION");
        }
      }

      Map<String, dynamic> responseJson = jsonDecode(response.body);
      print(responseJson);
      return extractAlternativeFromMap(responseJson['alternative_images']);

    }catch(exception){
      if(exception.runtimeType == ResponseException){
        print("A response exception has occured");
        print(exception.toString());
        throw exception;
      }else{
        print("Unknown exception occured");
        print(exception.toString());
        throw UnknownInternalExceptiomn();
      }
    }
  }

  List<Alternative> extractAlternativeFromMap(Map<String, dynamic> data){

    List<Alternative> toReturn = [];
    
    data.forEach((key, value) {
      Alternative alternative = Alternative(
          name: key,
          level: value["level"],
          market: (value['market'] as List<dynamic>).cast<String>(),
        imageUrl: value["image_url"]
      );
      toReturn.add(alternative);
    });
    
    return toReturn;
  }



}