import 'dart:convert';

import 'package:better_buys/Models/product.dart';
import 'package:http/http.dart' as http;
import 'package:better_buys/Models/seller.dart';

class ServerHandler {

  String _baseUrl = "http://10.0.2.2/better-buys/api";
  // get the list of seller
  Future<List<Seller>?> getSellers() async {
    try {
      // ignore: unused_local_variable
      List<Seller> sellers = [];
      http.Response response =
          await http.get(Uri.parse('$_baseUrl/gen/sellers'));

      List sellersList = (json.decode(response.body))['sellers'];
      print(sellersList);

      for(Map m in sellersList)
      {
        sellers.add(Seller.fromMap(m));
      }
      return sellers;

    } catch (e) 
    {
     print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }

  /// getting list of products per seller
  Future<List<Product>> getProductsPerSeller(int sellerId) async{
    try{
      List<Product> products = [];

      http.Response response = await http
          .get(Uri.parse('$_baseUrl/gen/products?seller_id=$sellerId'));

          List productsList = (json.decode(response.body))['products'];

      for (Map m in productsList) {
        products.add(Product.fromMap(m));
      }

      print(productsList);

      return products;
    } catch(e) {
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }
}