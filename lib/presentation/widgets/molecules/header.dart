import 'package:flutter/material.dart';
import 'package:widget_app/presentation/widgets/atoms/text.dart';
import 'package:widget_app/presentation/widgets/atoms/spacer.dart';

/// Componente Molécula: Encabezado con título
class MoleculeHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const MoleculeHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomText(
          title,
          style: titleStyle ??
              Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
        ),
        if (subtitle != null) ...[
          const AtomSpacer(height: 8),
          AtomText(
            subtitle!,
            style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}
