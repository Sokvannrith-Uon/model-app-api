import 'dart:vmservice_io';

import 'package:model_app/app/models/products.dart';
import 'package:vania/http/response.dart';
import 'package:vania/query_builder.dart';
import 'package:vania/vania.dart';
import 'package:vania/http/controller.dart';
import 'package:vania/http/request.dart';
class ProductController extends Controller {
  

Future<Response> getProducts(Request request) async{
  final db = await DB.table('products').get();
  final data = db.map((product){
    return{
      'product_id':product['product_id'],
      'product_name':product['product_name'],
      'product_descriptio ':product['product_description'],
      'product_price':product['product_price'],
      'product_stock':product['product_stock'],
      'category_id':product['category_id'],
      'created_at':product['create_at'].toIso8601String(),
      'updated_at':product['update_at']?.toIso8601String()

    };
  }).toList();
  return Response.json(
    {
      'message':'Products retrieved successfully',
      'status':true,
      'Timestamp':DateTime.now().toIso8601String(),
      'data':data

    }
  );
}
}
final ProductController productController=ProductController();