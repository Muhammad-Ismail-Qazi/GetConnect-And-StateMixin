

import 'package:get/get.dart';

import '../providers/product_model_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>>{
  //TODO: Implement HomeController


  @override
  void onInit() {
    super.onInit();
    getProductController().then((value) => (value) {
      return Future.error(value);
    });

  }

  @override
  void onReady() {
    super.onReady();


  }

  @override
  void onClose() {
    super.onClose();
  }

Future  getProductController()async{
  ProductModelProvider productModelProvider =ProductModelProvider();
  productModelProvider.getProduct();
}

}