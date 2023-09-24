import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpanadaPage extends StatelessWidget {
  // Función para abrir WhatsApp
    _sendWhatsAppOrder(BuildContext context) async {
    final whatsappUrl =
        "https://wa.me/3215151584?text=¡Hola! Quiero hacer un pedido de una arepa."; // Enlace de WhatsApp con mensaje de pedido
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
            Image.asset(
              'assets/empanada.png',  // Ruta de la imagen local
              width: 150,  // Ajusta el ancho de la imagen según tus preferencias
              height: 150, // Ajusta el alto de la imagen según tus preferencias
            ),
            SizedBox(height: 10), // Espacio entre la imagen y el botón de WhatsApp
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
