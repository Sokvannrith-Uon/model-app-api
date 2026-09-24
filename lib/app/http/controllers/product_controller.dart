

import 'dart:io';

import 'package:model_app/app/models/products.dart';
import 'package:vania/http/response.dart';
import 'package:vania/query_builder.dart';
import 'package:vania/vania.dart';
import 'package:vania/http/controller.dart';
import 'package:vania/http/request.dart';
class ProductController extends Controller {
  

Future<Response> getProducts() async{
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
Future<Response> getProductById(int id) async{
  final productID = await DB.table('products').where("product_id","=",id).first();
  if(productID==null){
    return Response.json({
      'status':false,
      'statusCode':404,
      'message':'Product not found'
    });
  }
  return Response.json({
      'product_id':productID['product_id'],
      'product_name':productID['product_name'],
      'product_descriptio ':productID['product_description'],
      'product_price':productID['product_price'],
      'product_stock':productID['product_stock'],
      'category_id':productID['category_id'],
      'created_at':productID['create_at'].toIso8601String(),
      'updated_at':productID['update_at']?.toIso8601String()

      });
}
}
final ProductController productController=ProductController();