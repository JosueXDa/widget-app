import 'package:widget_app/domain/models/forex_news.dart';
import 'package:widget_app/data/datasources/remote/forex_api_service.dart';

abstract class IForexRepository {
  Future<List<ForexNews>> getCalendarEvents({
    String? calendar,
    String? year,
    String? month,
    String? day,
    String? currency,
    String? eventName,
    String? timezone,
    String? timeFormat,
  });
  Future<List<ForexNews>> getHistoricalCalendarEvents(String date);
}

class ForexRepository implements IForexRepository {
  final ForexApiService _apiService;

  ForexRepository(this._apiService);

  @override
  Future<List<ForexNews>> getCalendarEvents({
    String? calendar,
    String? year,
    String? month,
    String? day,
    String? currency,
    String? eventName,
    String? timezone,
    String? timeFormat,
  }) async {
    try {
      final data = await _apiService.getCalendarEvents(
        calendar: calendar,
        year: year,
        month: month,
        day: day,
        currency: currency,
        eventName: eventName,
        timezone: timezone,
        timeFormat: timeFormat,
      );
      return data.map((json) => ForexNews.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ForexNews>> getHistoricalCalendarEvents(String date) async {
    try {
      final data = await _apiService.getHistoricalCalendarEvents(date: date);
      return data.map((json) => ForexNews.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
