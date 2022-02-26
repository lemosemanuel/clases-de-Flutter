import 'package:flutter/material.dart';
import 'package:flutter_component/widgets/widgets.dart';

class InputScreen extends StatelessWidget {


   
  const InputScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {


    final GlobalKey<FormState> myFormKey=GlobalKey<FormState>();

    final Map<String,String> formValues={
      'first_name':'emanuel',
      'last_name':'lemos',
      'email':'lemos.eanuel2@gamil.com',
      'passwod':'123',
      'role':'admin',

    };





    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs y form"),
      ),
      // nos permite hacer croll
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
          child: Form(
            // el form sabe que hay varios customInputField los puedo buscar con el key
            key: myFormKey,
            child: Column(
              children:  [
                CustomInputField(
                  hintText:"ponga el nombre",
                  labelText:"Nombre",
                  helperText:"nombre del usuario",
                  icon: Icons.warning,
                  suffixIcon: Icons.people, 
                  formProperty: 'name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomInputField(
                  hintText:"ponga el Apellido",
                  labelText:"Apellido",
                  helperText:"apellido",
                  icon: Icons.warning,
                  suffixIcon: Icons.pending_actions, 
                  formProperty: 'lastname',
                   formValues:formValues,
                ),
                const SizedBox(height: 30,),
                CustomInputField(
                  hintText:"ponga el email",
                  labelText:"Email",
                  helperText:"nombre del email",
                  icon: Icons.email,
                  suffixIcon: Icons.email_rounded,
                  keyboarInputType: TextInputType.emailAddress, 
                  formProperty: 'email',
                   formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomInputField(
                  hintText:"ponga las password",
                  labelText:"Pasword",
                  helperText:"Pasword",
                  icon: Icons.password,
                  suffixIcon: Icons.lock,
                  keyboarInputType: TextInputType.emailAddress,
                  isPasword: true, 
                  formProperty: 'password', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),


                DropdownButtonFormField<String>(
                  items:const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),),
                    DropdownMenuItem(
                      value: 'empleado',
                      child: Text('empleado'),)
                  ], 
                  onChanged: (value){
                    formValues['role']= value??'Admin';
                  }
                  ),
          
                ElevatedButton(
                  onPressed: (){
                    if (!myFormKey.currentState!.validate()){
                      print('formulario no valido');
                      return;
                    }
                    print(formValues);
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text("guardar")))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
