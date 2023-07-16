import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/detalle': (context) => Detalle(),
        '/configuracion': (context) => Configuracion(),
      },
    );
  }
}

class Inicio extends StatelessWidget {
  Inicio({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 79, 79, 1),
      appBar: AppBar(
        title: Text(
          "CERTUS ERICK CT MI APP",
          style: TextStyle(fontFamily: AutofillHints.addressCity),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hola Erick CT",
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                )),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/detalle',
              ),
              child: Text('Ver detalles'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/configuracion'),
              child: Text('Configuravion'),
            ),
          ],
        ),
      ),
    );
  }
}

class Detalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: Center(
        child: Text(
          "Pantalla Detalle",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion"),
      ),
      body: Center(
        child: Text(
          "Pantalla de configuracion",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
