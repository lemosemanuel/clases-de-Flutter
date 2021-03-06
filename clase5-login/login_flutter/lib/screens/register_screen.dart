import 'package:flutter/material.dart';
import 'package:login_flutter/providers/login_form_provider.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/ui/input_decorations.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children:[

              const SizedBox(height: 250,),

              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text("Registro", style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30,),


                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50,),
              TextButton(
                onPressed: ()=>Navigator.pushReplacementNamed(context, 'login'), 
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())
                  
                  ),

                child: const Text('Ya tenes una cuenta?',style: TextStyle(fontSize: 18,color: Colors.black87),),),
              const SizedBox(height: 50,),


            ],
          ),
        )
      )
    );
  }
}



class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm= Provider.of<LoginFormProvider>(context);
    return Container(

      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hinText: 'tuEmail@gmail.com',labelText: 'Correo Electronico',prefixIcon: Icons.alternate_email_sharp),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Escriba un Email real';
              },
            ),
            
            const SizedBox(height:30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hinText: '*******',labelText: 'Password',prefixIcon: Icons.lock_outline),
              onChanged: (value) => loginForm.password=value,
              validator: (value) {
                // retorno null... osea pasa la validacion solo si es mayor a 6
                return (value !=null && value.length>=6)
                  ? null
                  : 'La Password debe tener mas de 6 caracteres';
              },

            ),
            
            const SizedBox(height:30),

            MaterialButton(
              onPressed: loginForm.isLoading?null:()async {
                // quito el teclado cuando hago el click (lo quito con el fpcusScope)
                FocusScope.of(context).unfocus();
                final authService= Provider.of<AuthService>(context,listen: false);


                if (!loginForm.isValidForm()) return;
                loginForm.isLoading=true;

                final String? respuesta=await authService.createUser(loginForm.email,loginForm.password);
                
                // si no hay error
                if (respuesta==null){
                  Navigator.pushReplacementNamed(context, 'home'); 

                }else{
                  print(respuesta);
                  NotificationsService.showSnackbar(respuesta);
                  loginForm.isLoading=false; 
                }

                // simulo que esta procesando
                // await Future.delayed(Duration(seconds: 2));




              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                child:  Text(loginForm.isLoading? 'Espere': "Ingresar",style: const TextStyle(color: Colors.white),),
                ),
              
            )

          ],
        )
      ),
    );
  }
}