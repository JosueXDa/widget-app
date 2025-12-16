import 'package:flutter/material.dart';
import 'package:widget_app/domain/models/forex_news.dart';
import 'package:widget_app/domain/usecases/forex_usecases.dart';

class ForexNewsProvider with ChangeNotifier {
  final GetForexNewsUseCase _getForexNewsUseCase;
  final GetHistoricalForexNewsUseCase _getHistoricalForexNewsUseCase;

  List<ForexNews> _news = [];
  bool _isLoading = false;
  String? _error;

  ForexNewsProvider({
    required GetForexNewsUseCase getForexNewsUseCase,
    required GetHistoricalForexNewsUseCase getHistoricalForexNewsUseCase,
  })  : _getForexNewsUseCase = getForexNewsUseCase,
        _getHistoricalForexNewsUseCase = getHistoricalForexNewsUseCase;

  List<ForexNews> get news => _news;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchNews({
    DateTime? date,
    String? calendar,
    String? currency,
    String? eventName,
    String? timezone,
    String? timeFormat,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final selectedDate = date ?? DateTime.now();

      _news = await _getForexNewsUseCase(
        calendar: calendar,
        year: selectedDate.year.toString(),
        month: selectedDate.month.toString(),
        day: selectedDate.day.toString(),
        currency: currency,
        eventName: eventName,
        timezone: timezone,
        timeFormat: timeFormat,
      );
      _error = null;
    } catch (e) {
      _error = e.toString();
      _news = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchHistoricalNews({required DateTime date}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      _news = await _getHistoricalForexNewsUseCase(formattedDate);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _news = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
