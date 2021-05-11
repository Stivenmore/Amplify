import 'package:amplify/domain/cubit/amplifyauth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
TextEditingController email = TextEditingController();

  bool oscure = false;

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
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
                print('back login');
              },
              icon: Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  padding: EdgeInsets.only(top: size.height * 0.30),
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
                        await context.read<AmplifyauthCubit>().signUp();
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
                          'Register',
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
    );
  }
}
