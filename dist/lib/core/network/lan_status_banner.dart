import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/lan_status.dart';
import '../../core/network/lan_status_provider.dart';

class LWteomUUb38ZzMh extends ConsumerWidget {
  const LWteomUUb38ZzMh({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lanAsync = ref.watch(lanStatusProvider);

    return lanAsync.when(
      loading: () => _qM8xWv(
        context,
        icon: Icons.wifi_find,
        text: 'Verificando red empresarial…',
        tone: _HCxPZUXKXW.mVkpznn,
      ),
      error: (error, stackTrace) => _qM8xWv(
        context,
        icon: Icons.wifi_off,
        text: 'Sin conexión a la red empresarial',
        tone: _HCxPZUXKXW.v0mwW,
      ),
      data: (status) {
        switch (status) {
          case LanStatus.connected:
            return const SizedBox.shrink(); // oculto cuando todo está bien
          case LanStatus.serverDown:
            return _qM8xWv(
              context,
              icon: Icons.cloud_off,
              text: 'Servidor interno no disponible',
              tone: _HCxPZUXKXW.mVkpznn,
            );
          case LanStatus.disconnected:
          default:
            return _qM8xWv(
              context,
              icon: Icons.wifi_off,
              text: 'Fuera de la red empresarial',
              tone: _HCxPZUXKXW.v0mwW,
            );
        }
      },
    );
  }

  Widget _qM8xWv(
    BuildContext context, {
    required IconData icon,
    required String text,
    required _HCxPZUXKXW tone,
  }) {
    final cs = Theme.of(context).colorScheme;

    final (bg, fg, border) = switch (tone) {
      _HCxPZUXKXW.v0mwW => (
        cs.errorContainer,
        cs.onErrorContainer,
        cs.error.withAlpha(120),
      ),
      _HCxPZUXKXW.mVkpznn => (
        cs.tertiaryContainer,
        cs.onTertiaryContainer,
        cs.tertiary.withAlpha(120),
      ),
      _HCxPZUXKXW.rijv => (
        cs.primaryContainer,
        cs.onPrimaryContainer,
        cs.primary.withAlpha(120),
      ),
    };

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(18),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Icon(icon, color: fg),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: fg, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _HCxPZUXKXW { rijv, mVkpznn, v0mwW }
