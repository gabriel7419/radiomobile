import 'package:flutter/material.dart';
import '../models/radio_station.dart';

class StationTile extends StatelessWidget {
  final RadioStation station;
  final VoidCallback onTap;

  const StationTile({
    Key? key,
    required this.station,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(color: Colors.grey.shade300),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (station.favicon.isNotEmpty)
                Image.network(
                  station.favicon,
                  width: 60,
                  height: 60,
                  errorBuilder: (_, __, ___) => Icon(Icons.radio, size: 50),
                )
              else
                Icon(Icons.radio, size: 50),
              SizedBox(height: 10),
              Text(
                station.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                station.country,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
