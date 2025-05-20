import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/radio_station.dart';

class DetailsScreen extends StatelessWidget {
  final RadioStation station;

  const DetailsScreen({Key? key, required this.station}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Rádio'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (station.favicon.isNotEmpty)
                Image.network(
                  station.favicon,
                  width: 100,
                  errorBuilder: (_, __, ___) => Icon(Icons.radio, size: 80),
                )
              else
                Icon(Icons.radio, size: 80),
              SizedBox(height: 16),
              Text(
                station.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                station.country,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                station.language,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => _launchURL(station.url),
                icon: Icon(Icons.play_arrow),
                label: Text('Ouvir Rádio'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
