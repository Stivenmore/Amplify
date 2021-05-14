import 'package:amplify/domain/cubit/amplifyauth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ResetCode extends StatefulWidget {
  ResetCode({Key key}) : super(key: key);

  @override
  _ResetCodeState createState() => _ResetCodeState();
}

class _ResetCodeState extends State<ResetCode> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
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
                print('back Home');
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
                  'Agrega tu email para registrado para reenviarte el codigo',
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
                  style: TextStyle(color: Colors.white),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter a email' : null,
                  controller: _controller,
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
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.25),
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
                        final bool resp = await context
                            .read<AmplifyauthCubit>()
                            .resetcode(
                                email: _controller.text);
                        if (resp == true) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Enviado con exito',
                            style: TextStyle(color: Color(0xff212029)),
                          ),
                          backgroundColor: Colors.white,
                        ));
                          Future.delayed(
                              Duration(milliseconds: 1500),
                              () => Navigator.pop(context));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error')));
                        }
                      } else {
                        print('invaido');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      height: 60,
                      width: size.width * 0.8,
                      child: Center(
                        child: Text(
                          'Reenviar Codigo',
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
