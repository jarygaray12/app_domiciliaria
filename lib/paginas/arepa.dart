import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArepaPage extends StatelessWidget {
  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arepa'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildProductCard(
            context,
            'Arepas de queso',
            'deliciosas y nutritivas arepas de queso ',
            2.000,
            'https://s.cornershopapp.com/product-images/1376841.jpg?versionId=_B1X0WyE6ehOQwjMfhF__csubl8Vcyuw',
             
          ),
          _buildProductCard(
            context,
            'Arepas de Chócolo',
            'populares y exquisitas a base de maiz tierno',
            1.500,
            'https://arequesochocolo.com.co/sites/default/files/styles/cetiia-banner-1280_x_500/public/diapositivas/banner2_86.png?itok=oIHeHUlW',
          ),
          // Puedes agregar más tarjetas de productos aquí
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
                onPressed: () =>
                    _sendWhatsAppOrder(context), // Pasar context como argumento
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
