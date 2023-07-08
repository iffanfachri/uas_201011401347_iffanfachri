import 'package:uas_iffan_cuaca/model/cuaca_model.dart';
import 'package:dio/dio.dart';

class CuacaService {
  final dio = Dio();

  Future<CuacaModel> getCurrentWeather(String cityName) async {
    final response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=786f712f5f4f6cbf790e5432c2404412&units=metric');
    print(response.requestOptions.path);
    return CuacaModel.fromJson(response.data);
  }
}
