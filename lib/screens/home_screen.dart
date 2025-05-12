import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/build_loadingUI.dart';
import 'package:weatherapp/widgets/build_erro.dart';
import 'package:weatherapp/widgets/dialouge_box.dart';
import 'package:weatherapp/widgets/weather_ui.dart';

class Homescreen extends StatelessWidget {
 const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearchDialog(context),
          ),
        ],
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, _) {
          if (weatherProvider.weatherdata.isNotEmpty) {
            final WeatherResponse weather = weatherProvider.weatherdata.first;
            return buildWeatherUI(weather);
          } else if (weatherProvider.hasError) {
            return buildErrorUI();
          } else {
            return buildLoadingUI(context);
          }
        },
      ),
    );
  }
}
