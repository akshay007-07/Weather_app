import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';

void showSearchDialog(BuildContext context) {
  late final TextEditingController searchController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter City Name'),
        content: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Enter city name',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
              },
            ),
          ),
          onSubmitted: (_) {
            Provider.of<WeatherProvider>(context, listen: false)
                .getWeather(searchController.text)
                .then((_) {});
            Navigator.pop(context); // Close the dialog
          },
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Provider.of<WeatherProvider>(context, listen: false)
                  .getWeather(searchController.text)
                  .then((_) {});
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Search'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog without searching
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
