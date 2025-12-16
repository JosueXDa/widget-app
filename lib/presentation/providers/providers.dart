import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:dio/dio.dart';
import 'package:widget_app/data/datasources/remote/forex_api_service.dart';
import 'package:widget_app/data/repositories/forex_repository.dart';
import 'package:widget_app/domain/usecases/forex_usecases.dart';
import 'package:widget_app/presentation/providers/forex_news_provider.dart';

/// Configuración centralizada de todos los providers de la aplicación
/// Respeta el patrón SOLID
class AppProviders {
  static List<SingleChildWidget> get providers {
    final dio = Dio();
    final apiService = ForexApiService(dio: dio);
    final repository = ForexRepository(apiService);
    final getForexNewsUseCase = GetForexNewsUseCase(repository);
    final getHistoricalUseCase = GetHistoricalForexNewsUseCase(repository);

    return [
      /// Capa de Datos
      Provider<Dio>.value(value: dio),
      Provider<ForexApiService>.value(value: apiService),
      Provider<IForexRepository>.value(value: repository),

      /// Capa de Dominio (Use Cases)
      Provider<GetForexNewsUseCase>.value(value: getForexNewsUseCase),
      Provider<GetHistoricalForexNewsUseCase>.value(value: getHistoricalUseCase),

      /// Capa de Presentación (State Providers)
      ChangeNotifierProvider<ForexNewsProvider>(
        create: (_) => ForexNewsProvider(
          getForexNewsUseCase: getForexNewsUseCase,
          getHistoricalForexNewsUseCase: getHistoricalUseCase,
        ),
      ),
    ];
  }
}
