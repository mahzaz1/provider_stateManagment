import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Login_Provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text('Login With API'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              SizedBox(height: 20,),
              Consumer<LoginProvider>(
                  builder: (context,value,child){
                    return  TextFormField(
                      obscureText: value.obsecureValue,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                        suffix: InkWell(
                          onTap: (){
                            value.setObsecure();
                          },
                          child:  Icon(value.obsecureValue ? Icons.visibility_off_outlined:Icons.visibility_outlined),
                        )
                      ),
                    );
                  }
              ),

              SizedBox(height: 20,),

              Consumer<LoginProvider>(
                  builder: (context,value,child){
                return InkWell(
                  onTap: (){
                    value.login(emailController.text.toString(), passwordController.text.toString());
                  },
                  child: Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: value.isLoading ? CircularProgressIndicator(color: Colors.white,):Text('Login'),
                    ),
                  ),
                );
              }
              )

            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
