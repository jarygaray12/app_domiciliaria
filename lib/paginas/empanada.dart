import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpanadaPage extends StatelessWidget {
  // Función para abrir WhatsApp
  _launchWhatsApp(BuildContext context) async {
    final whatsappUrl =
        "https://wa.me/3215151584"; // Enlace de WhatsApp con el número de teléfono
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      // Manejar el error si no se puede abrir WhatsApp
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("No se pudo abrir WhatsApp."),
            actions: <Widget>[
              TextButton(
                child: Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empanada'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¡Bienvenido a la página de Empanada!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () =>
                  _launchWhatsApp(context), // Pasar context como argumento
              icon: Icon(Icons.whatshot), // Ícono de WhatsApp
              label: Text('Abrir WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}
