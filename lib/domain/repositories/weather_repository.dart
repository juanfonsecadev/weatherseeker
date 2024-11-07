import "package:weatherseeker/domain/entities/weather_entity.dart";

abstract class WeatherRepository{ 

  WeatherForecast call(String latitude, String longitude); 

}

//classe abstrata está criada. 