/// Configuración de API
class ApiConfig {
  /// URL base de la API Forex Factory
  static const String baseUrl = 'https://forex-factory-scraper1.p.rapidapi.com';

  /// Tu clave de API de RapidAPI
  /// Obtén la tuya en: https://rapidapi.com/ousema.frikha/api/forex-factory-scraper1
  static const String rapidApiKey = 'asdasdasdasdasdasdas';

  /// Host de RapidAPI
  static const String rapidApiHost = 'forex-factory-scraper1.p.rapidapi.com';

  /// Timeout por defecto para las peticiones
  static const Duration timeout = Duration(seconds: 30);
}

/// Constantes de la aplicación
class AppConstants {
  /// Nombre de la aplicación
  static const String appName = 'Forex News';

  /// Versión de la aplicación
  static const String version = '1.0.0';
}
