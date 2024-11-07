class WeatherForecast {
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  int elevation;
  HourlyUnits hourlyUnits;
  Hourly hourly;
  DailyUnits dailyUnits;
  Daily daily;

  WeatherForecast({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });
}

class HourlyUnits {
  String time;
  String temperature2m;
  String relativeHumidity2m;
  String apparentTemperature;
  String precipitationProbability;
  String precipitation;
  String rain;
  String cloudCover;
  String cloudCoverLow;
  String cloudCoverMid;
  String cloudCoverHigh;
  String visibility;
  String windSpeed10m;

  HourlyUnits({
    required this.time,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.precipitation,
    required this.rain,
    required this.cloudCover,
    required this.cloudCoverLow,
    required this.cloudCoverMid,
    required this.cloudCoverHigh,
    required this.visibility,
    required this.windSpeed10m,
  });
}

class Hourly {
  List<String> time;
  List<double> temperature2m;
  List<int> relativeHumidity2m;
  List<double> apparentTemperature;
  List<int> precipitationProbability;
  List<double> precipitation;
  List<double> rain;
  List<int> cloudCover;
  List<int> cloudCoverLow;
  List<int> cloudCoverMid;
  List<int> cloudCoverHigh;
  List<int> visibility;
  List<double> windSpeed10m;

  Hourly({
    required this.time,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.precipitation,
    required this.rain,
    required this.cloudCover,
    required this.cloudCoverLow,
    required this.cloudCoverMid,
    required this.cloudCoverHigh,
    required this.visibility,
    required this.windSpeed10m,
  });
}

class DailyUnits {
  String time;
  String temperature2mMax;
  String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });
}

class Daily {
  List<String> time;
  List<double> temperature2mMax;
  List<double> temperature2mMin;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });
}
