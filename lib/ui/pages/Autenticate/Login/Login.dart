import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool switchbool = false;
  String helpers = '';
  double kleft = 0;
  double krigth = 165;
  double manejo;

  horizontalupdate(DragUpdateDetails detail, Size size) {
    manejo = detail.localPosition.dx / 50;
    print(manejo);
    setState(() {
      krigth = krigth - (manejo);
      kleft = kleft + (manejo);
    });
  }

  horizontalend(DragEndDetails detail, Size size) {
    if (kleft > 50) {
      setState(() {
        kleft = 165;
        krigth = 0;
        switchbool = true;
      });
    } else {
      setState(() {
        kleft = 0;
        krigth = 165;
        switchbool = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff212029),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/image/1.png',
                height: size.height * 0.4,
                width: size.width,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Descubre un nuevo mundo',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'La escencia  de lo que eres te espera, tus ojos te enseñaran el camino',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: size.height * 0.15),
                child: Container(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white),
                  height: 80,
                  width: size.width * 0.8,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                'Ingresar',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffFFCA00),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            height: 80,
                            width: size.width * 0.4,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'Registrar',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffFFCA00),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            height: 80,
                            width: size.width * 0.4,
                          ),
                        ],
                      ),
                      AnimatedPositioned(
                        left: kleft,
                        right: krigth,
                        duration: Duration(milliseconds: kleft != 0 ? 500 : 300),
                        child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) =>
                              horizontalend(details, size),
                          onHorizontalDragUpdate: (DragUpdateDetails detail) =>
                              horizontalupdate(detail, size),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff212029),
                                borderRadius: BorderRadius.circular(22)),
                            height: 80,
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                switchbool == false ? 'Ingresar' : 'Registrar',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
