



import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_flutter/model/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{
  final String _baseUrl='fluttervarios-a808e-default-rtdb.firebaseio.com';
  final List<Product> products=[];
  bool isLoading=true;
  bool isSaving=false;
  late Product selectedProduct;

  final storage= new FlutterSecureStorage();

  File? newPictureFile;

  ProductsService(){
    this.loadProducts();
  }

  Future <List<Product>>loadProducts()async{
    this.isLoading=true;
    notifyListeners();
    final url=Uri.https(_baseUrl, 'products.json',{
      'auth': await storage.read(key: 'idToken')??''
    });
    final resp= await http.get(url);
    // como me lo respondio en string , lo paso a json
    final Map<String,dynamic> productsMap= json.decode(resp.body);
    // print('viene esto: $productsMap');
    // es un mapa ahora lo voy a hacer un listado
    // barro cada una de las llaves
    productsMap.forEach((key, value) { 
      final tempProduct= Product.fromMap(value);
      tempProduct.id=key;
      this.products.add(tempProduct);
      // ya tendria la lista de productos
    });
    this.isLoading=false;
    notifyListeners();
    return this.products;

  }

  Future saveOrCreateProducto (Product product)async{
    isSaving=true;
    notifyListeners();

    if(product.id==null){
      // si el producto es nuevo y no tiene id
      await this.createProduct(product);
    }else{
      await this.updateProduct(product);
    }

    isSaving=false;
    notifyListeners();
  }

  Future<String>updateProduct(Product product)async{
    final url=Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp= await http.put(url,body: product.toJson());
    final decodeData=resp.body;
    // print(decodeData);

    // indice del producto que voy a actualizar
    final index= this.products.indexWhere((element) => element.id==product.id);
    this.products[index]=product;

    return '';
  }

  Future<String>createProduct(Product product)async{
    final url=Uri.https(_baseUrl, 'products.json');
    final resp= await http.post(url,body: product.toJson());
    final decodeData=json.decode(resp.body);

    // firebase en el decodeData me devuelve el id
    product.id=decodeData['name'];
    this.products.add(product);

    return product.id!;
  }

  // guardo la imagen que saco con la camara, recibo el path 
  void updateSelectedProductImage(String path){
    this.selectedProduct.picture=path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future <String?>uploadImage()async{
    if (this.newPictureFile == null) return null;
    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/elemos/image/upload?upload_preset=t4g2joqv');
    final imageUploadRequest= http.MultipartRequest(
      'POST',
      url
    );

    // adjunto el archivo
    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    // disparo la peticion
    final streamResponse=await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode !=201){
      print('algo salio mal');
      print(resp.body);
      return null;
    }
    this.newPictureFile= null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];


  }
}