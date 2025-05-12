import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

Widget buildWeatherUI(WeatherResponse weather) {
  return SingleChildScrollView(
    child: Container(
      width: double.infinity,
      height: 800,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_city_outlined,
            color: Colors.white,
          ),
          Text(
            ' ${weather.name}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: Column(
              children: [
                Image(
                  image: NetworkImage(
                    'https://openweathermap.org/img/wn/${weather.weather?[0].icon}@2x.png',
                  ),
                ),
                Text(
                  ' ${weather.main!.temp}°C',
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Feels like: ${weather.main!.feelsLike}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'Weather: ${weather.weather![0].main}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'Clouds: ${weather.clouds!.all}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 100,
                  width: 170,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 87, 68, 120),
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      const Icon(
                        Icons.sunny,
                        size: 50,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sunrise:${formatUnixTimestamp(weather.sys!.sunrise)}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'wind gust: ${weather.wind!.gust}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'pressure: ${weather.main!.pressure}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 87, 68, 120),
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const Icon(
                        Icons.nightlight,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sunset: ${formatUnixTimestamp(weather.sys!.sunset)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'wind: ${weather.wind!.speed}km/h',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Humidity: ${weather.main!.humidity}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

String formatUnixTimestamp(int? unixTimestamp) {
  if (unixTimestamp != null) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  } else {
    return '';
  }
}
