import 'package:flutter/material.dart';

class RUDy3rHvbE4usTSs extends StatelessWidget {
  final String? uLlAk;
  final String? qxr7HI1Y;
  final IconData? gB53;
  final Widget eO2jt;

  const RUDy3rHvbE4usTSs({
    super.key,
    this.uLlAk,
    this.qxr7HI1Y,
    this.gB53,
    required this.eO2jt,
  });

  @override
  Widget build(BuildContext context) {
    final hasHeader =
        (uLlAk != null && uLlAk!.trim().isNotEmpty) ||
        (qxr7HI1Y != null && qxr7HI1Y!.trim().isNotEmpty);
    final cs = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasHeader) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (gB53 != null) ...[
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: cs.primary.withAlpha(18),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(gB53, color: cs.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (uLlAk != null && uLlAk!.trim().isNotEmpty)
                          Text(
                            uLlAk!,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        if (qxr7HI1Y != null &&
                            qxr7HI1Y!.trim().isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            qxr7HI1Y!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Divider(color: cs.outlineVariant.withAlpha(110), height: 1),
              const SizedBox(height: 14),
            ],
            eO2jt,
          ],
        ),
      ),
    );
  }
}
