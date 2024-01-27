import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_connect_and_state_mixin_a_p_i/app/modules/home/providers/product_model_provider.dart';
import '../controllers/home_controller.dart';
import '../product_model_model.dart';

class HomeView extends GetView<HomeController> {
  final ProductModelProvider productModelProvider = ProductModelProvider();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: productModelProvider.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<ProductModel> productList =
            snapshot.data as List<ProductModel>;
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      productList[index].imageLink.toString(),
                    ),
                  ),
                  title: Text(productList[index].name.toString()),
                  subtitle: Text(productList[index].description.toString()),
                  trailing: Column(
                    children: [
                      _buildRatingStars(productList[index].rating),
                    ],
                  )
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildRatingStars(dynamic rating) {
    if (rating == null) {
      return const Icon(Icons.star_border, color: Colors.yellow);
    }
    // Assuming rating is out of 5
    final int numberOfStars = rating.toInt();
    return Row(
      children: List.generate(5, (index) {
        if (index < numberOfStars) {
          return Icon(Icons.star, color: Colors.yellow);
        } else {
          return Icon(Icons.star_border, color: Colors.yellow);
        }
      }),
    );

  }
}