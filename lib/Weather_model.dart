class WeatherData {
  final String name;
  final Temperature temperature;
  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLevel;
  final List<Weather> weather;

  WeatherData({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      temperature: Temperature(
        current: json['main']['temp'].toDouble(),
      ),
      humidity: json['main']['humidity'],
      wind: Wind(
        speed: json['wind']['speed'].toDouble(),
      ),
      maxTemperature: json['main']['temp_max'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      pressure: json['main']['pressure'],
      seaLevel: json['main']['sea_level'] ?? 0,
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
    );
  }
}

class Temperature {
  final double current;

  Temperature({
    required this.current,
  });
}

class Wind {
  final double speed;

  Wind({
    required this.speed,
  });
}

class Weather {
  final String main;

  Weather({
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      main: json['main'],
    );
  }
}
