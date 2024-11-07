import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherseeker/domain/entities/weather_entity.dart';
import 'package:weatherseeker/domain/repositories/weather_repository.dart';
import 'package:weatherseeker/domain/use_cases/get_weather_by_geo_loc.dart';
import 'get_weather_by_geo_loc_test.mocks.dart';

// Classe de teste
@GenerateMocks(
    [WeatherRepository]) //gera um arquivo de implementação dessa classe;
void main() {
  late GetWeatherByGeoLoc getWeatherByGeoLoc;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeatherByGeoLoc = GetWeatherByGeoLoc(mockWeatherRepository);
  });

  group('GetWeatherByGeoLoc', () {
    test('should return WeatherForecast when repository call is successful',
        () async {
      // Arrange
      final latitude = '12.345';
      final longitude = '-67.890';
      final expectedWeatherForecast = WeatherForecast(

          //TODO instanciar essa classe;

          // Preencha com dados de exemplo relevantes para o seu WeatherForecast
          cod: '200',
          message: 0,
          cnt: 40,
          list: [],
          city: City(
              id: 1,
              name: 'Teste',
              coord: Coord(lon: 1.0, lat: 1.0),
              country: 'BR',
              population: 1000,
              timezone: 1,
              sunrise: 1,
              sunset: 1));

      when(mockWeatherRepository.call(latitude, longitude))
          .thenAnswer((_) => expectedWeatherForecast);

      // Act
      final result = getWeatherByGeoLoc(latitude, longitude);

      // Assert
      expect(result, expectedWeatherForecast);
      verify(mockWeatherRepository.call(latitude, longitude)).called(1);
    });

    test('should throw an exception when repository call fails', () async {
      // Arrange
      final latitude = '12.345';
      final longitude = '-67.890';
      when(mockWeatherRepository.call(latitude, longitude))
          .thenThrow(Exception('Erro na API'));

      // Act & Assert
      expect(() => getWeatherByGeoLoc(latitude, longitude),
          throwsA(isA<Exception>()));
      verify(mockWeatherRepository.call(latitude, longitude)).called(1);
    });

    test('should handle empty latitude and longitude', () {
      // Arrange
      final latitude = '';
      final longitude = '';

      // Mock para evitar chamadas reais à API, mesmo com parâmetros inválidos.
      when(mockWeatherRepository.call(any, any)).thenAnswer((_) =>
          WeatherForecast(
              cod: '400',
              message: 0,
              cnt: 0,
              list: [],
              city: City(
                  id: 0,
                  name: '',
                  coord: Coord(lon: 0.0, lat: 0.0),
                  country: '',
                  population: 0,
                  timezone: 0,
                  sunrise: 0,
                  sunset: 0)));

      // Act
      final result = getWeatherByGeoLoc(latitude, longitude);

      // Assert -  Ajuste a asserção com base no comportamento esperado.
      // Aqui, verificamos se algum valor padrão ou uma exceção específica é retornada.
      expect(result.cod, '400'); // Exemplo: Verificando um código de erro
    });

//aqui Vitor e eu tentamos kkkk
    test('should throw an exception for invalid longitude', () {
      final latitude = '45.000';
      final longitude = '90.000';

      when(mockWeatherRepository.call(latitude, longitude))
          .thenThrow(Exception('invalid longitude'));

      expect(() => getWeatherByGeoLoc(latitude, longitude),
          throwsA(isA<Exception>()));
    });
  });
}
