class ForexNews {
  final String id;
  final String title;
  final String currency;
  final String impact;
  final String forecast;
  final String previous;
  final DateTime date;
  final String source;

  const ForexNews({
    required this.id,
    required this.title,
    required this.currency,
    required this.impact,
    required this.forecast,
    required this.previous,
    required this.date,
    required this.source,
  });

  factory ForexNews.fromJson(Map<String, dynamic> json) {
    return ForexNews(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      currency: json['currency'] ?? '',
      impact: json['impact'] ?? '',
      forecast: json['forecast'] ?? '',
      previous: json['previous'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      source: json['source'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'currency': currency,
      'impact': impact,
      'forecast': forecast,
      'previous': previous,
      'date': date.toIso8601String(),
      'source': source,
    };
  }

  @override
  String toString() => title;
}
