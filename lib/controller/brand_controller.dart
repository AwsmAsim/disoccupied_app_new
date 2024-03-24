import 'package:disoccupied_app/exception/response_exception.dart';
import 'package:disoccupied_app/services/brand_service.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Brand.dart';

class BrandController extends GetxController{

  BrandService brandService = new BrandService();
  String errorMessage = "";
  List<String> allBrands = [
    "akamai",
    "aesop",
    "ardbeg",
    "kfc",
    "knix",
    "netflix",
    "neslac"
  ];
  List<String> loadedBrands = [];

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

  Future<List<String>> getBrands(String value) async{

    await Future.delayed(Duration(seconds: 1));
    loadedBrands = [];
    allBrands.forEach((element) {
      if(element.toLowerCase().startsWith(value.toLowerCase())){
        loadedBrands.add(element);
      }
    });
    print(loadedBrands);
    update();
    return loadedBrands;
  }




}