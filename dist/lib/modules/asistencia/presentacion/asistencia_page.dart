import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gto_docs_v2_ad/modules/asistencia/presentacion/asistencia_controller.dart';

import '../domain/asistencia.dart';
import 'asistencia_providers.dart';

class GeLgELufCG5DMw extends ConsumerWidget {
  final String zoeT54id2;

  const GeLgELufCG5DMw({
    super.key,
    required this.zoeT54id2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asistenciaControllerProvider);

    ref.listen<AsistenciaState>(
      asistenciaControllerProvider,
      (prev, next) {
        if (next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.bAPqE08)
              const CircularProgressIndicator(),

            if (!state.bAPqE08) ...[
              _VLq9YHQrFxbrwJ7v(
                eJevc: 'Registrar Entrada',
                lZvx: Icons.login,
                xFbhq: Colors.green,
                suF5u8aqv: () {
                  ref
                      .read(asistenciaControllerProvider.notifier)
                      .uJdPtHtTtxc2AOJBQlk(
                        usuarioId: zoeT54id2,
                        tipo: TipoAsistencia.entrada,
                      );
                },
              ),
              const SizedBox(height: 16),
              _VLq9YHQrFxbrwJ7v(
                eJevc: 'Registrar Salida',
                lZvx: Icons.logout,
                xFbhq: Colors.red,
                suF5u8aqv: () {
                  ref
                      .read(asistenciaControllerProvider.notifier)
                      .uJdPtHtTtxc2AOJBQlk(
                        usuarioId: zoeT54id2,
                        tipo: TipoAsistencia.salida,
                      );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _VLq9YHQrFxbrwJ7v extends StatelessWidget {
  final String eJevc;
  final IconData lZvx;
  final Color xFbhq;
  final VoidCallback suF5u8aqv;

  const _VLq9YHQrFxbrwJ7v({
    required this.eJevc,
    required this.lZvx,
    required this.xFbhq,
    required this.suF5u8aqv,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        icon: Icon(lZvx),
        label: Text(eJevc),
        style: ElevatedButton.styleFrom(
          backgroundColor: xFbhq,
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: suF5u8aqv,
      ),
    );
  }
}