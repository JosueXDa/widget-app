import 'package:flutter/material.dart';
import 'package:widget_app/presentation/widgets/atoms/text.dart';
import 'package:widget_app/presentation/widgets/atoms/spacer.dart';

/// Componente Molécula: Tarjeta de noticia
class MoleculeNewsCard extends StatelessWidget {
  final String title;
  final String currency;
  final String impact;
  final String forecast;
  final String previous;
  final DateTime date;
  final VoidCallback? onTap;

  const MoleculeNewsCard({
    super.key,
    required this.title,
    required this.currency,
    required this.impact,
    required this.forecast,
    required this.previous,
    required this.date,
    this.onTap,
  });

  Color _getImpactColor(String impact) {
    switch (impact.toLowerCase()) {
      case 'high impact expected':
        return Colors.red;
      case 'medium impact expected':
        return Colors.orange;
      case 'low impact expected':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AtomText(  
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getImpactColor(impact),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: AtomText(
                      impact.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const AtomSpacer(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _InfoColumn(
                      label: 'Currency',
                      value: currency,
                    ),
                  ),
                  Expanded(
                    child: _InfoColumn(
                      label: 'Forecast',
                      value: forecast.isEmpty ? 'N/A' : forecast,
                    ),
                  ),
                  Expanded(
                    child: _InfoColumn(
                      label: 'Previous',
                      value: previous.isEmpty ? 'N/A' : previous,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomText(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const AtomSpacer(height: 4),
        AtomText(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          maxLines: 1,
        ),
      ],
    );
  }
}
