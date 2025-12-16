import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:widget_app/config/constants.dart';

class ForexApiService {
  final Dio _dio;

  ForexApiService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Map<String, dynamic>>> getCalendarEvents({
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
      final queryParams = <String, dynamic>{};
      
      if (calendar != null) queryParams['calendar'] = calendar;
      if (year != null) queryParams['year'] = year;
      if (month != null) queryParams['month'] = month;
      if (day != null) queryParams['day'] = day;
      if (currency != null) queryParams['currency'] = currency;
      if (eventName != null) queryParams['event_name'] = eventName;
      if (timezone != null) queryParams['timezone'] = timezone;
      if (timeFormat != null) queryParams['time_format'] = timeFormat;

      final response = await _dio.get(
        '${ApiConfig.baseUrl}/get_real_time_calendar_details',
        options: Options(
          headers: {
            'X-RapidAPI-Key': ApiConfig.rapidApiKey,
            'X-RapidAPI-Host': ApiConfig.rapidApiHost,
          },
        ),
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load calendar events: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      log('Exception: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getHistoricalCalendarEvents({
    required String date,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}/calendar/historical',
        options: Options(
          headers: {
            'X-RapidAPI-Key': ApiConfig.rapidApiKey,
            'X-RapidAPI-Host': ApiConfig.rapidApiHost,
          },
        ),
        queryParameters: {
          'date': date,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load historical calendar events: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      log('Exception: $e');
      rethrow;
    }
  }
}
