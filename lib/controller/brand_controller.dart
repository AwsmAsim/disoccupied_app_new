import 'package:disoccupied_app/exception/response_exception.dart';
import 'package:disoccupied_app/services/brand_service.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';

import '../model/Brand.dart';

class BrandController{

  BrandService brandService = new BrandService();
  String errorMessage = "";

  Future<Brand?> getBrandData(String brandName) async{
    try{
      Brand brand = await brandService.getBrandData(brandName.toLowerCase());
      return brand;
    }catch(exception){

      if(exception.runtimeType == ResponseException){
        ResponseException responseException = exception as ResponseException;
        errorMessage = TextConstants.errorMessage[exception.cause] ?? "Unknown Error occured";
      }else{
        errorMessage = TextConstants.errorMessage["UNKNOWN_EXCEPTION"]!;
      }

    }
  }


}