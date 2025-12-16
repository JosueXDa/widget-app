import 'package:flutter/material.dart';

/// Componente Átomo: Espaciador para mantener consistencia de espacios
class AtomSpacer extends StatelessWidget {
  final double height;
  final double width;

  const AtomSpacer({
    super.key,
    this.height = 16,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
