import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import 'combustible_providers.dart';
import 'combustible_historial_page.dart';

class Zy1QHYyt2ixrp90 extends ConsumerStatefulWidget {
  final GerenciaTheme dWOfN;

  const Zy1QHYyt2ixrp90({super.key, required this.dWOfN});

  @override
  ConsumerState<Zy1QHYyt2ixrp90> createState() => _QISmtDZDqmxWhYdIpVPQ();
}

class _QISmtDZDqmxWhYdIpVPQ extends ConsumerState<Zy1QHYyt2ixrp90> {
  String _pxwBWBWontuW = 'usar_vehiculo';
  final ImagePicker _yxqA2F = ImagePicker();

  // Listas para almacenar fotos
  final List<XFile> _cbZA8TaYgKnD = [];
  final List<XFile> _wZrKJpLU7R3CAo = [];
  final List<XFile> _vmybZ3VSdyy = [];

  // Listas para fotos de usar vehículo
  final List<XFile> _g4O9joQmGonv3hXMpLmP = [];
  final List<XFile> _ca6von1vUumXHtrfLD = [];

  // Controllers para Usar Vehículo
  final _b5JFu7ZL6sHiWkLi = TextEditingController();
  final _tmVVsZqJ7S8AXjldiY = TextEditingController();
  final _wRV5xqcKPQZkMq3dG = TextEditingController();
  final _ymrOmbvZmsYQtip53zJJ = TextEditingController();
  final _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G = TextEditingController();
  final _bCs2HEcLesKbbDfnvPPvfCxaRW5y = TextEditingController();
  final _eL76aAqBDANtwOAAb7I = TextEditingController();
  final _xUUg3VG9boilrwKaQnnkjk3s6H = TextEditingController();
  final _oW1xNeOeXiFysCdsrxgLMNeb3g = TextEditingController();

  // Controllers para Cargar Combustible
  final _etLMIfTDFaTx9LSleVXg = TextEditingController();
  final _me2Vfny7UQXGWhUmkf = TextEditingController();
  final _uwZZBZyOhu1VN4ml6note5v = TextEditingController();
  final _mygVaHTguRQwjkdqUxOchF = TextEditingController();
  final _jb4X4KGtlXRRbUwpvnHqu0KT = TextEditingController();

  @override
  void dispose() {
    _b5JFu7ZL6sHiWkLi.dispose();
    _tmVVsZqJ7S8AXjldiY.dispose();
    _wRV5xqcKPQZkMq3dG.dispose();
    _ymrOmbvZmsYQtip53zJJ.dispose();
    _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G.dispose();
    _bCs2HEcLesKbbDfnvPPvfCxaRW5y.dispose();
    _eL76aAqBDANtwOAAb7I.dispose();
    _xUUg3VG9boilrwKaQnnkjk3s6H.dispose();
    _oW1xNeOeXiFysCdsrxgLMNeb3g.dispose();
    _etLMIfTDFaTx9LSleVXg.dispose();
    _me2Vfny7UQXGWhUmkf.dispose();
    _uwZZBZyOhu1VN4ml6note5v.dispose();
    _mygVaHTguRQwjkdqUxOchF.dispose();
    _jb4X4KGtlXRRbUwpvnHqu0KT.dispose();
    super.dispose();
  }

  LinearGradient get _isfRlHc9V0tzjj => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [widget.dWOfN.colorPrimario, widget.dWOfN.colorSecundario],
  );

  Future<XFile?> _wKKZ9vaMCbWR(XFile file, {required String prefix}) async {
    final sourcePath = file.path;
    final sourceFile = File(sourcePath);
    if (!await sourceFile.exists()) return null;

    final dir = await getApplicationDocumentsDirectory();
    final targetDir = Directory(p.join(dir.path, 'combustible_images'));
    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }

    final ext = p.extension(sourcePath);
    final fileName = '${prefix}_${DateTime.now().millisecondsSinceEpoch}$ext';
    final newPath = p.join(targetDir.path, fileName);
    await sourceFile.copy(newPath);
    return XFile(newPath);
  }

  Future<void> _zrLTpoUiw(String tipo) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: widget.dWOfN.colorPrimario,
                ),
                title: const Text('Tomar foto'),
                onTap: () async {
                  Navigator.pop(context);
                  final photo = await _yxqA2F.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 70,
                    maxWidth: 1600,
                    maxHeight: 1600,
                  );
                  if (photo == null || !mounted) return;
                  try {
                    final stored = await _wKKZ9vaMCbWR(photo, prefix: tipo);
                    if (stored == null || !mounted) return;
                    setState(() {
                      if (tipo == 'kmAntes') {
                        _cbZA8TaYgKnD.add(stored);
                      } else if (tipo == 'kmDespues') {
                        _wZrKJpLU7R3CAo.add(stored);
                      } else if (tipo == 'ticket') {
                        _vmybZ3VSdyy.add(stored);
                      } else if (tipo == 'registroInicial') {
                        _g4O9joQmGonv3hXMpLmP.add(stored);
                      } else if (tipo == 'registroFinal') {
                        _ca6von1vUumXHtrfLD.add(stored);
                      }
                    });
                  } catch (_) {
                    if (!mounted) return;
                    _gFWbjB37b('No se pudo guardar la foto.');
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: widget.dWOfN.colorPrimario,
                ),
                title: const Text('Seleccionar de galería'),
                onTap: () async {
                  Navigator.pop(context);
                  final photo = await _yxqA2F.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 70,
                    maxWidth: 1600,
                    maxHeight: 1600,
                  );
                  if (photo == null || !mounted) return;
                  try {
                    final stored = await _wKKZ9vaMCbWR(photo, prefix: tipo);
                    if (stored == null || !mounted) return;
                    setState(() {
                      if (tipo == 'kmAntes') {
                        _cbZA8TaYgKnD.add(stored);
                      } else if (tipo == 'kmDespues') {
                        _wZrKJpLU7R3CAo.add(stored);
                      } else if (tipo == 'ticket') {
                        _vmybZ3VSdyy.add(stored);
                      } else if (tipo == 'registroInicial') {
                        _g4O9joQmGonv3hXMpLmP.add(stored);
                      } else if (tipo == 'registroFinal') {
                        _ca6von1vUumXHtrfLD.add(stored);
                      }
                    });
                  } catch (_) {
                    if (!mounted) return;
                    _gFWbjB37b('No se pudo guardar la foto.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gFWbjB37b(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _vH5nGeyxAQBEM8P602GQtCpror() async {
    final auth = ref.read(authControllerProvider);
    final userId = auth.user?.id;
    final gerenciaNombre = auth.user?.gerencia;
    final gerenciaId = auth.user?.resolvedGerenciaId;
    if (userId == null || userId.isEmpty) {
      _gFWbjB37b('Sesión no válida. Inicia sesión de nuevo.');
      return;
    }

    final nombre = _b5JFu7ZL6sHiWkLi.text.trim();
    final destino = _wRV5xqcKPQZkMq3dG.text.trim();
    final vehiculo = _tmVVsZqJ7S8AXjldiY.text.trim();
    if (nombre.isEmpty || destino.isEmpty || vehiculo.isEmpty) {
      _gFWbjB37b('Completa nombre, vehículo y destino.');
      return;
    }

    final kmIni = int.tryParse(_bCs2HEcLesKbbDfnvPPvfCxaRW5y.text.trim());
    final kmFin = int.tryParse(_oW1xNeOeXiFysCdsrxgLMNeb3g.text.trim());

    final metadata = <String, dynamic>{
      'fotosRegistroInicial': _g4O9joQmGonv3hXMpLmP.map((f) => f.path).toList(),
      'fotosRegistroFinal': _ca6von1vUumXHtrfLD.map((f) => f.path).toList(),
    };

    await ref
        .read(combustibleRepositoryProvider)
        .guardarUsoVehiculo(
          usuarioId: userId,
          gerenciaNombre: gerenciaNombre,
          gerenciaId: gerenciaId,
          nombre: nombre,
          vehiculo: vehiculo,
          destino: destino,
          horaInicio: _ymrOmbvZmsYQtip53zJJ.text.trim().isEmpty
              ? null
              : _ymrOmbvZmsYQtip53zJJ.text.trim(),
          combustibleInicial: _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G.text.trim().isEmpty
              ? null
              : _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G.text.trim(),
          kilometrajeInicial: kmIni,
          horaFinal: _eL76aAqBDANtwOAAb7I.text.trim().isEmpty
              ? null
              : _eL76aAqBDANtwOAAb7I.text.trim(),
          combustibleFinal: _xUUg3VG9boilrwKaQnnkjk3s6H.text.trim().isEmpty
              ? null
              : _xUUg3VG9boilrwKaQnnkjk3s6H.text.trim(),
          kilometrajeFinal: kmFin,
          metadata: metadata,
        );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('Registro guardado'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _zt5k2e6xgT1WicFZEJC2e60() async {
    final auth = ref.read(authControllerProvider);
    final userId = auth.user?.id;
    final gerenciaNombre = auth.user?.gerencia;
    final gerenciaId = auth.user?.resolvedGerenciaId;
    if (userId == null || userId.isEmpty) {
      _gFWbjB37b('Sesión no válida. Inicia sesión de nuevo.');
      return;
    }

    final operador = _me2Vfny7UQXGWhUmkf.text.trim();
    final vehiculo = _uwZZBZyOhu1VN4ml6note5v.text.trim();
    if (operador.isEmpty || vehiculo.isEmpty) {
      _gFWbjB37b('Ingresa operador y vehículo.');
      return;
    }

    final kmAntes = int.tryParse(_mygVaHTguRQwjkdqUxOchF.text.trim());
    final kmDespues = int.tryParse(_jb4X4KGtlXRRbUwpvnHqu0KT.text.trim());
    if (kmAntes == null || kmDespues == null) {
      _gFWbjB37b('Ingresa kilometraje antes y después.');
      return;
    }

    final metadata = <String, dynamic>{
      'fotosKmAntes': _cbZA8TaYgKnD.map((f) => f.path).toList(),
      'fotosKmDespues': _wZrKJpLU7R3CAo.map((f) => f.path).toList(),
      'fotosTicket': _vmybZ3VSdyy.map((f) => f.path).toList(),
    };

    await ref
        .read(combustibleRepositoryProvider)
        .guardarCargaCombustible(
          usuarioId: userId,
          fechaCarga: _etLMIfTDFaTx9LSleVXg.text.trim().isEmpty
              ? null
              : _etLMIfTDFaTx9LSleVXg.text.trim(),
          operador: operador,
          vehiculo: vehiculo,
          gerenciaNombre: gerenciaNombre,
          gerenciaId: gerenciaId,
          kmAntes: kmAntes,
          kmDespues: kmDespues,
          metadata: metadata,
        );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('Carga de combustible registrada'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _akrih0BkcXo(String tipo, int index) {
    setState(() {
      if (tipo == 'kmAntes') {
        _cbZA8TaYgKnD.removeAt(index);
      } else if (tipo == 'kmDespues') {
        _wZrKJpLU7R3CAo.removeAt(index);
      } else if (tipo == 'ticket') {
        _vmybZ3VSdyy.removeAt(index);
      } else if (tipo == 'registroInicial') {
        _g4O9joQmGonv3hXMpLmP.removeAt(index);
      } else if (tipo == 'registroFinal') {
        _ca6von1vUumXHtrfLD.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pendientesAsync = ref.watch(combustiblePendientesCountProvider);
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GerenciaAppBar(
        theme: widget.dWOfN,
        title: 'Combustible',
        showBack: false,
        actions: [
          IconButton(
            tooltip: 'Historial',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Wf4ddykqAEjGBjQGuK0wZvrD(hVHqc: widget.dWOfN),
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isTablet ? 32 : 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pendientesAsync.when(
                data: (count) {
                  if (count <= 0) return const SizedBox.shrink();
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.orange.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Text(
                      'Tienes $count registros pendientes por subir. Se enviarán cuando haya conexión al servidor.',
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (err, _) => const SizedBox.shrink(),
              ),
              // Header
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: _isfRlHc9V0tzjj,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: widget.dWOfN.colorPrimario.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_gas_station,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Control de Combustible',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Opciones de acción
              SizedBox(
                height: 160,
                child: Row(
                  children: [
                    Expanded(
                      child: _WRGFf1GQve(
                        erl7t: widget.dWOfN,
                        mZky: Icons.directions_car,
                        dEfrh: 'Usar Vehículo',
                        tW39qbU9: 'Registrar uso',
                        u6QXMZTrTK: _pxwBWBWontuW == 'usar_vehiculo',
                        z68ux: () =>
                            setState(() => _pxwBWBWontuW = 'usar_vehiculo'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _WRGFf1GQve(
                        erl7t: widget.dWOfN,
                        mZky: Icons.local_gas_station,
                        dEfrh: 'Cargar Combustible',
                        tW39qbU9: 'Registrar carga',
                        u6QXMZTrTK: _pxwBWBWontuW == 'cargar_combustible',
                        z68ux: () => setState(
                          () => _pxwBWBWontuW = 'cargar_combustible',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Formulario dinámico
              _pxwBWBWontuW == 'usar_vehiculo'
                  ? KeyedSubtree(
                      key: const ValueKey('usar_vehiculo_form'),
                      child: _f2i8QA2RDLwGCNZfqX3ki(),
                    )
                  : KeyedSubtree(
                      key: const ValueKey('cargar_combustible_form'),
                      child: _boy9EAD3E6ZGFhBIjRWHGOaKOC(),
                    ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _f2i8QA2RDLwGCNZfqX3ki() {
    return Column(
      children: [
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Información del Conductor',
          dfmD: Icons.person,
          wK4E4H7j: [
            _MggxJjOvK(
              icxZzHVnGY: _b5JFu7ZL6sHiWkLi,
              xzFSr: 'Nombre del conductor',
              tVLT: 'Ingrese nombre completo',
              l4w3: Icons.badge,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _tmVVsZqJ7S8AXjldiY,
              xzFSr: 'Vehículo',
              tVLT: 'Ej: unidad / placas / ID',
              l4w3: Icons.directions_car,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _wRV5xqcKPQZkMq3dG,
              xzFSr: 'Destino',
              tVLT: 'Ingrese destino',
              l4w3: Icons.location_on,
              zpggd: widget.dWOfN,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Registro Inicial',
          dfmD: Icons.play_circle_outline,
          wK4E4H7j: [
            Row(
              children: [
                Expanded(
                  child: _MggxJjOvK(
                    icxZzHVnGY: _ymrOmbvZmsYQtip53zJJ,
                    xzFSr: 'Hora de inicio',
                    tVLT: 'Seleccionar',
                    l4w3: Icons.access_time,
                    iE7Dedg9: true,
                    zpggd: widget.dWOfN,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    gradient: _isfRlHc9V0tzjj,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null && mounted) {
                        setState(() {
                          _ymrOmbvZmsYQtip53zJJ.text = picked.format(context);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G,
              xzFSr: 'Nivel de combustible',
              tVLT: 'Ej: 3/4, 1/2, Full',
              l4w3: Icons.local_gas_station,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _bCs2HEcLesKbbDfnvPPvfCxaRW5y,
              xzFSr: 'Kilometraje',
              tVLT: 'Ingrese kilometraje',
              l4w3: Icons.speed,
              hc2WD7LXkZwJ: TextInputType.number,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _Pv08QYJgiL9C(
              qb8Q6: widget.dWOfN,
              iHcAp: 'Fotos del registro inicial',
              beJvB: _g4O9joQmGonv3hXMpLmP,
              ytSbn: () => _zrLTpoUiw('registroInicial'),
              fXO5ulZgBb: (i) => _akrih0BkcXo('registroInicial', i),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Registro Final',
          dfmD: Icons.stop_circle_outlined,
          wK4E4H7j: [
            Row(
              children: [
                Expanded(
                  child: _MggxJjOvK(
                    icxZzHVnGY: _eL76aAqBDANtwOAAb7I,
                    xzFSr: 'Hora final',
                    tVLT: 'Seleccionar',
                    l4w3: Icons.access_time,
                    iE7Dedg9: true,
                    zpggd: widget.dWOfN,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    gradient: _isfRlHc9V0tzjj,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null && mounted) {
                        setState(() {
                          _eL76aAqBDANtwOAAb7I.text = picked.format(context);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _xUUg3VG9boilrwKaQnnkjk3s6H,
              xzFSr: 'Nivel de combustible',
              tVLT: 'Ej: 3/4, 1/2, Full',
              l4w3: Icons.local_gas_station,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _oW1xNeOeXiFysCdsrxgLMNeb3g,
              xzFSr: 'Kilometraje',
              tVLT: 'Ingrese kilometraje',
              l4w3: Icons.speed,
              hc2WD7LXkZwJ: TextInputType.number,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _Pv08QYJgiL9C(
              qb8Q6: widget.dWOfN,
              iHcAp: 'Fotos del registro final',
              beJvB: _ca6von1vUumXHtrfLD,
              ytSbn: () => _zrLTpoUiw('registroFinal'),
              fXO5ulZgBb: (i) => _akrih0BkcXo('registroFinal', i),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.dWOfN.colorPrimario,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            onPressed: () {
              _vH5nGeyxAQBEM8P602GQtCpror();
            },
            icon: const Icon(Icons.save, size: 20),
            label: const Text(
              'Guardar Registro',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _boy9EAD3E6ZGFhBIjRWHGOaKOC() {
    return Column(
      children: [
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Información de Carga',
          dfmD: Icons.local_gas_station,
          wK4E4H7j: [
            Row(
              children: [
                Expanded(
                  child: _MggxJjOvK(
                    icxZzHVnGY: _etLMIfTDFaTx9LSleVXg,
                    xzFSr: 'Fecha de carga',
                    tVLT: 'Seleccionar',
                    l4w3: Icons.calendar_today,
                    iE7Dedg9: true,
                    zpggd: widget.dWOfN,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    gradient: _isfRlHc9V0tzjj,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null && mounted) {
                        setState(() {
                          _etLMIfTDFaTx9LSleVXg.text =
                              '${picked.day}/${picked.month}/${picked.year}';
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _me2Vfny7UQXGWhUmkf,
              xzFSr: 'Operador',
              tVLT: 'Nombre del operador',
              l4w3: Icons.person,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _MggxJjOvK(
              icxZzHVnGY: _uwZZBZyOhu1VN4ml6note5v,
              xzFSr: 'Vehículo',
              tVLT: 'Ej: unidad / placas / ID',
              l4w3: Icons.directions_car,
              zpggd: widget.dWOfN,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Kilometraje Antes de Cargar',
          dfmD: Icons.speed,
          wK4E4H7j: [
            _MggxJjOvK(
              icxZzHVnGY: _mygVaHTguRQwjkdqUxOchF,
              xzFSr: 'Kilómetros antes',
              tVLT: 'Ingrese kilometraje',
              l4w3: Icons.speed,
              hc2WD7LXkZwJ: TextInputType.number,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _Pv08QYJgiL9C(
              qb8Q6: widget.dWOfN,
              iHcAp: 'Foto de kilometraje antes',
              beJvB: _cbZA8TaYgKnD,
              ytSbn: () => _zrLTpoUiw('kmAntes'),
              fXO5ulZgBb: (i) => _akrih0BkcXo('kmAntes', i),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Kilometraje Después de Cargar',
          dfmD: Icons.speed,
          wK4E4H7j: [
            _MggxJjOvK(
              icxZzHVnGY: _jb4X4KGtlXRRbUwpvnHqu0KT,
              xzFSr: 'Kilómetros después',
              tVLT: 'Ingrese kilometraje',
              l4w3: Icons.speed,
              hc2WD7LXkZwJ: TextInputType.number,
              zpggd: widget.dWOfN,
            ),
            const SizedBox(height: 16),
            _Pv08QYJgiL9C(
              qb8Q6: widget.dWOfN,
              iHcAp: 'Foto de kilometraje después',
              beJvB: _wZrKJpLU7R3CAo,
              ytSbn: () => _zrLTpoUiw('kmDespues'),
              fXO5ulZgBb: (i) => _akrih0BkcXo('kmDespues', i),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _J8hFuTasO0s(
          mKaS0: widget.dWOfN,
          qCA7B: 'Ticket de Carga',
          dfmD: Icons.receipt,
          wK4E4H7j: [
            _Pv08QYJgiL9C(
              qb8Q6: widget.dWOfN,
              iHcAp: 'Foto del ticket',
              beJvB: _vmybZ3VSdyy,
              ytSbn: () => _zrLTpoUiw('ticket'),
              fXO5ulZgBb: (i) => _akrih0BkcXo('ticket', i),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.dWOfN.colorPrimario,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            onPressed: () {
              _zt5k2e6xgT1WicFZEJC2e60();
            },
            icon: const Icon(Icons.save, size: 20),
            label: const Text('Guardar Carga', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class _WRGFf1GQve extends StatelessWidget {
  final GerenciaTheme erl7t;
  final IconData mZky;
  final String dEfrh;
  final String tW39qbU9;
  final bool u6QXMZTrTK;
  final VoidCallback z68ux;

  const _WRGFf1GQve({
    required this.erl7t,
    required this.mZky,
    required this.dEfrh,
    required this.tW39qbU9,
    required this.u6QXMZTrTK,
    required this.z68ux,
  });

  LinearGradient get _zhTJh5aK => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [erl7t.colorPrimario, erl7t.colorSecundario],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: u6QXMZTrTK ? erl7t.colorPrimario : Colors.grey[300]!,
          width: u6QXMZTrTK ? 2 : 1,
        ),
        boxShadow: [
          if (u6QXMZTrTK)
            BoxShadow(
              color: erl7t.colorPrimario.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: z68ux,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: u6QXMZTrTK ? _zhTJh5aK : null,
                    color: u6QXMZTrTK ? null : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    mZky,
                    color: u6QXMZTrTK ? Colors.white : Colors.grey[600],
                    size: 32,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dEfrh,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: u6QXMZTrTK ? erl7t.colorPrimario : Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  tW39qbU9,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _J8hFuTasO0s extends StatelessWidget {
  final GerenciaTheme mKaS0;
  final String qCA7B;
  final IconData dfmD;
  final List<Widget> wK4E4H7j;

  const _J8hFuTasO0s({
    required this.mKaS0,
    required this.qCA7B,
    required this.dfmD,
    required this.wK4E4H7j,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [mKaS0.colorPrimario, mKaS0.colorSecundario],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(dfmD, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    qCA7B,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: wK4E4H7j),
          ),
        ],
      ),
    );
  }
}

class _MggxJjOvK extends StatelessWidget {
  final TextEditingController icxZzHVnGY;
  final String xzFSr;
  final String tVLT;
  final IconData l4w3;
  final GerenciaTheme zpggd;
  final bool iE7Dedg9;
  final TextInputType? hc2WD7LXkZwJ;

  const _MggxJjOvK({
    required this.icxZzHVnGY,
    required this.xzFSr,
    required this.tVLT,
    required this.l4w3,
    required this.zpggd,
    this.iE7Dedg9 = false,
    this.hc2WD7LXkZwJ,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return TextField(
      controller: icxZzHVnGY,
      readOnly: iE7Dedg9,
      keyboardType: hc2WD7LXkZwJ,
      maxLines: 1,
      cursorColor: zpggd.colorPrimario,
      decoration: InputDecoration(
        labelText: xzFSr,
        hintText: tVLT,
        labelStyle: TextStyle(color: cs.onSurfaceVariant),
        floatingLabelStyle: TextStyle(color: cs.primary),
        prefixIcon: Icon(l4w3, color: cs.primary),
      ),
    );
  }
}

class _Pv08QYJgiL9C extends StatelessWidget {
  final GerenciaTheme qb8Q6;
  final String iHcAp;
  final List<XFile> beJvB;
  final VoidCallback ytSbn;
  final void Function(int index) fXO5ulZgBb;

  const _Pv08QYJgiL9C({
    required this.qb8Q6,
    required this.iHcAp,
    required this.beJvB,
    required this.ytSbn,
    required this.fXO5ulZgBb,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          iHcAp,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        if (beJvB.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[50],
            ),
            child: Column(
              children: [
                Icon(
                  Icons.add_photo_alternate,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 8),
                Text('Sin fotos', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < beJvB.length; i++)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(beJvB[i].path),
                        width: isTablet ? 120 : 100,
                        height: isTablet ? 120 : 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => fXO5ulZgBb(i),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: ytSbn,
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Agregar foto'),
            style: OutlinedButton.styleFrom(
              foregroundColor: qb8Q6.colorPrimario,
              side: BorderSide(color: qb8Q6.colorPrimario),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
