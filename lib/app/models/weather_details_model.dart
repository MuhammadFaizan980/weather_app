class WeatherDetailsModel {
  double? lat;
  double? lon;
  String? timezone;
  CurrentWeather? current;

  WeatherDetailsModel({lat, lon, timezone, timezoneOffset, current});

  WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    current = json['current'] != null ? CurrentWeather.fromJson(json['current']) : null;
  }
}

class CurrentWeather {
  double? temp;
  double? feelsLike;
  double? pressure;
  double? humidity;
  double? visibility;
  double? windSpeed;

  CurrentWeather({dt, sunrise, sunset, temp, feelsLike, pressure, humidity, dewPoint, uvi, clouds, visibility, windSpeed, windDeg, windGust, weather});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] + .0;
    feelsLike = json['feels_like'] + .0;
    pressure = json['pressure'] + .0;
    humidity = json['humidity'] + .0;
    visibility = json['visibility'] + .0;
    windSpeed = json['wind_speed'] + .0;
  }
}
