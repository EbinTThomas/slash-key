import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ProductAPI {
  List? products;

  ProductAPI();
  Future<void> getProductAPI() async {
    try {
      var url = Uri.parse(
          'https://slash-key.herokuapp.com/api/all-product/');
      Response products_response = await get(url);
      products = json.decode(products_response.body);
    }
    catch(e) {
      print('error');
    }
  }
}