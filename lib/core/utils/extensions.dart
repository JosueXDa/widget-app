import 'package:intl/intl.dart';

/// Extensiones para DateTime
extension DateTimeExtension on DateTime {
  /// Formatea la fecha en formato 'yyyy-MM-dd'
  String toFormattedString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  /// Formatea para mostrar al usuario (ej: "5 de enero de 2024")
  String toDisplayString() {
    return DateFormat('d \'de\' MMMM \'de\' yyyy', 'es_ES').format(this);
  }

  /// Retorna si es hoy
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Retorna si es ayer
  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }
}

/// Extensiones para String
extension StringExtension on String {
  /// Capitaliza la primera letra
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Valida si es un formato de fecha válido (yyyy-MM-dd)
  bool isValidDateFormat() {
    try {
      DateTime.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// Utilidades para validación
class ValidationUtils {
  /// Valida si un string es vacío o solo contiene espacios
  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Valida si el impacto es válido
  static bool isValidImpact(String impact) {
    final validImpacts = ['high', 'medium', 'low'];
    return validImpacts.contains(impact.toLowerCase());
  }
}

/// Utilidades para formato
class FormatUtils {
  /// Formatea números con separadores de miles
  static String formatNumber(num value) {
    return NumberFormat('#,##0.00').format(value);
  }

  /// Formatea porcentajes
  static String formatPercentage(num value) {
    return NumberFormat('#0.00%').format(value);
  }
}
