import 'package:netflix/core/strings/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const String downloads = "${kBaseUrl}trending/all/day?api_key=$apiKey";
}
