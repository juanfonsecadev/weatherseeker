import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetWeatherByGeoLoc { 

    final WeatherRepository  weatherRepository; 

    GetWeatherByGeoLoc(
      this.weatherRepository
    ); 

  WeatherForecast call(String latitude, String longitude){ 
    return weatherRepository.call(latitude, longitude);     //forjar uma latitude ex. 90deg 
  }
}