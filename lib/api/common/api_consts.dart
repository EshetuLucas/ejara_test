import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrlV1 = dotenv.env['BASE_URL_V1']!;
String baseUrlV2 = dotenv.env['BASE_URL_V2']!;
String apiKey = dotenv.env['API_KEY']!;
String clientId = dotenv.env['02d5f007e2']!;

/// These can be moved to another place, becuase they are dynamic.
/// I'm using theme here for test purporse
String appVersion = '3.1.5';
String appPlatform = 'android-test';
String client = 'mobile';
