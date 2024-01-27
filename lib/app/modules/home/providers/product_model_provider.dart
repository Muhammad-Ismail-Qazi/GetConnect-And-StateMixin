import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../product_model_model.dart';

class ProductModelProvider extends GetConnect {
  List<ProductModel> productList=[];
  Future<List<ProductModel>> getProduct()async{
   final response= await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"));
    if(response.statusCode==200){
      var jsonString= jsonDecode(response.body);
      for(var i in jsonString){
        productList.add(ProductModel.fromJson(i));
      }
      return productList;
    }else{
      return [];

    }

  }
}