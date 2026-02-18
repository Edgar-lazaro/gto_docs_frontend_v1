import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/lan_status.dart';
import '../../../core/network/lan_status_provider.dart';
import '../domain/asistencia.dart';
import '../domain/asistencia_repository.dart';

class AsistenciaState {
  final bool bAPqE08;
  final String? ibhrX;

  const AsistenciaState({
    this.bAPqE08 = false,
    this.ibhrX,
  });

  AsistenciaState copyWith({
    bool? loading,
    String? error,
  }) {
    return AsistenciaState(
      bAPqE08: loading ?? this.bAPqE08,
      ibhrX: error,
    );
  }
}

class WFCAuC3v1ianMKpJAKtS
    extends StateNotifier<AsistenciaState> {
  final AsistenciaRepository eAIrDoPzhH;
  final Ref gV2;

  WFCAuC3v1ianMKpJAKtS(this.eAIrDoPzhH, this.gV2)
      : super(const AsistenciaState());

  Future<void> uJdPtHtTtxc2AOJBQlk({
    required String usuarioId,
    required TipoAsistencia tipo,
    String metodo = 'manual',
  }) async {
    // Validar LAN
    final lanStatus = gV2.read(lanStatusProvider).maybeWhen(
          data: (s) => s,
          orElse: () => LanStatus.disconnected,
        );

    if (lanStatus != LanStatus.connected) {
      state = state.copyWith(
        error: 'Debes estar conectado a la red del aeropuerto',
      );
      return;
    }

    // Registrar
    state = state.copyWith(loading: true, error: null);

    try {
      await eAIrDoPzhH.registrar(
        usuarioId: usuarioId,
        tipo: tipo,
        metodo: metodo,
      );

      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(
        loading: false,
        error: 'No se pudo registrar la asistencia',
      );
    }
  }
}