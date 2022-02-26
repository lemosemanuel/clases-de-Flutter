import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_flutter/providers/product_form_provider.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/ui/input_decorations.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final producService=Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_)=>ProductFormProvider(producService.selectedProduct),
      child: _productScreenBody(producService: producService,),
      );
  }
}

class _productScreenBody extends StatelessWidget {
  const _productScreenBody({
    Key? key,
    required this.producService,
  }) : super(key: key);

  final ProductsService producService;
  

  @override
  Widget build(BuildContext context) {
  final productForm=Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // oculto el teclado cuando hago scroll
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                // imagen del producto
                ProductImage(url: producService.selectedProduct.picture),
                // flecha para volver atras
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed:()=>Navigator.of(context).pop(),
                    icon:const Icon(Icons.arrow_back_ios_new,size: 40,color: Colors.white,)
                  )
                ),
                // camara para tomar la foto
                Positioned(
                  top: 60,
                  right: 30,
                  child: IconButton(
                    onPressed:()async {
                      final picker = new ImagePicker();
                      final pickedFile= await picker.getImage(
                        source: ImageSource.camera,
                        imageQuality: 100);
                        if (pickedFile == null){
                          print('no selecciono nada');
                          return ;
                        }
                        print('tenesmos imagen ${pickedFile.path}');
                        producService.updateSelectedProductImage(pickedFile.path);
                    },
                    icon:const Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,)
                  )
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: producService.isSaving
        ? const CircularProgressIndicator(color: Colors.white,)
        : const Icon(Icons.save_outlined),
        onPressed: producService.isSaving
        ? null
        : () async {
          if (!productForm.isValidForm())return;
          final String? imageUrl= await producService.uploadImage();

          if (imageUrl != null)productForm.product.picture=imageUrl;
          producService.saveOrCreateProducto(productForm.product);
        },
        ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final productForm=Provider.of<ProductFormProvider>(context);
  final product=productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10,),

              TextFormField(
                initialValue: product.name,

                onChanged: (value) => product.name=value,
                validator: (value) {
                  if(value==null || value.length<1)
                  return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: "Nombre del producto",
                  labelText: 'Nombre:'
                  ),
              ),

              const SizedBox(height: 30,),
              
              TextFormField(
                initialValue: '${product.price}',
                // reglas para el valor Obligatorio (solo numeros)
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) => {
                  if (double.tryParse(value)==null){
                    product.price=0
                  }else{
                    product.price=double.parse(value)
                  }
                },
                validator: (value) {
                  if(value==null || value.length<1)
                  return 'El nombre es obligatorio';
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hinText: "\$150",
                  labelText: 'Precio:'
                  ),
              ),

              const SizedBox(height: 30,),

              SwitchListTile.adaptive(
                value: product.avaible, 
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value)=>productForm.updateAvailability(value)
                ),
              const SizedBox(height: 30,),


            ],
          )
          ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius:const  BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(0,5),
      blurRadius: 5
    )]
  );
}