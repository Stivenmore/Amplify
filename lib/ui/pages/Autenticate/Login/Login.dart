import 'package:amplify/domain/cubit/amplifyauth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  bool oscure = false;
   final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
 @override
 void initState() { 
   super.initState();
   
 }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff212029),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff212029),
          leading: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body:  SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Estas a un solo paso.',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Bienvenido a un nuevo mundo\nDescubre lo que tenemos preparado para ti.',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        style:TextStyle(color: Colors.white),
                        validator: (value) =>
                            value.isEmpty ? 'Please enter a email' : null,
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                         style:TextStyle(color: Colors.white),
                        obscureText: oscure,
                        validator: (value) =>
                            value.isEmpty ? 'Please enter a password' : null,
                        controller: password,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(Icons.security_rounded),
                                onPressed: () {
                                  setState(() {
                                    oscure = !oscure;
                                  });
                                }),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.35),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Procesando...',
                                  style: TextStyle(color: Color(0xff212029)),
                                ),
                                backgroundColor: Colors.white,
                              ));
                              await context.read<AmplifyauthCubit>().signIn();
                            } else {}
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            height: 60,
                            width: size.width * 0.8,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
