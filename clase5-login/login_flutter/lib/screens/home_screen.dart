import 'package:flutter/material.dart';
import 'package:login_flutter/model/models.dart';
import 'package:login_flutter/screens/screen.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productsService= Provider.of<ProductsService>(context);
    final authService= Provider.of<AuthService>(context,listen: false);


    if(productsService.isLoading)return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
          onPressed: (){
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          }, 
          icon:const  Icon(Icons.login_outlined)),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder:(context, index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct=productsService.products[index].copy();
            print(productsService.products[index].picture);
            Navigator.pushNamed(context, 'product');
            },
          child: ProductCard(product:productsService.products[index])
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          // creo la nueva instancia de producto (creo un nuevo producto)
          productsService.selectedProduct= new Product(
            avaible: true, 
            name: '', 
            price: 0);
          Navigator.pushNamed(context, 'product');
        },),
    );
  }
}