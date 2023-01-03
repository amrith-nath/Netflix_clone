import 'package:netflix/core/strings/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const String downloads = "${kBaseUrl}trending/all/day?api_key=$apiKey";

  static const search =
      '${kBaseUrl}search/movie?api_key=$apiKey&language=en-US&query=superman&page=1&include_adult=false';
}
