import 'package:widget_app/domain/models/forex_news.dart';
import 'package:widget_app/data/repositories/forex_repository.dart';

class GetForexNewsUseCase {
  final IForexRepository repository;

  GetForexNewsUseCase(this.repository);

  Future<List<ForexNews>> call({
    String? calendar,
    String? year,
    String? month,
    String? day,
    String? currency,
    String? eventName,
    String? timezone,
    String? timeFormat,
  }) async {
    return await repository.getCalendarEvents(
      calendar: calendar,
      year: year,
      month: month,
      day: day,
      currency: currency,
      eventName: eventName,
      timezone: timezone,
      timeFormat: timeFormat,
    );
  }
}

class GetHistoricalForexNewsUseCase {
  final IForexRepository repository;

  GetHistoricalForexNewsUseCase(this.repository);

  Future<List<ForexNews>> call(String date) async {
    return await repository.getHistoricalCalendarEvents(date);
  }
}
