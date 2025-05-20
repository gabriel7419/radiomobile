import 'package:flutter/material.dart';
import '../models/radio_station.dart';
import '../services/api_service.dart';
import '../widgets/station_title.dart';
import 'details_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<RadioStation>> _stations;

  @override
  void initState() {
    super.initState();
    _stations = ApiService.fetchStationsByCountry('Brazil');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rádios do Brasil'), centerTitle: true,),
      body: FutureBuilder<List<RadioStation>>(
        future: _stations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Erro: ${snapshot.error}'));

          final stations = snapshot.data!;
          return ListView.builder(
            itemCount: stations.length,
            itemBuilder: (context, index) {
              return StationTile(
                station: stations[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(station: stations[index]),
                    ),
                  );
                },
              );

            },
          );
        },
      ),
    );
  }
}