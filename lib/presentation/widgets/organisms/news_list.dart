import 'package:flutter/material.dart';
import 'package:widget_app/domain/models/forex_news.dart';
import 'package:widget_app/presentation/widgets/molecules/news_card.dart';
import 'package:widget_app/presentation/widgets/atoms/spacer.dart';

/// Componente Organismo: Lista de noticias
class OrganismNewsList extends StatelessWidget {
  final List<ForexNews> news;
  final bool isLoading;
  final String? error;
  final VoidCallback? onRetry;
  final ScrollController? scrollController;

  const OrganismNewsList({
    super.key,
    required this.news,
    this.isLoading = false,
    this.error,
    this.onRetry,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const AtomSpacer(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Error: $error',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const AtomSpacer(height: 16),
            if (onRetry != null)
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
          ],
        ),
      );
    }

    if (news.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.inbox,
              size: 64,
              color: Colors.grey,
            ),
            const AtomSpacer(height: 16),
            Text(
              'No news available',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (context, index) {
        final newsItem = news[index];
        return MoleculeNewsCard(
          title: newsItem.title,
          currency: newsItem.currency,
          impact: newsItem.impact,
          forecast: newsItem.forecast,
          previous: newsItem.previous,
          date: newsItem.date,
          onTap: () {
            // Implementar navegación a detalles
          },
        );
      },
    );
  }
}
