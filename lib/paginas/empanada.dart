import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpanadaPage extends StatelessWidget {
  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empanadas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildProductCard(
            context,
            'empanadas de carne',
            'deliciosas empanadas de carne  ',
            1.500,
            'https://assets.unileversolutions.com/recipes-v2/239857.jpg',
             
          ),
          _buildProductCard(
            context,
            'empanadas de pollo',
            'exquisitas  empanadas de pollo ',
            1.500,
            'https://www.thespruceeats.com/thmb/F388EHg2t-Z3pIZC7NJDURoH49s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/chicken-empanadas-de-pollo-3029662-hero-01-19f2121f025b4b26949d3454654eade8.jpg',
          ),
           
        ],
      ),
    );
  }

   Widget _buildProductCard(
  BuildContext context,
  String nombre,
  String descripcion,
  double precio,
  String imagenUrl,
) {
  return Card(
    elevation: 3.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(
          imagenUrl,
          width: double.infinity,
          height: 150.0,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nombre,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                descripcion,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '\$$precio',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () {
                  String mensaje = "¡Hola! Quiero comprar $nombre. tengo interes en en sus productos.";
                  String numeroWhatsApp = "3215151584"; // Reemplaza con el número de WhatsApp al que deseas enviar el mensaje
                  _sendWhatsAppOrder(context, numeroWhatsApp, mensaje);
                },
                icon: Icon(Icons.shopping_cart), // Ícono de carrito de compra
                label: Text('Comprar'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

_sendWhatsAppOrder(BuildContext context, String numero, String mensaje) async {
  final whatsappUrl = "https://wa.me/$numero?text=${Uri.encodeComponent(mensaje)}";

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
}

   
