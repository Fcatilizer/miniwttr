import 'package:flutter/material.dart';
import '../services/weather_services.dart';
import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

    // api key
    final _WeatherService = WeatherService('5a372441b1038c862a3022d9b31ed406');
    Weather? _weather;
    // fetch weather
    _fetchWeather() async {
        String cityName = await _WeatherService.getCurrentCity();

        try {
            final weather = await _WeatherService.getWeather(cityName);
            setState(() {
                _weather = weather;
            });
        }

        catch (e) {
            print(e);
        }
    }

    @override
    void initState() {
        super.initState();
        _fetchWeather();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(_weather?.cityName ?? "loading City..."),
               Text('${_weather?.temperature.round()}°C'),
            ],
        ),
        )
    );
  }
}