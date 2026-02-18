import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drift/drift.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/asn1.dart';
import 'package:local_auth/local_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http_parser/http_parser.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class OmPdpPamtI5ZmWcPvp extends ConsumerWidget {
  final String fvxRg7LDA;

  const OmPdpPamtI5ZmWcPvp({super.key, required this.fvxRg7LDA});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reporteAsync = ref.watch(reportePorIdProvider(fvxRg7LDA));
    final evidenciasAsync = ref.watch(evidenciasPorReporteProvider(fvxRg7LDA));

    return reporteAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(body: Text('Error: $e')),
      data: (reporte) {
        return Scaffold(
          appBar: AppBar(title: Text(reporte.titulo)),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reporte.descripcion),
                const SizedBox(height: 12),
                Text('Área: ${reporte.area}'),
                Text('Estado: ${reporte.estado.asString}'),
                if (reporte.glpiTicketId != null)
                  Text('Ticket GLPI: ${reporte.glpiTicketId}'),

                const SizedBox(height: 16),

                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () async {
                    final picker = ImagePicker();
                    final file = await picker.pickImage(
                      source: ImageSource.camera,
                    );

                    if (file == null) return;

                    await ref
                        .read(reporteEvidenciasRepositoryProvider)
                        .agregarEvidencia(
                          reporteId: reporte.id,
                          tipo: EvidenciaTipo.imagen,
                          nombre: file.name,
                          localPath: file.path,
                        );
                  },
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: evidenciasAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Text('Error: $e'),
                    data: (evidencias) {
                      if (evidencias.isEmpty) {
                        return const Text('Sin evidencias');
                      }

                      return Wrap(
                        spacing: 8,
                        children: evidencias.map((e) {
                          return Image.file(
                            File(e.localPath),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum QtKS6L8GkbpOo8L8 {
  jckQ10R,
  dUupl,
  jId0Krq62,
  llJ7oGE,
}

class GG3BJCpBBiLe {
  final String cq;
  final QtKS6L8GkbpOo8L8 p0kp;
  final String upntYK;
  final String z3nXfKd;
  final String? tnxCmBvgJ0tC; // reporteId, tareaId, etc
  final DateTime yswdpfy7;
  final bool lg9Zj;

  GG3BJCpBBiLe({
    required this.cq,
    required this.p0kp,
    required this.upntYK,
    required this.z3nXfKd,
    this.tnxCmBvgJ0tC,
    required this.yswdpfy7,
    this.lg9Zj = false,
  });
}

class JUDTRkll5SW extends Table {
  TextColumn get af => text()();
  TextColumn get dLgRo6Yc => text().nullable()();
  TextColumn get xaGllZx => text().nullable()();
  TextColumn get lk7PrhZQJ => text()();
  TextColumn get cR8WrZ => text()();
  TextColumn get rrh87HdesU9 => text().withDefault(const Constant(''))();
  TextColumn get usVA1m1vs => text().nullable()();
  TextColumn get hfzQuOYjV => text()();
  TextColumn get zmlGl6 => text()();

  @override
  Set<Column> get primaryKey => {af};
}

class V2f48toe1jh85XfKaDD13v {
  static const _tre = 'generated_pdfs_v1';

  final SharedPreferences aPFsr;

  V2f48toe1jh85XfKaDD13v(this.aPFsr);

  List<Q3ORRT7xmyLi> irrmmV0() {
    final raw = aPFsr.getStringList(_tre) ?? const <String>[];
    final out = <Q3ORRT7xmyLi>[];
    for (final s in raw) {
      try {
        final m = jsonDecode(s);
        if (m is Map) {
          out.add(Q3ORRT7xmyLi.yOIFNA3A(m.cast<String, dynamic>()));
        }
      } catch (_) {}
    }
    out.sort((a, b) => b.e8oZ3Wfig.compareTo(a.e8oZ3Wfig));
    return out;
  }

  Future<void> fIk(Q3ORRT7xmyLi pdf) async {
    final list = irrmmV0();
    final next = [
      pdf,
      ...list,
    ].map((e) => jsonEncode(e.nZyuVf())).toList(growable: false);
    await aPFsr.setStringList(_tre, next);
  }

  bool pTHv4pd7AbrL(String path) {
    return irrmmV0().any((p) => p.bsgnqUUkv == path);
  }

  Future<void> jJb8lfsBjq7k({required String id, required String url}) async {
    final list = irrmmV0();
    final next = list
        .map(
          (e) => e.n4 == id ? e.phnNhahU(uploaded: true, uploadedUrl: url) : e,
        )
        .map((e) => jsonEncode(e.nZyuVf()))
        .toList(growable: false);
    await aPFsr.setStringList(_tre, next);
  }

  Q3ORRT7xmyLi? iKnYcR9suLAUJyiI2h({
    required int jefaturaId,
    required int checklistId,
  }) {
    for (final p in irrmmV0()) {
      if (p.aMJZYEAeTh == jefaturaId && p.zXBUacE2fth == checklistId) return p;
    }
    return null;
  }
}

class PD5JtSIi extends ConsumerStatefulWidget {
  const PD5JtSIi({super.key});

  @override
  ConsumerState<PD5JtSIi> createState() => _EQW4loSOcQADs();
}

class _EQW4loSOcQADs extends ConsumerState<PD5JtSIi> {
  @override
  Widget build(BuildContext context) {
    ref.watch(syncListenerProvider);

    final auth = ref.watch(authControllerProvider);

    if (auth.status == AuthStatus.unknown) {
      return const Center(child: CircularProgressIndicator());
    }

    if (auth.status == AuthStatus.blocked) {
      return const Center(child: Text('Aplicación deshabilitada'));
    }

    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const LoginPage();
    }

    return UnifiedHomeScreen(user: auth.user!);
  }
}

class IT74gf7ttgWdSEinAoqVCYTfmC9i {
  final AppDatabase l4;

  IT74gf7ttgWdSEinAoqVCYTfmC9i(this.l4);

  Future<void> ddGByN2tSsBB68j6A(ReporteComentario c) async {
    await l4
        .into(l4.reporteComentariosTable)
        .insert(
          ReporteComentariosTableCompanion.insert(
            id: c.id,
            reporteId: c.reporteId,
            autorId: c.autorId,
            mensaje: c.mensaje,
            creadoEn: c.creadoEn,
          ),
        );

    await l4
        .into(l4.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'reporte_comentario',
            entidadId: c.id,
            accion: 'create',
            payload: Value({
              'id': c.id,
              'reporteId': c.reporteId,
              'usuarioId': c.autorId,
              'mensaje': c.mensaje,
            }),
          ),
        );
  }
}

class K3GxSJcRB3IG extends ConsumerStatefulWidget {
  final GerenciaTheme wEBAF;

  const K3GxSJcRB3IG({super.key, required this.wEBAF});

  @override
  ConsumerState<K3GxSJcRB3IG> createState() => _NK2mTeVM6SRR4qnO8();
}

class _NK2mTeVM6SRR4qnO8 extends ConsumerState<K3GxSJcRB3IG> {
  final _cVya9aLq49Uk2RRz = TextEditingController();
  String _epKFrJK56Y1 = '';
  bool _cQaKHLyBp = false;

  @override
  void dispose() {
    _cVya9aLq49Uk2RRz.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lanConnected = ref
        .watch(lanStatusProvider)
        .maybeWhen(data: (s) => s == LanStatus.connected, orElse: () => false);
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);
    final user = auth.user;

    if (user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final pdfsAsync = ref.watch(generatedPdfsProvider);

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.wEBAF,
        title: 'Reportes',
        actions: [
          IconButton(
            tooltip: 'Subir pendientes',
            icon: const Icon(Icons.cloud_upload),
            onPressed: _cQaKHLyBp || !lanConnected
                ? null
                : () => _nBoha8JYXdp54OTK(user),
          ),
        ],
      ),
      body: pdfsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error: $e'),
          ),
        ),
        data: (all) {
          final visible = _filterByRole(user, all);
          final filtered = _nTvFk5dElgr(visible);

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(generatedPdfsProvider);
              await ref.read(generatedPdfsProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              children: [
                TextField(
                  controller: _cVya9aLq49Uk2RRz,
                  onChanged: (v) => setState(() => _epKFrJK56Y1 = v),
                  decoration: const InputDecoration(
                    hintText: 'Buscar reporte…',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                if (visible.isEmpty)
                  const Center(child: Text('No hay PDFs generados'))
                else if (filtered.isEmpty)
                  const Center(child: Text('Sin resultados para tu búsqueda')),
                ...filtered.map(
                  (p) => _JVFrg0z(hsl: p, g5vMo: () => _dmYo2jD(context, p)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<GeneratedPdf> _nTvFk5dElgr(List<GeneratedPdf> items) {
    final q = _epKFrJK56Y1.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((p) {
      final filename = p.filename.toLowerCase();
      final createdBy =
          (p.createdByName.isEmpty ? p.createdByUserId : p.createdByName)
              .toLowerCase();
      final area = p.area.toLowerCase();
      final source = p.source.toLowerCase();
      return filename.contains(q) ||
          createdBy.contains(q) ||
          area.contains(q) ||
          source.contains(q);
    }).toList();
  }

  Future<void> _dmYo2jD(BuildContext context, GeneratedPdf p) async {
    final file = File(p.localPath);
    if (!await file.exists()) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se encontró el archivo local')),
        );
      }
      return;
    }
    await PdfFileService.openFile(file);
  }

  Future<void> _nBoha8JYXdp54OTK(AuthUser user) async {
    if (!await LanGate.isOnLan()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subida disponible solo en LAN corporativa'),
        ),
      );
      return;
    }

    setState(() => _cQaKHLyBp = true);
    try {
      final repo = ref.read(generatedPdfRepositoryProvider);
      final uploader = ref.read(pdfUploadApiRepositoryProvider);
      final all = repo.listAll();
      final pending = all.where((p) => !p.uploaded).toList();

      if (pending.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('No hay PDFs pendientes')));
        return;
      }

      for (final p in pending) {
        final file = File(p.localPath);
        if (!await file.exists()) {
          continue;
        }
        final url = await uploader.uploadPdf(
          file: file,
          filename: p.filename,
          metadata: {
            'usuarioNombre': p.createdByName.isNotEmpty
                ? p.createdByName
                : p.createdByUserId,
            'gerenciaId': p.gerenciaId,
            'jefaturaId': p.jefaturaId,
            'checklistNombre': p.checklistNombre ?? p.filename,
            'source': p.source,
          }..removeWhere((_, v) => v == null),
        );
        await repo.markUploaded(id: p.id, url: url);
      }

      ref.invalidate(generatedPdfsProvider);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDFs subidos correctamente')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo subir PDFs: $e')));
    } finally {
      if (mounted) setState(() => _cQaKHLyBp = false);
    }
  }
}

class _JVFrg0z extends StatelessWidget {
  final GeneratedPdf hsl;
  final VoidCallback g5vMo;

  const _JVFrg0z({required this.hsl, required this.g5vMo});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final cs = Theme.of(context).colorScheme;
    final label = hsl.createdByName.isEmpty
        ? hsl.createdByUserId
        : hsl.createdByName;
    final subtitle = '$label • ${hsl.area}';

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: g5vMo,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 52 : 48,
                  height: isTablet ? 52 : 48,
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 14),
                  ),
                  child: Icon(
                    hsl.uploaded ? Icons.cloud_done : Icons.picture_as_pdf,
                    color: cs.onPrimaryContainer,
                    size: isTablet ? 28 : 24,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hsl.filename,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.w800,
                          color: cs.onSurface,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          if (hsl.source.isNotEmpty)
                            Chip(
                              label: Text(
                                hsl.source,
                                style: const TextStyle(fontSize: 14),
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                          Chip(
                            label: Text(
                              hsl.uploaded ? 'Online' : 'Local',
                              style: const TextStyle(fontSize: 14),
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 22 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<GeneratedPdf> _filterByRole(AuthUser user, List<GeneratedPdf> all) {
  if (user.isAdmin) return all;
  if (user.isGerente) {
    final gid = user.resolvedGerenciaId;
    if (gid == null) {
      return all.where((p) => p.createdByUserId == user.id).toList();
    }
    return all.where((p) => p.gerenciaId == gid).toList();
  }
  if (user.isJefeDepartamento) {
    final area = user.area.trim().toLowerCase();
    if (area.isEmpty) {
      return all.where((p) => p.createdByUserId == user.id).toList();
    }
    return all.where((p) => p.area.trim().toLowerCase() == area).toList();
  }
  return all.where((p) => p.createdByUserId == user.id).toList();
}

class VSMjebYuPdJ {
  final Map<String, int> _sRIJD2mxnk7mKFyfthRf0 = <String, int>{};
  final Map<String, DateTime> _r17SteXVrXEDhXI9lsNp7F = <String, DateTime>{};

  Future<bool> y9zu(String url) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: 5);

    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close().timeout(
        const Duration(seconds: 5),
      );

      if (kDebugMode) {
        final last = _sRIJD2mxnk7mKFyfthRf0[url];
        if (last == null || last != response.statusCode) {
          _sRIJD2mxnk7mKFyfthRf0[url] = response.statusCode;
          debugPrint('ServerProbe.ping $url -> ${response.statusCode}');
        }
      }

      return response.statusCode >= 100 && response.statusCode < 600;
    } catch (e) {
      if (kDebugMode) {
        final now = DateTime.now();
        final lastAt = _r17SteXVrXEDhXI9lsNp7F[url];
        if (lastAt == null ||
            now.difference(lastAt) >= const Duration(seconds: 30)) {
          _r17SteXVrXEDhXI9lsNp7F[url] = now;
          debugPrint('ServerProbe.ping $url failed: $e');
        }
      }
      return false;
    } finally {
      client.close(force: true);
    }
  }
}

class HXmufg8PhipZgTVXm implements SQrj3Cecjbvq0H {
  final Dio x5O;
  final String wfDsPRvQIBID;
  final String pm7DIMBOLf;

  HXmufg8PhipZgTVXm({
    required this.x5O,
    this.wfDsPRvQIBID = '/auth/login',
    this.pm7DIMBOLf = '/auth/me',
  });

  @override
  Future<ZUV35mlB33k> inKrK({
    required String username,
    required String password,
  }) async {
    Future<Response<dynamic>> eVwmBw0(Map<String, dynamic> data) async {
      return await x5O.post(wfDsPRvQIBID, data: data);
    }

    final userKeys = <String>['username', 'usuario', 'user', 'email'];
    final passKeys = <String>['password', 'clave', 'contrasena', 'pass'];

    DioException? lastDio;
    Response<dynamic>? res;

    for (final uKey in userKeys) {
      for (final pKey in passKeys) {
        try {
          res = await eVwmBw0({uKey: username, pKey: password});
          break;
        } on DioException catch (e) {
          lastDio = e;
          if (e.response?.statusCode == 400) {
            continue;
          }
          rethrow;
        }
      }
      if (res != null) break;
    }

    if (res == null) {
      if (lastDio != null) throw lastDio;
      throw StateError('Login: no se pudo enviar credenciales.');
    }

    final token = _eTJ3FpYI8IuT(res.data);

    final meRes = await x5O.get(
      pm7DIMBOLf,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final me = (meRes.data as Map).cast<String, dynamic>();

    final userId = (me['id'] ?? me['userId'] ?? me['sub'] ?? '').toString();
    final nombre = (me['nombre'] ?? me['username'] ?? '').toString();
    final area = (me['area'] ?? '').toString();
    final gerencia =
        (me['gerencia'] ??
                me['gerenciaNombre'] ??
                me['gerencia_name'] ??
                me['gerenciaId'] ??
                me['gerencia_id'] ??
                '')
            .toString();
    final rolesRaw = me['roles'];

    return ZUV35mlB33k(
      zkR30: token,
      goQt: KqBOLs41(
        gw: userId,
        u3aymK: nombre,
        sFiI: area,
        ucAcyxha: gerencia,
        fH7uu: rolesRaw is List
            ? rolesRaw.map((e) => e.toString()).toList()
            : const <String>[],
      ),
    );
  }

  String _eTJ3FpYI8IuT(dynamic data) {
    String? fVybDzqyiqWXAQ1pyElPCT(Map map) {
      final token =
          map['access_token'] ??
          map['accessToken'] ??
          map['token'] ??
          map['jwt'] ??
          map['id_token'] ??
          map['idToken'];
      if (token is String && token.trim().isNotEmpty) return token.trim();
      return null;
    }

    if (data is String && data.trim().isNotEmpty) return data.trim();

    if (data is Map) {
      final root = data;

      final direct = fVybDzqyiqWXAQ1pyElPCT(root);
      if (direct != null) return direct;

      const nestKeys = <String>['data', 'result', 'payload', 'session', 'auth'];
      for (final k in nestKeys) {
        final nested = root[k];
        if (nested is String && nested.trim().isNotEmpty) return nested.trim();
        if (nested is Map) {
          final nestedToken = fVybDzqyiqWXAQ1pyElPCT(nested);
          if (nestedToken != null) return nestedToken;

          for (final k2 in nestKeys) {
            final nested2 = nested[k2];
            if (nested2 is String && nested2.trim().isNotEmpty) {
              return nested2.trim();
            }
            if (nested2 is Map) {
              final t = fVybDzqyiqWXAQ1pyElPCT(nested2);
              if (t != null) return t;
            }
          }
        }
      }

      final keys = root.keys.map((e) => e.toString()).toList()..sort();
      throw StateError('Login: respuesta sin token. Keys=$keys');
    }

    throw StateError('Login: respuesta sin token (tipo=${data.runtimeType})');
  }

  @override
  Future<ZUV35mlB33k?> ygDJQag3yA() async {
    return null;
  }

  @override
  Future<void> bGwfss() async {}
}

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

class MFp0EcfZIFDKSVV {
  static Future<Widget> lVX80(
    Widget app, {
    required KillSwitchService killSwitch,
    required bool hasLan,
  }) async {
    if (!kReleaseMode) {
      await LocalFlags.clear();
      return app;
    }

    final integrityOk = await IntegrityGuard.verify();
    if (!integrityOk) {
      await LocalFlags.blockApp(reason: AppBlockReason.securityRisk);
      return const _HaFCxRFXAfb();
    }

    final debugDetected = DebugDetector.isDebugging();
    if (debugDetected) {
      await LocalFlags.blockApp(reason: AppBlockReason.securityRisk);
      return const _HaFCxRFXAfb();
    }

    final status = await killSwitch.check(hasLan: hasLan);

    if (status.blocked) {
      return _HaFCxRFXAfb(sV9iKn: status.reason);
    }

    return app;
  }
}

class _HaFCxRFXAfb extends StatelessWidget {
  final AppBlockReason? sV9iKn;

  const _HaFCxRFXAfb({this.sV9iKn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(child: Text(_cRbUfly(), textAlign: TextAlign.center)),
      ),
    );
  }

  String _cRbUfly() {
    switch (sV9iKn) {
      case AppBlockReason.contractViolation:
        return 'Aplicación deshabilitada por incumplimiento de acuerdos';
      case AppBlockReason.securityRisk:
        return 'Aplicación deshabilitada por seguridad';
      case AppBlockReason.manualDeveloperBlock:
      default:
        return 'Aplicación deshabilitada por incumplimiento de políticas';
    }
  }
}

class QWtEwczeEwwH1wG3VHw extends StatefulWidget {
  final A32xKOUKm8KMrJkQEMBm9puVx nPgzFXHoT8;
  final String rO1cK6gIVor;
  final String t52gPMBdx5rqMZ4Nta;
  final String gCu9VCokdMHQ;

  final ValueChanged<IDXe8JudY4J27fMVDEST> obMYo6FJ;

  const QWtEwczeEwwH1wG3VHw({
    super.key,
    required this.nPgzFXHoT8,
    required this.obMYo6FJ,
    this.rO1cK6gIVor = '',
    this.t52gPMBdx5rqMZ4Nta = '',
    this.gCu9VCokdMHQ = '',
  });

  @override
  State<QWtEwczeEwwH1wG3VHw> createState() => _HSgawboIi6S8Pr3WRJgx2xEv();
}

class _HSgawboIi6S8Pr3WRJgx2xEv extends State<QWtEwczeEwwH1wG3VHw> {
  final _mp82xu = ImagePicker();

  late final TextEditingController _pE7o;
  late final TextEditingController _wg3BVk4uW7Y;
  late final TextEditingController _eeGQS;

  late final List<bool> _yHiDoR;
  late final List<bool> _uXHfZhVB;
  late final List<bool> _qbrU2Lhi;
  late final List<TextEditingController> _rYejNgTWbQhAG;
  late final List<List<XFile>> _yOLzbX;

  @override
  void initState() {
    super.initState();
    _pE7o = TextEditingController(text: widget.rO1cK6gIVor);
    _wg3BVk4uW7Y = TextEditingController(text: widget.t52gPMBdx5rqMZ4Nta);
    _eeGQS = TextEditingController(text: widget.gCu9VCokdMHQ);

    final n = widget.nPgzFXHoT8.twWXC.length;
    _yHiDoR = List<bool>.filled(n, false);
    _uXHfZhVB = List<bool>.filled(n, false);
    _qbrU2Lhi = List<bool>.filled(n, false);
    _rYejNgTWbQhAG = List.generate(n, (_) => TextEditingController());
    _yOLzbX = List.generate(n, (_) => <XFile>[]);
  }

  @override
  void dispose() {
    _pE7o.dispose();
    _wg3BVk4uW7Y.dispose();
    _eeGQS.dispose();
    for (final c in _rYejNgTWbQhAG) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionContainer(
          title: widget.nPgzFXHoT8.xAWWV,
          subtitle: 'Captura la información y marca cada punto.',
          icon: Icons.description_outlined,
          child: Column(
            children: [
              _YlwJW(o5dIz: widget.nPgzFXHoT8.xUX9iztXXpohN, wIi3HaY7jS: _pE7o),
              const SizedBox(height: 12),
              _YlwJW(o5dIz: 'Responsable', wIi3HaY7jS: _wg3BVk4uW7Y),
              const SizedBox(height: 12),
              _YlwJW(o5dIz: 'Folio', wIi3HaY7jS: _eeGQS),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(widget.nPgzFXHoT8.twWXC.length, (index) {
          final item = widget.nPgzFXHoT8.twWXC[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _V9tttfwJ(
              sv4ls: index,
              yQzJ6: item.u8JzM,
              fOOCKT: _yHiDoR[index],
              x1yqgkT1: _uXHfZhVB[index],
              aUV41YmZ: _qbrU2Lhi[index],
              aOPRArtF6D9QQX4Cehuk3: _rYejNgTWbQhAG[index],
              ucjaCT: _yOLzbX[index],
              usTdVUNvVXMjHg: (v) {
                setState(() {
                  if (_qbrU2Lhi[index]) return;
                  _yHiDoR[index] = v;
                  if (v) _uXHfZhVB[index] = false;
                });
              },
              yRKqRykafyXDY14O: (v) {
                setState(() {
                  if (_qbrU2Lhi[index]) return;
                  _uXHfZhVB[index] = v;
                  if (v) _yHiDoR[index] = false;
                });
              },
              tijTDspUfUrD4mNU: (v) {
                setState(() {
                  _qbrU2Lhi[index] = v;
                  if (v) {
                    _yHiDoR[index] = false;
                    _uXHfZhVB[index] = false;
                    _rYejNgTWbQhAG[index].text = 'N/A';
                    _rYejNgTWbQhAG[index]
                        .selection = TextSelection.fromPosition(
                      TextPosition(offset: _rYejNgTWbQhAG[index].text.length),
                    );
                  } else {
                    if (_rYejNgTWbQhAG[index].text.trim() == 'N/A') {
                      _rYejNgTWbQhAG[index].clear();
                    }
                  }
                });
              },
              clOWSz8xuA: () => _owEHuKwK(index),
              pl4sFe0AvuXl4: (imgIndex) {
                setState(() => _yOLzbX[index].removeAt(imgIndex));
              },
            ),
          );
        }),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: _qL4ZWh,
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('Generar PDF'),
        ),
      ],
    );
  }

  Future<void> _owEHuKwK(int index) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Cámara'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galería'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (source == null) return;

    if (source == ImageSource.gallery) {
      final picked = await _mp82xu.pickMultiImage(imageQuality: 70);
      if (picked.isEmpty) return;
      setState(() => _yOLzbX[index].addAll(picked));
      return;
    }

    final picked = await _mp82xu.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (picked == null) return;
    setState(() => _yOLzbX[index].add(picked));
  }

  void _qL4ZWh() {
    final answers = <FrKyfgAdXg4rDE7QpFC>[];
    for (var i = 0; i < widget.nPgzFXHoT8.twWXC.length; i++) {
      final def = widget.nPgzFXHoT8.twWXC[i];
      final obs = _rYejNgTWbQhAG[i].text.trim();
      answers.add(
        FrKyfgAdXg4rDE7QpFC(
          oVxZdl: def.n2,
          eGm7S: def.u8JzM,
          xDksiE: _yHiDoR[i],
          jjrHH614: _uXHfZhVB[i],
          hlbyb6DeF9B: _qbrU2Lhi[i] && obs.isEmpty ? 'N/A' : obs,
          y35qpUs2ZT: _yOLzbX[i].map((x) => x.path).toList(),
        ),
      );
    }

    widget.obMYo6FJ(
      IDXe8JudY4J27fMVDEST(
        uQYHwcu6pGQl: widget.nPgzFXHoT8.bY,
        i61BPT32Jku: widget.nPgzFXHoT8.xAWWV,
        fQbZ: _pE7o.text.trim(),
        cslvKXrhK6M: _wg3BVk4uW7Y.text.trim(),
        syA1h: _eeGQS.text.trim(),
        yS9AY8riA: DateTime.now(),
        y6Dy1: answers,
      ),
    );
  }
}

class _YlwJW extends StatelessWidget {
  final String o5dIz;
  final TextEditingController wIi3HaY7jS;

  const _YlwJW({required this.o5dIz, required this.wIi3HaY7jS});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: wIi3HaY7jS,
      decoration: InputDecoration(labelText: o5dIz),
    );
  }
}

class _V9tttfwJ extends StatelessWidget {
  final int sv4ls;
  final String yQzJ6;
  final bool fOOCKT;
  final bool x1yqgkT1;
  final bool aUV41YmZ;
  final TextEditingController aOPRArtF6D9QQX4Cehuk3;
  final List<XFile> ucjaCT;

  final ValueChanged<bool> usTdVUNvVXMjHg;
  final ValueChanged<bool> yRKqRykafyXDY14O;
  final ValueChanged<bool> tijTDspUfUrD4mNU;
  final VoidCallback clOWSz8xuA;
  final ValueChanged<int> pl4sFe0AvuXl4;

  const _V9tttfwJ({
    required this.sv4ls,
    required this.yQzJ6,
    required this.fOOCKT,
    required this.x1yqgkT1,
    required this.aUV41YmZ,
    required this.aOPRArtF6D9QQX4Cehuk3,
    required this.ucjaCT,
    required this.usTdVUNvVXMjHg,
    required this.yRKqRykafyXDY14O,
    required this.tijTDspUfUrD4mNU,
    required this.clOWSz8xuA,
    required this.pl4sFe0AvuXl4,
  });

  bool get _jziB4lMMWwq1Z9E6XAEk9 => aUV41YmZ;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cs.primary.withAlpha(18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${sv4ls + 1}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: cs.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    yQzJ6,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              value: aUV41YmZ,
              onChanged: (v) => tijTDspUfUrD4mNU(v ?? false),
              title: const Text('No aplica'),
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    value: fOOCKT,
                    onChanged: _jziB4lMMWwq1Z9E6XAEk9
                        ? null
                        : (v) => usTdVUNvVXMjHg(v ?? false),
                    title: const Text('Cumple'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    value: x1yqgkT1,
                    onChanged: _jziB4lMMWwq1Z9E6XAEk9
                        ? null
                        : (v) => yRKqRykafyXDY14O(v ?? false),
                    title: const Text('No cumple'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: aOPRArtF6D9QQX4Cehuk3,
              readOnly: aUV41YmZ,
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Observaciones'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Evidencias',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: clOWSz8xuA,
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('Agregar'),
                ),
              ],
            ),
            if (ucjaCT.isEmpty)
              Text(
                'Sin fotos',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              )
            else
              SizedBox(
                height: 72,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: ucjaCT.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final x = ucjaCT[i];
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(x.path),
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            iconSize: 18,
                            onPressed: () => pl4sFe0AvuXl4(i),
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class T8Ea39g7Kz {
  static const _o2bJ3AI = FlutterSecureStorage();

  static const _tuHzh1bRAAk = '__app_disabled__';
  static const _kt149IcO5 = '__app_disabled_reason__';
  static const _zIHdJAe4vls6 = '__app_disabled_at__';

  static Future<void> csD1h3ST({
    required AppBlockReason reason,
  }) async {
    await _o2bJ3AI.write(key: _tuHzh1bRAAk, value: 'true');
    await _o2bJ3AI.write(key: _kt149IcO5, value: reason.name);
    await _o2bJ3AI.write(
      key: _zIHdJAe4vls6,
      value: DateTime.now().toIso8601String(),
    );
  }

  static Future<bool> l7jb4omA2sZHb() async {
    final v = await _o2bJ3AI.read(key: _tuHzh1bRAAk);
    return v == 'true';
  }

  static Future<AppBlockReason?> rjApk8Pll() async {
    final r = await _o2bJ3AI.read(key: _kt149IcO5);
    if (r == null) return null;
    return AppBlockReason.values.byName(r);
  }

  static Future<void> uo7Oj() async {
    await _o2bJ3AI.delete(key: _tuHzh1bRAAk);
    await _o2bJ3AI.delete(key: _kt149IcO5);
    await _o2bJ3AI.delete(key: _zIHdJAe4vls6);
  }
}

class CA4pt8U5 {
  final DzFehef3VL4MoV aKhxd5xHS8RGYc;
  final VSMjebYuPdJ thbjNLmqO6g;
  final String fNFxH7Ml7;
  final bool dx4Y3NHECPz2G1;

  CA4pt8U5({
    required this.aKhxd5xHS8RGYc,
    required this.thbjNLmqO6g,
    required this.fNFxH7Ml7,
    required this.dx4Y3NHECPz2G1,
  });

  Future<TmFstXFl2> f9pEA() async {
    final hasNetwork = await aKhxd5xHS8RGYc.mRTEmVNZMH();
    if (!hasNetwork) {
      return TmFstXFl2.s8cS9fN8yAl9;
    }

    if (dx4Y3NHECPz2G1) {
      final onLan = await aKhxd5xHS8RGYc.sIZ2MBeZqUlP1r4();
      if (!onLan) {
        return TmFstXFl2.s8cS9fN8yAl9;
      }
    }

    var serverOk = await thbjNLmqO6g.y9zu(fNFxH7Ml7);
    if (!serverOk) {
      if (fNFxH7Ml7.endsWith('/api/health')) {
        final fallback = fNFxH7Ml7.replaceFirst('/api/health', '/health');
        serverOk = await thbjNLmqO6g.y9zu(fallback);
      } else if (fNFxH7Ml7.endsWith('/health')) {
        final fallback = fNFxH7Ml7.replaceFirst('/health', '/api/health');
        serverOk = await thbjNLmqO6g.y9zu(fallback);
      }
    }
    if (!serverOk) {
      return TmFstXFl2.uvp7RkNl7n;
    }

    return TmFstXFl2.sUXQy7BNP;
  }
}

class PKkYK9BvJuOlesCt4bUgKZ {
  final Dio xvO;

  PKkYK9BvJuOlesCt4bUgKZ({required this.xvO});

  Future<List<Jefatura>> xfxScmLGfjtbnUqw({int? gerenciaId}) async {
    final candidates = <_SdVpDZeQAWckSYEr>[
      _SdVpDZeQAWckSYEr('/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr('/jefaturas/list', _e3(gerenciaId: gerenciaId)),

      _SdVpDZeQAWckSYEr('/checklist/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr('/checklists/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr(
        '/checklist/jefaturas/list',
        _e3(gerenciaId: gerenciaId),
      ),
    ];

    final res = await _qyTWmVtsVj('jefaturas', candidates);
    final list = _pYyvNhdVNIP(res.data);

    return list
        .whereType<Map>()
        .map((m) => Jefatura.fromJson(m.cast<String, dynamic>()))
        .toList();
  }

  Future<List<ChecklistExistente>> zZ8xDhxUdqqzmU6cvo7({
    required int jefaturaId,
    int? gerenciaId,
  }) async {
    final candidates = <_SdVpDZeQAWckSYEr>[
      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),

      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura_id': jefaturaId,
      }),
      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefaturaId': jefaturaId,
      }),
      _SdVpDZeQAWckSYEr('/cl_existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),

      _SdVpDZeQAWckSYEr('/checklist/cl_existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),
    ];

    final res = await _qyTWmVtsVj('cl_existentes', candidates);
    final list = _pYyvNhdVNIP(res.data);

    final parsed = list
        .whereType<Map>()
        .map((m) => ChecklistExistente.fromJson(m.cast<String, dynamic>()))
        .toList();

    return parsed;
  }

  Map<String, dynamic>? _e3({int? gerenciaId}) {
    if (gerenciaId == null) return null;
    return {
      'gerencia': gerenciaId,
      'gerencia_id': gerenciaId,
      'gerenciaId': gerenciaId,
      'gerencia_cl': gerenciaId,
    };
  }

  Future<Response<dynamic>> _qyTWmVtsVj(
    String feature,
    List<_SdVpDZeQAWckSYEr> candidates,
  ) async {
    DioException? lastDioError;
    DioException? lastAuthError;

    for (final c in candidates) {
      try {
        return await _kzLVgkT8Xc2df0YKSiE5v4CTAD(
          c.ph7v,
          queryParameters: c.rEJeLUIvivCAj0e,
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;

        if (status == 401 || status == 403) {
          lastAuthError = e;
          continue;
        }

        lastDioError = e;

        if (status == 404) continue;

        if (status == 400) {
          final msg = (e.response?.data is Map)
              ? ((e.response?.data as Map)['message'] ?? '').toString()
              : (e.response?.data ?? '').toString();
          if (msg.toLowerCase().contains('invalid id')) {
            continue;
          }
        }

        if (_gP9cC0QOJDIvHa0kvP4(e)) {
          final baseUrl = xvO.options.baseUrl;
          throw StateError(
            'Servidor no disponible. Verifica LAN/VPN y el backend. ($baseUrl)',
          );
        }

        rethrow;
      }
    }

    if (lastAuthError != null) {
      throw StateError('No autorizado: inicia sesión de nuevo');
    }

    if (lastDioError != null) {
      final baseUrl = xvO.options.baseUrl;
      throw StateError(
        'Checklist: no se encontró endpoint para $feature. ($baseUrl)',
      );
    }

    throw StateError('Checklist: no se encontró un endpoint disponible');
  }

  Future<Response<dynamic>> _kzLVgkT8Xc2df0YKSiE5v4CTAD(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await xvO.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = xvO.options.baseUrl;
      final is404 = status == 404;
      if (!is404 || !path.startsWith('/')) rethrow;

      if (baseUrl.endsWith('/api')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi$path').replace(
          queryParameters: queryParameters?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await xvO.getUri(uri);
      }

      if (!path.startsWith('/api/')) {
        return await xvO.get('/api$path', queryParameters: queryParameters);
      }

      rethrow;
    }
  }

  bool _gP9cC0QOJDIvHa0kvP4(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }

  List<dynamic> _pYyvNhdVNIP(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      final map = data.cast<String, dynamic>();
      final v = map['data'] ?? map['items'] ?? map['result'];
      if (v is List) return v;
    }
    return const [];
  }
}

class _SdVpDZeQAWckSYEr {
  final String ph7v;
  final Map<String, dynamic>? rEJeLUIvivCAj0e;

  _SdVpDZeQAWckSYEr(this.ph7v, this.rEJeLUIvivCAj0e);
}

final combustibleRepositoryProvider = Provider<CombustibleRepository>((ref) {
  return CombustibleRepository(ref.read(appDatabaseProvider));
});

final combustiblePendientesCountProvider = StreamProvider<int>((ref) {
  return ref.read(combustibleRepositoryProvider).watchPendientesCount();
});

final combustibleRegistrosProvider =
    StreamProvider<List<CombustibleRegistrosTableData>>((ref) {
      return ref.read(combustibleRepositoryProvider).watchRegistros();
    });

class FE4ECib5JxlhxZgH1C implements GlpiRepository {
  final AppDatabase wg;

  FE4ECib5JxlhxZgH1C({required this.wg});

  @override
  Future<void> crearTicket(GlpiTicket ticket, {String? entidadId}) async {
    await wg
        .into(wg.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'glpi_ticket',
            entidadId: (entidadId != null && entidadId.trim().isNotEmpty)
                ? entidadId.trim()
                : DateTime.now().millisecondsSinceEpoch.toString(),
            accion: 'create',
            payload: Value(ticket.toJson()),
          ),
        );
  }
}

enum FgLh1V42LZ8 {
  rHrmdCro0,
  rcShd4VtL,
  xgp6pNN6TU,
}

class QJdYP {
  final String s2;
  final String? s645s4D;
  final String lW4x9fZ8O;
  final String cZFj9o;
  final String mT0CZvX2H0q;
  final String? ic4n4fWac;
  final String vOEfJvKQH;
  final FgLh1V42LZ8 xN50kv;

  QJdYP({
    required this.s2,
    this.s645s4D,
    required this.lW4x9fZ8O,
    required this.cZFj9o,
    required this.mT0CZvX2H0q,
    this.ic4n4fWac,
    required this.vOEfJvKQH,
    this.xN50kv = FgLh1V42LZ8.rHrmdCro0,
  });
}

final tareaRepositoryProvider = Provider<TareaRepository>((ref) {
  return TareaRepositoryImpl(ref.read(appDatabaseProvider));
});

final tareaControllerProvider = Provider<YFN4UOLKRErF0zB>((ref) {
  return YFN4UOLKRErF0zB(
    ref.read(tareaRepositoryProvider),
    ref.read(notificacionRepositoryProvider),
  );
});

final tareaComentariosRepositoryProvider = Provider<TareaComentariosRepository>(
  (ref) {
    return TareaComentariosRepository(ref.read(appDatabaseProvider));
  },
);

final tareaAdjuntosRepositoryProvider = Provider<TareaAdjuntosRepository>((
  ref,
) {
  return TareaAdjuntosRepository(ref.read(appDatabaseProvider));
});

final tareaComentariosProvider =
    StreamProvider.family<List<TareaComentario>, String>((ref, tareaId) {
      return ref
          .read(tareaComentariosRepositoryProvider)
          .watchPorTareaId(tareaId);
    });

final tareaAdjuntosProvider = StreamProvider.family<List<TareaAdjunto>, String>(
  (ref, tareaId) {
    return ref.read(tareaAdjuntosRepositoryProvider).watchPorTareaId(tareaId);
  },
);

final tareasPorAsignadoProvider = FutureProvider.family<List<Tarea>, String>((
  ref,
  asignadoA,
) {
  return ref.read(tareaRepositoryProvider).obtenerPorAsignado(asignadoA);
});

final tareasPorCreadorProvider = FutureProvider.family<List<Tarea>, String>((
  ref,
  creadoPor,
) {
  return ref.read(tareaRepositoryProvider).obtenerPorCreador(creadoPor);
});

final todasLasTareasProvider = FutureProvider<List<Tarea>>((ref) {
  return ref.read(tareaRepositoryProvider).obtenerTodas();
});

class Gw4i6lXKULhS5 {
  final String uexbsa9;
  final int x26a;
  final bool zJgsj7BM;

  const Gw4i6lXKULhS5({
    required this.uexbsa9,
    required this.x26a,
    required this.zJgsj7BM,
  });

  String get wgMsGcr => '${zJgsj7BM ? 'https' : 'http'}://$uexbsa9:$x26a';
}

class RMZwEZusO {
  final List<String> pQzwKUpB39NMh;

  RMZwEZusO(this.pQzwKUpB39NMh);

  bool haWgpdihi(String ip) {
    return true; // placeholder válido por ahora
  }
}

class AexhzoRpGqe1izNlq extends ConsumerStatefulWidget {
  final AuthUser pylK;

  const AexhzoRpGqe1izNlq({super.key, required this.pylK});

  @override
  ConsumerState<AexhzoRpGqe1izNlq> createState() => _CfLxsIUYlyf8Tuwbl9Re9M();
}

class _CfLxsIUYlyf8Tuwbl9Re9M extends ConsumerState<AexhzoRpGqe1izNlq> {
  int _k64JV77czq5RB = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GerenciaConfig.getConfig(widget.pylK.gerencia);

    final gradient = LinearGradient(
      colors: [theme.colorPrimario, theme.colorSecundario],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: IndexedStack(
        index: _k64JV77czq5RB,
        children: [
          _GuJEyvU(qmhtC: theme, l4Tz: widget.pylK),
          CombustiblePage(theme: theme),
          _Bf2NGTOAj2(zYg5: widget.pylK, n3rMv: theme),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: theme.colorPrimario.withValues(alpha: 0.12),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _k64JV77czq5RB,
          onTap: (index) => setState(() => _k64JV77czq5RB = index),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_gas_station),
              label: 'Combustible',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}

class _GuJEyvU extends StatelessWidget {
  final GerenciaTheme qmhtC;
  final AuthUser l4Tz;

  const _GuJEyvU({required this.qmhtC, required this.l4Tz});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _VRFOD5(gSZyP: qmhtC, jtPP: l4Tz),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: isTablet ? 32 : 24,
            ),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = adaptiveCrossAxisCount(
                  constraints.crossAxisExtent,
                );

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: isTablet ? 20 : 16,
                    crossAxisSpacing: isTablet ? 20 : 16,
                    childAspectRatio: isTablet ? 1.1 : 1.0,
                  ),
                  delegate: SliverChildListDelegate.fixed([
                    MenuCard(
                      title: 'Inventario',
                      icon: Icons.inventory,
                      color: qmhtC.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InventarioPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Checklist',
                      icon: Icons.checklist,
                      color: qmhtC.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JefaturasListPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Reportes',
                      icon: Icons.assessment,
                      color: qmhtC.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReportesPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Tareas',
                      icon: Icons.task_alt,
                      color: qmhtC.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TareasPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _VRFOD5 extends StatelessWidget {
  final GerenciaTheme gSZyP;
  final AuthUser jtPP;

  const _VRFOD5({required this.gSZyP, required this.jtPP});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        isTablet ? 32 : 24,
        24,
        isTablet ? 40 : 32,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [gSZyP.colorPrimario, gSZyP.colorSecundario],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isTablet ? 40 : 32),
          bottomRight: Radius.circular(isTablet ? 40 : 32),
        ),
        boxShadow: [
          BoxShadow(
            color: gSZyP.colorPrimario.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola! 👋',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isTablet ? 20 : 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      jtPP.nombre,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 32 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(isTablet ? 16 : 12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                ),
                child: Icon(
                  gSZyP.iconoPrincipal,
                  color: Colors.white,
                  size: isTablet ? 36 : 28,
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 24 : 20),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 20 : 16,
              vertical: isTablet ? 16 : 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.business,
                  color: Colors.white,
                  size: isTablet ? 24 : 20,
                ),
                SizedBox(width: isTablet ? 16 : 12),
                Flexible(
                  child: Text(
                    gSZyP.nombre,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bf2NGTOAj2 extends ConsumerWidget {
  final AuthUser zYg5;
  final GerenciaTheme n3rMv;

  const _Bf2NGTOAj2({required this.zYg5, required this.n3rMv});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 600 : double.infinity,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 40 : 24,
              ),
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 32 : 20),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 32 : 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: n3rMv.colorPrimario.withValues(alpha: 0.2),
                          blurRadius: isTablet ? 30 : 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: isTablet ? 80 : 64,
                      color: n3rMv.colorPrimario,
                    ),
                  ),
                  SizedBox(height: isTablet ? 32 : 24),
                  Text(
                    zYg5.nombre,
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isTablet ? 48 : 32),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 28 : 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(isTablet ? 24 : 20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: isTablet ? 15 : 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _mcW6Wrm(
                          context: context,
                          icon: Icons.business,
                          label: 'Gerencia',
                          value: n3rMv.nombre,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 20 : 16,
                          ),
                          child: Divider(height: 1, color: Colors.grey[200]),
                        ),
                        _mcW6Wrm(
                          context: context,
                          icon: Icons.verified_user,
                          label: 'Cargo',
                          value: zYg5.roles.isEmpty
                              ? 'Sin asignar'
                              : zYg5.roles.join(', '),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 48 : 32),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final config = ref.read(appConfigProvider);
                        final session = ref.read(sessionManagerProvider);
                        final token = (await session.getToken())?.trim() ?? '';

                        String t3eYUq(String value) {
                          if (value.isEmpty) return '(vacío)';
                          if (value.length <= 14) return value;
                          return '${value.substring(0, 8)}…${value.substring(value.length - 6)}';
                        }

                        String mY7nZ1FWXV(dynamic data) {
                          if (data == null) return '(sin body)';
                          final s = data is String ? data : data.toString();
                          return s.length > 2000
                              ? '${s.substring(0, 2000)}…'
                              : s;
                        }

                        int? status;
                        dynamic body;
                        String? error;
                        final dio = ref.read(dioProvider);
                        try {
                          if (token.isEmpty) {
                            error = 'No hay token guardado en el dispositivo.';
                          } else {
                            final res = await dio.get('/auth/me');
                            status = res.statusCode;
                            body = res.data;
                          }
                        } on DioException catch (e) {
                          error = e.toString();
                          status = e.response?.statusCode;
                          body = e.response?.data;
                        } catch (e) {
                          error = e.toString();
                        }

                        if (!context.mounted) return;

                        await showDialog<void>(
                          context: context,
                          builder: (_) {
                            var revealToken = false;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                final tokenLine = revealToken
                                    ? token
                                    : t3eYUq(token);

                                return AlertDialog(
                                  title: const Text('Diagnóstico de token'),
                                  content: SingleChildScrollView(
                                    child: SelectableText(
                                      [
                                        'BaseUrl: ${dio.options.baseUrl}',
                                        'Auth endpoint: ${config.authEndpoint}',
                                        'Tiene token: ${token.isNotEmpty}',
                                        'Token: $tokenLine',
                                        'GET /auth/me status: ${status ?? '-'}',
                                        if (error != null) 'Error: $error',
                                        if (body != null)
                                          'Body: ${mY7nZ1FWXV(body)}',
                                      ].join('\n'),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: token.isEmpty
                                          ? null
                                          : () async {
                                              await Clipboard.setData(
                                                ClipboardData(text: token),
                                              );
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Token copiado al portapapeles.',
                                                  ),
                                                ),
                                              );
                                            },
                                      child: const Text('Copiar token'),
                                    ),
                                    TextButton(
                                      onPressed: token.isEmpty
                                          ? null
                                          : () => setState(
                                              () => revealToken = !revealToken,
                                            ),
                                      child: Text(
                                        revealToken
                                            ? 'Ocultar token'
                                            : 'Mostrar token',
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).maybePop(),
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.vpn_key),
                      label: const Text('Diagnóstico token'),
                    ),
                  ),
                  SizedBox(height: isTablet ? 16 : 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text(
                              '¿Estás seguro que deseas cerrar sesión?',
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Cerrar Sesión'),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true) {
                          await ref
                              .read(authControllerProvider.notifier)
                              .logout();
                        }
                      },
                      icon: Icon(Icons.logout, size: isTablet ? 24 : 20),
                      label: Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: isTablet ? 20 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isTablet ? 20 : 16,
                          ),
                        ),
                        elevation: 8,
                        shadowColor: Colors.red.withValues(alpha: 0.3),
                      ),
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

  Widget _mcW6Wrm({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [n3rMv.colorPrimario, n3rMv.colorSecundario],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NVqwNpBA54nfo extends Table {
  TextColumn get oL => text()();

  TextColumn get eSDgFr => text()();
  TextColumn get vyNZLgcyVKI => text()();
  TextColumn get fOCs9DXpC => text()();
  TextColumn get y32c => text()();

  TextColumn get ofZKid => text().nullable()();
  TextColumn get iN5Ar8QnB => text().nullable()();

  TextColumn get q5sutJs5c => text()();
  DateTimeColumn get dCfKLRGW => dateTime()();

  TextColumn get yTFdH7 => text()();

  TextColumn get nVcmc1qVkDRZ => text().nullable()();

  TextColumn get aBvPGdpt => text().nullable()();

  @override
  Set<Column> get primaryKey => {oL};
}

class XgcJScP6W7zsz {
  static const _laypLpQcmtKERX = ['action', 'timestamp'];

  static bool pELZeY({
    required Map<String, dynamic> payload,
    required String signatureBase64,
  }) {
    try {
      if (!_w0LDbuhfQHxTCy(payload)) return false;

      if (!_iv2jUns(payload['timestamp'])) return false;

      final sigBytes = base64Decode(signatureBase64);
      final ecSignature = _r2hG16wgPZGYOaZ3em(sigBytes);
      if (sigBytes.length < 8) return false;

      final signer = Signer('SHA-256/ECDSA');

      signer.init(
        false,
        PublicKeyParameter<ECPublicKey>(DevKeyMaterial.publicKey),
      );

      final data = utf8.encode(jsonEncode(payload));

      return signer.verifySignature(data, ecSignature);
    } catch (_) {
      return false;
    }
  }

  static bool _w0LDbuhfQHxTCy(Map<String, dynamic> payload) {
    for (final k in _laypLpQcmtKERX) {
      if (!payload.containsKey(k)) return false;
    }
    return payload['action'] == 'BLOCK_APP';
  }

  static bool _iv2jUns(dynamic timestamp) {
    if (timestamp is! int) return false;

    final now = DateTime.now().millisecondsSinceEpoch;
    const maxSkew = 5 * 60 * 1000;
    return (now - timestamp).abs() <= maxSkew;
  }

  static ECSignature _r2hG16wgPZGYOaZ3em(Uint8List bytes) {
    final parser = ASN1Parser(bytes);
    final seq = parser.nextObject() as ASN1Sequence;

    final rBytes = (seq.elements![0] as ASN1Integer).valueBytes!;
    final sBytes = (seq.elements![1] as ASN1Integer).valueBytes!;

    final r = _xxCM6tD6J0v5I(rBytes);
    final s = _xxCM6tD6J0v5I(sBytes);

    return ECSignature(r, s);
  }

  static BigInt _xxCM6tD6J0v5I(Uint8List bytes) {
    BigInt result = BigInt.zero;
    for (final b in bytes) {
      result = (result << 8) | BigInt.from(b);
    }
    return result;
  }
}

enum IKhlHRPHkn4MPF {
  bRe,
  pa,
  srdE,
}

class E3Rl9qbo5VSQRrvk {
  final LocalAuthentication _hX4G = LocalAuthentication();

  Future<bool> gdddZZ6Y2zZt() async {
    final canCheck = await _hX4G.canCheckBiometrics;
    if (!canCheck) return false;

    return await _hX4G.authenticate(
      localizedReason: 'Confirma tu identidad para registrar asistencia',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}

final inventarioRepositoryProvider = Provider<InventarioApiRepository>((ref) {
  return InventarioApiRepository(dio: ref.read(dioProvider));
});

final inventarioItemsProvider = FutureProvider<List<Activo>>((ref) async {
  final auth = ref.watch(authControllerProvider);
  final user = auth.user;

  final gerenciaId = user?.resolvedGerenciaId;

  return ref
      .read(inventarioRepositoryProvider)
      .obtenerInventario(gerenciaId: gerenciaId);
});

class HOxkF0juqVNgaCkzfk extends ConsumerWidget {
  const HOxkF0juqVNgaCkzfk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(notificacionesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: 'Marcar todas como leídas',
            onPressed: () async {
              await ref
                  .read(notificacionRepositoryProvider)
                  .marcarTodasLeidas();
            },
          ),
        ],
      ),
      body: data.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text('No hay notificaciones'),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, i) {
              final n = items[i];

              return ListTile(
                title: Text(n.titulo),
                subtitle: Text(n.mensaje),
                trailing: n.leida ? null : const Icon(Icons.circle, size: 10),
                onTap: () async {
                  await ref
                      .read(notificacionRepositoryProvider)
                      .marcarLeida(n.id);

                  if (!context.mounted) return;

                  if (n.tipo == NotificacionTipo.reporte &&
                      n.referenciaId != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReporteDetallePage(
                          reporteId: n.referenciaId!,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}

enum HlMouyaCbw9yY {
  bdQnDoJ, // recién creado
  yXwvbRktv, // ya tomado / asignado
  zZIp8Sjm, // solucionado
  iNuTYHG9X, // no aplica / duplicado
}

extension GnfAloBobpmw8O on HlMouyaCbw9yY {
  String get asString {
    switch (this) {
      case HlMouyaCbw9yY.bdQnDoJ:
        return 'enviado';
      case HlMouyaCbw9yY.yXwvbRktv:
        return 'en_proceso';
      case HlMouyaCbw9yY.zZIp8Sjm:
        return 'resuelto';
      case HlMouyaCbw9yY.iNuTYHG9X:
        return 'rechazado';
    }
  }

  static HlMouyaCbw9yY fromString(String value) {
    switch (value) {
      case 'en_proceso':
        return HlMouyaCbw9yY.yXwvbRktv;
      case 'resuelto':
        return HlMouyaCbw9yY.zZIp8Sjm;
      case 'rechazado':
        return HlMouyaCbw9yY.iNuTYHG9X;
      case 'enviado':
      default:
        return HlMouyaCbw9yY.bdQnDoJ;
    }
  }
}

class RVvHrcu {
  final String nw; // UUID local
  final String fLDsk3; // corto y claro
  final String pEPjdZSkNOy; // detalle del problema
  final String uNi3cuOrY; // Mantenimiento, Seguridad, TI, etc.
  final String fC75; // área/gerencia
  final String? hNs7uz; // opcional (banda, vehículo, equipo)
  final String? hR7QgJ6k0; // opcional (puerta, hangar)
  final String i8cwuPOLI; // userId (requester)
  final DateTime yKBfFdgp;
  final HlMouyaCbw9yY qV3ur4;

  final String? r1a7BwNGpWB3; // ID en backend/GLPI cuando exista

  final Map<String, dynamic>? qE1nVVjA;

  RVvHrcu({
    required this.nw,
    required this.fLDsk3,
    required this.pEPjdZSkNOy,
    required this.uNi3cuOrY,
    required this.fC75,
    required this.i8cwuPOLI,
    required this.yKBfFdgp,
    this.qV3ur4 = HlMouyaCbw9yY.bdQnDoJ,
    this.hNs7uz,
    this.hR7QgJ6k0,
    this.r1a7BwNGpWB3,
    this.qE1nVVjA,
  });

  RVvHrcu xfvP527J({
    HlMouyaCbw9yY? estado,
    String? glpiTicketId,
  }) {
    return RVvHrcu(
      nw: nw,
      fLDsk3: fLDsk3,
      pEPjdZSkNOy: pEPjdZSkNOy,
      uNi3cuOrY: uNi3cuOrY,
      fC75: fC75,
      i8cwuPOLI: i8cwuPOLI,
      yKBfFdgp: yKBfFdgp,
      qV3ur4: estado ?? this.qV3ur4,
      hNs7uz: hNs7uz,
      hR7QgJ6k0: hR7QgJ6k0,
      r1a7BwNGpWB3: glpiTicketId ?? this.r1a7BwNGpWB3,
      qE1nVVjA: qE1nVVjA,
    );
  }

  Map<String, dynamic> vssPSD() => {
    'id': nw,
    'titulo': fLDsk3,
    'descripcion': pEPjdZSkNOy,
    'categoria': uNi3cuOrY,
    'area': fC75,
    'activo': hNs7uz,
    'ubicacion': hR7QgJ6k0,
    'creadoPor': i8cwuPOLI,
    'creadoEn': yKBfFdgp.toIso8601String(),
    'estado': qV3ur4.asString,
    'glpiTicketId': r1a7BwNGpWB3,
    'metadata': qE1nVVjA,
  };
}

class Iom0ztcBxmImKVs2 extends StatelessWidget {
  final GerenciaTheme u4Wka;
  final Tarea aLTtu;

  const Iom0ztcBxmImKVs2({super.key, required this.u4Wka, required this.aLTtu});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: u4Wka.colorPrimario,
        elevation: 4,
        shadowColor: u4Wka.colorPrimario.withValues(alpha: 0.15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detalle de tarea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isTablet ? 24 : 20),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: isTablet ? 15 : 12,
                offset: Offset(0, isTablet ? 6 : 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aLTtu.titulo,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _pJ8('Estado', aLTtu.estado.name),
                _pJ8('Asignado a', aLTtu.asignadoA),
                if (aLTtu.groupId != null && aLTtu.groupId!.trim().isNotEmpty)
                  _pJ8('Grupo', aLTtu.groupId!),
                _pJ8('Descripción', aLTtu.descripcion),
                _pJ8(
                  'Reporte',
                  aLTtu.reporteId.isEmpty ? '-' : aLTtu.reporteId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pJ8(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class Rthwnfk8v8QPre {
  static const String lRDGYDC = '1.0.0';

  static const String hsVfmLdrgeBU = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  static const String p7YZkwRoWJ3W = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );
}

class DzFehef3VL4MoV {
  final Connectivity _hW054VAMzoNf = Connectivity();

  Future<bool> mRTEmVNZMH() async {
    final results = await _hW054VAMzoNf.checkConnectivity();
    return !results.contains(ConnectivityResult.none);
  }

  Future<bool> sIZ2MBeZqUlP1r4() async {
    final results = await _hW054VAMzoNf.checkConnectivity();
    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }

  Future<String?> iHAFR9v1BV() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );

      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (!addr.isLoopback) {
            return addr.address;
          }
        }
      }
    } catch (_) {}

    return null;
  }

  bool jDG8gj6sEVs(String ip, List<String> allowedRanges) {
    return allowedRanges.isNotEmpty;
  }
}

class HXsf7zlICe extends ConsumerWidget {
  final GerenciaTheme mjUxc;
  final int voozy1rqGl;
  final String zXBtPDtDfzb3jI;

  const HXsf7zlICe({
    super.key,
    required this.mjUxc,
    required this.voozy1rqGl,
    required this.zXBtPDtDfzb3jI,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final clAsync = ref.watch(clExistentesPorJefaturaProvider(voozy1rqGl));

    return Scaffold(
      appBar: GerenciaAppBar(theme: mjUxc, title: 'CL de $zXBtPDtDfzb3jI'),
      body: clAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar checklist: ${_errorMsg(e)}'),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text('No hay checklist registrados para esta jefatura'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(clExistentesPorJefaturaProvider(voozy1rqGl));
              await ref.read(
                clExistentesPorJefaturaProvider(voozy1rqGl).future,
              );
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: isTablet ? 20 : 16),
              itemBuilder: (context, index) {
                final cl = items[index];
                return _LapnDI70tP0ZK(
                  cj: cl,
                  nWM1C: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UlKJ4tygr7WfnyTNeVB(
                          dMGUn: mjUxc,
                          g6e7CskfGn: voozy1rqGl,
                          gf58FST9dJ9aPv: zXBtPDtDfzb3jI,
                          qsQyRlEYj: cl,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _LapnDI70tP0ZK extends StatelessWidget {
  final ChecklistExistente cj;
  final VoidCallback nWM1C;

  const _LapnDI70tP0ZK({required this.cj, required this.nWM1C});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final cs = Theme.of(context).colorScheme;

    IconData icon;
    final name = cj.nombre.toLowerCase();
    if (name.contains('red') || name.contains('wifi')) {
      icon = Icons.wifi;
    } else if (name.contains('impres')) {
      icon = Icons.print;
    } else if (name.contains('pc') || name.contains('comput')) {
      icon = Icons.computer;
    } else {
      icon = Icons.document_scanner;
    }

    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: nWM1C,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 56 : 48,
                  height: isTablet ? 56 : 48,
                  decoration: BoxDecoration(
                    color: cs.primary.withAlpha(18),
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                  ),
                  child: Icon(
                    icon,
                    color: cs.primary,
                    size: isTablet ? 30 : 26,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cj.nombre,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Abrir checklist',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: cs.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 24 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _errorMsg(Object e) {
  if (e is StateError) return e.message;
  return e.toString();
}

class L2RAjl5bhcxxtT2tSP9ap implements ReporteRepository {
  final AppDatabase tt;
  final Dio? pVn;

  L2RAjl5bhcxxtT2tSP9ap({required this.tt, this.pVn});

  @override
  Future<void> crearReporte(Reporte reporte) async {
    await tt
        .into(tt.reportesTable)
        .insert(
          ReportesTableCompanion.insert(
            id: reporte.id,
            titulo: reporte.titulo,
            descripcion: reporte.descripcion,
            categoria: reporte.categoria,
            area: reporte.area,
            activo: Value(reporte.activo),
            ubicacion: Value(reporte.ubicacion),
            creadoPor: reporte.creadoPor,
            creadoEn: reporte.creadoEn,
            estado: reporte.estado.asString,
            glpiTicketId: Value(reporte.glpiTicketId),
            metadata: Value(
              reporte.metadata != null ? jsonEncode(reporte.metadata) : null,
            ),
          ),
        );

    await tt
        .into(tt.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'reporte',
            entidadId: reporte.id,
            accion: 'create',
            payload: Value({
              'id': reporte.id,
              'titulo': reporte.titulo,
              'descripcion': reporte.descripcion,
              'area': reporte.area,
              'estado': reporte.estado.asString,
              'creadorId': reporte.creadoPor,
              'usuarioId': reporte.creadoPor,
            }),
          ),
        );
  }

  @override
  Future<List<Reporte>> obtenerReportes() async {
    var local = await _bYc7uVAyr();

    if (pVn != null) {
      try {
        final remote = await _ivjPAGEYXA9bs1siBvd();
        if (remote.isNotEmpty) {
          await _l0plWa9lADlIS4mQ9om45(remote);
          local = await _bYc7uVAyr();
        }
      } catch (_) {}
    }

    return local;
  }

  Future<List<Reporte>> _bYc7uVAyr() async {
    final rows = await tt.select(tt.reportesTable).get();

    return rows.map((r) {
      return Reporte(
        id: r.id,
        titulo: r.titulo,
        descripcion: r.descripcion,
        categoria: r.categoria,
        area: r.area,
        activo: r.activo,
        ubicacion: r.ubicacion,
        creadoPor: r.creadoPor,
        creadoEn: r.creadoEn,
        estado: ReporteEstadoX.fromString(r.estado),
        glpiTicketId: r.glpiTicketId,
        metadata: r.metadata != null ? jsonDecode(r.metadata!) : null,
      );
    }).toList();
  }

  Future<List<Map<String, dynamic>>> _ivjPAGEYXA9bs1siBvd() async {
    final candidates = <String>['/reportes', '/reporte'];

    Object? lastError;
    for (final path in candidates) {
      try {
        final res = await pVn!.get(path);
        final list = _iy2VIjcsoBz(res.data);
        return list;
      } catch (e) {
        lastError = e;
      }
    }
    throw lastError ?? Exception('No se pudo obtener reportes');
  }

  List<Map<String, dynamic>> _iy2VIjcsoBz(dynamic data) {
    dynamic root = data;
    if (root is Map<String, dynamic>) {
      root = root['data'] ?? root['items'] ?? root['result'] ?? root;
    }

    if (root is List) {
      return root
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }

    if (root is Map<String, dynamic>) {
      final inner = root['data'] ?? root['items'] ?? root['result'];
      if (inner is List) {
        return inner
            .whereType<Map>()
            .map((e) => Map<String, dynamic>.from(e))
            .toList();
      }
    }

    return const <Map<String, dynamic>>[];
  }

  Future<void> _l0plWa9lADlIS4mQ9om45(List<Map<String, dynamic>> remote) async {
    for (final r in remote) {
      final id = (r['id'] ?? '').toString();
      if (id.isEmpty) continue;

      final titulo = (r['titulo'] ?? '').toString();
      final descripcion = (r['descripcion'] ?? '').toString();
      final area = (r['area'] ?? '').toString();
      final estadoStr = (r['estado'] ?? 'enviado').toString();
      final creadorId = (r['creadorId'] ?? r['usuarioId'] ?? 'unknown')
          .toString();

      final createdAtRaw = r['createdAt'];
      DateTime creadoEn;
      if (createdAtRaw is String) {
        creadoEn = DateTime.tryParse(createdAtRaw) ?? DateTime.now();
      } else {
        creadoEn = DateTime.now();
      }

      final categoria = (r['categoria'] ?? 'General').toString();

      await tt
          .into(tt.reportesTable)
          .insert(
            ReportesTableCompanion.insert(
              id: id,
              titulo: titulo,
              descripcion: descripcion,
              categoria: categoria,
              area: area,
              activo: const Value(null),
              ubicacion: const Value(null),
              creadoPor: creadorId,
              creadoEn: creadoEn,
              estado: ReporteEstadoX.fromString(estadoStr).asString,
              glpiTicketId: const Value(null),
              metadata: const Value(null),
            ),
            mode: InsertMode.insertOrReplace,
          );
    }
  }
}

class YFN4UOLKRErF0zB {
  final TareaRepository mKIjpL4jh1;
  final NotificacionRepository vzk3Dzfc2O8aCGgf;

  YFN4UOLKRErF0zB(this.mKIjpL4jh1, this.vzk3Dzfc2O8aCGgf);

  Future<void> xJaXqYSeLc(Tarea tarea) async {
    await mKIjpL4jh1.crearTarea(tarea);

    await vzk3Dzfc2O8aCGgf.crear(
      tipo: NotificacionTipo.tarea.name,
      titulo: 'Nueva tarea asignada',
      mensaje: tarea.titulo,
      referenciaId: tarea.id,
    );
  }
}

class QrcWKMuam {
  final AppEnv aLK;

  final List<String> lre0xaeol5A2xtH;
  final String yvEsMkca7s;
  final int nXa1YWL;
  final bool iPaqsyrv;
  final String lXXb6wgZCAco;
  final bool eRP61H;
  final String dSM4pBPjdVC;
  final String ijWnk6vFqfO9;
  final int ejYboNDRRcKW;
  final int hxRM3fYjRiKhH;
  final List<String> v5CqdjIunXt7w2G0;
  final bool gduW6QmUraG3r8Bc;
  final bool jiT2qhvZ;
  final bool twzCpEycwe;

  const QrcWKMuam({
    required this.aLK,
    required this.lre0xaeol5A2xtH,
    required this.yvEsMkca7s,
    required this.nXa1YWL,
    required this.iPaqsyrv,
    required this.lXXb6wgZCAco,
    required this.eRP61H,
    required this.dSM4pBPjdVC,
    required this.ijWnk6vFqfO9,
    required this.ejYboNDRRcKW,
    required this.hxRM3fYjRiKhH,
    required this.v5CqdjIunXt7w2G0,
    required this.gduW6QmUraG3r8Bc,
    required this.jiT2qhvZ,
    required this.twzCpEycwe,
  });
}

final appDatabaseProvider = Provider<CiQEfOmbPmN>((ref) {
  final db = CiQEfOmbPmN();
  ref.onDispose(() async {
    await db.close();
  });

  return db;
});

abstract class EiegDY8Dyqfc3vZ {
  Future<void> eTT4sEmecF(QJdYP tarea);

  Future<void> fOVxlmWkZDT0QkSJ({
    required String tareaId,
    required FgLh1V42LZ8 estado,
  });

  Future<List<QJdYP>> mHHKR1uDOUWxqBHuzt(String asignadoA);

  Future<List<QJdYP>> dEFo9xcvGkBa1Tfrz(String creadoPor);

  Future<List<QJdYP>> uRtIM4x4ida5();
}

class SpDYIdOpaSs7R {
  final List<String> zrxfGdlDhvBfrql;

  const SpDYIdOpaSs7R({
    required this.zrxfGdlDhvBfrql,
  });
}

class WbpePJ3kboJ3Y0p7htts0KrLP1 {
  final AppDatabase dw;

  WbpePJ3kboJ3Y0p7htts0KrLP1(this.dw);

  Future<void> snZH27bTrGSA7uSjV({
    required String tareaId,
    required String autorId,
    required String mensaje,
  }) async {
    final c = TareaComentario(
      id: const Uuid().v4(),
      tareaId: tareaId,
      autorId: autorId,
      mensaje: mensaje,
      creadoEn: DateTime.now(),
    );

    await dw
        .into(dw.tareaComentariosTable)
        .insert(
          TareaComentariosTableCompanion.insert(
            id: c.id,
            tareaId: c.tareaId,
            autorId: c.autorId,
            mensaje: c.mensaje,
            creadoEn: c.creadoEn,
          ),
        );

    await dw
        .into(dw.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea_comentario',
            entidadId: c.id,
            accion: 'create',
            payload: Value({
              'id': c.id,
              'tareaId': c.tareaId,
              'usuarioId': c.autorId,
              'mensaje': c.mensaje,
            }),
          ),
        );
  }

  Stream<List<TareaComentario>> kXjwA2jXQtC2xtX(String tareaId) {
    return (dw.select(dw.tareaComentariosTable)
          ..where((c) => c.tareaId.equals(tareaId))
          ..orderBy([(c) => OrderingTerm.asc(c.creadoEn)]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => TareaComentario(
                  id: r.id,
                  tareaId: r.tareaId,
                  autorId: r.autorId,
                  mensaje: r.mensaje,
                  creadoEn: r.creadoEn,
                ),
              )
              .toList(growable: false),
        );
  }
}

final lanStatusProvider = StreamProvider<TmFstXFl2>((ref) async* {
  final guard = ref.read(lanGuardProvider);

  yield TmFstXFl2.o14gHjvZ;

  TmFstXFl2? lastEmitted;
  var delay = const Duration(seconds: 5);

  while (true) {
    final status = await guard.f9pEA();

    if (status != lastEmitted) {
      lastEmitted = status;
      yield status;
    }

    if (status == TmFstXFl2.sUXQy7BNP) {
      delay = const Duration(seconds: 5);
    } else if (status == TmFstXFl2.uvp7RkNl7n) {
      final nextSeconds = (delay.inSeconds * 2).clamp(5, 60);
      delay = Duration(seconds: nextSeconds);
    } else if (status == TmFstXFl2.s8cS9fN8yAl9) {
      delay = const Duration(seconds: 15);
    } else {
      delay = const Duration(seconds: 5);
    }

    await Future.delayed(delay);
  }
});

class U2LjjD75Lvt {
  final String ipOhswSMZ;
  final String r8HSlR24x;
  final String yA2FNyLd4;
  final List<String> dQuS4EoUshJk;

  U2LjjD75Lvt({
    required this.ipOhswSMZ,
    required this.r8HSlR24x,
    required this.yA2FNyLd4,
    required this.dQuS4EoUshJk,
  });
}

class KTUDj7AS1yEfeWPdov extends StatelessWidget {
  final GerenciaTheme xPamA;

  const KTUDj7AS1yEfeWPdov({super.key, required this.xPamA});

  @override
  Widget build(BuildContext context) {
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
      appBar: GerenciaAppBar(theme: xPamA, title: 'Generador de reportes'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        children: [
          Text(
            'Selecciona un formato',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
          SizedBox(height: isTablet ? 20 : 16),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Mantenimiento - Site',
            dOEO2oYG: 'Formato rep_mantto_sites',
            bHmr: _HMx9jKozd201.rZldct2i9t,
          ),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Mantenimiento - Mostrador',
            dOEO2oYG: 'Formato rep_mantto_mostra',
            bHmr: _HMx9jKozd201.l3FPqCXDlWTUyZl,
          ),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Checklist ETP',
            dOEO2oYG: 'Formato cl_etp',
            bHmr: _HMx9jKozd201.ifA,
          ),
        ],
      ),
    );
  }
}

enum _HMx9jKozd201 { rZldct2i9t, l3FPqCXDlWTUyZl, ifA }

class _CuErs1eNjOM7 extends ConsumerWidget {
  final GerenciaTheme n2C5H;
  final String oaUX7;
  final String dOEO2oYG;
  final _HMx9jKozd201 bHmr;

  const _CuErs1eNjOM7({
    required this.n2C5H,
    required this.oaUX7,
    required this.dOEO2oYG,
    required this.bHmr,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final cs = Theme.of(context).colorScheme;

    final (icon, accent) = switch (bHmr) {
      _HMx9jKozd201.rZldct2i9t => (Icons.factory_outlined, cs.primaryContainer),
      _HMx9jKozd201.l3FPqCXDlWTUyZl => (
        Icons.storefront_outlined,
        cs.secondaryContainer,
      ),
      _HMx9jKozd201.ifA => (Icons.checklist_outlined, cs.tertiaryContainer),
    };

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final user = ref.read(authControllerProvider).user;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  switch (bHmr) {
                    case _HMx9jKozd201.rZldct2i9t:
                      return RnCxkgoHNv1RjLU7JwbJH3oTbkay5q(
                        rhf0q: n2C5H,
                        z00CsXKuVn: ReportsCatalog.mantenimientoSites,
                        iGOnsX4P: user?.nombre ?? '',
                        y2zWoPIB: user?.area ?? '',
                      );
                    case _HMx9jKozd201.l3FPqCXDlWTUyZl:
                      return RnCxkgoHNv1RjLU7JwbJH3oTbkay5q(
                        rhf0q: n2C5H,
                        z00CsXKuVn: ReportsCatalog.mantenimientoMostrador,
                        iGOnsX4P: user?.nombre ?? '',
                        y2zWoPIB: user?.area ?? '',
                      );
                    case _HMx9jKozd201.ifA:
                      return EhxhpNzmE1p0vjyJcCc56y(
                        fnm2Y: n2C5H,
                        yMbKtsQDOk: ReportsCatalog.checklistEtp,
                        npydikRi: user?.nombre ?? '',
                        oUvNQD8S0PVzV: user?.area ?? '',
                      );
                  }
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 52 : 48,
                  height: isTablet ? 52 : 48,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 14),
                  ),
                  child: Icon(
                    icon,
                    color: cs.onPrimaryContainer,
                    size: isTablet ? 28 : 24,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oaUX7,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.w800,
                          color: cs.onSurface,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        dOEO2oYG,
                        style: TextStyle(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Abrir formulario',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: cs.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 22 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RnCxkgoHNv1RjLU7JwbJH3oTbkay5q extends ConsumerStatefulWidget {
  final GerenciaTheme rhf0q;
  final ChecklistReportDefinition z00CsXKuVn;
  final String iGOnsX4P;
  final String y2zWoPIB;

  const RnCxkgoHNv1RjLU7JwbJH3oTbkay5q({
    super.key,
    required this.rhf0q,
    required this.z00CsXKuVn,
    required this.iGOnsX4P,
    required this.y2zWoPIB,
  });

  @override
  ConsumerState<RnCxkgoHNv1RjLU7JwbJH3oTbkay5q> createState() =>
      _Fo12bWHlGwn5aJNEuqDX3OrK1ttUGf93usx();
}

class _Fo12bWHlGwn5aJNEuqDX3OrK1ttUGf93usx
    extends ConsumerState<RnCxkgoHNv1RjLU7JwbJH3oTbkay5q> {
  var _yvsf8fWSKK = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.rhf0q,
        title: widget.z00CsXKuVn.title,
      ),
      body: Stack(
        children: [
          ChecklistReportForm(
            definition: widget.z00CsXKuVn,
            onSubmit: _mz8drC44,
          ),
          if (_yvsf8fWSKK)
            const Positioned.fill(
              child: ColoredBox(
                color: Color(0x88000000),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _mz8drC44(ChecklistReportDraft draft) async {
    if (_yvsf8fWSKK) return;
    setState(() => _yvsf8fWSKK = true);

    try {
      final bytes = await MaintenancePreventivoPdf.build(
        definition: widget.z00CsXKuVn,
        draft: draft,
      );

      final safeId = draft.reportTypeId.replaceAll(
        RegExp(r'[^a-zA-Z0-9_-]'),
        '',
      );
      final filename =
          'reporte_${safeId}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      await ref
          .read(generatedPdfRepositoryProvider)
          .add(
            GeneratedPdf(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              filename: filename,
              localPath: file.path,
              createdAt: DateTime.now(),
              createdByUserId: user?.id ?? '',
              createdByName: user?.nombre ?? '',
              area: user?.area ?? '',
              gerenciaId: user?.resolvedGerenciaId,
              source: 'reporte',
            ),
          );
      ref.invalidate(generatedPdfsProvider);

      await PdfFileService.openFile(file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo generar PDF: $e')));
    } finally {
      if (mounted) setState(() => _yvsf8fWSKK = false);
    }
  }
}

class EhxhpNzmE1p0vjyJcCc56y extends ConsumerStatefulWidget {
  final GerenciaTheme fnm2Y;
  final EtpChecklistDefinition yMbKtsQDOk;
  final String npydikRi;
  final String oUvNQD8S0PVzV;

  const EhxhpNzmE1p0vjyJcCc56y({
    super.key,
    required this.fnm2Y,
    required this.yMbKtsQDOk,
    required this.npydikRi,
    required this.oUvNQD8S0PVzV,
  });

  @override
  ConsumerState<EhxhpNzmE1p0vjyJcCc56y> createState() =>
      _WMCQI09meSePHYFgxKI8bvraYMU();
}

class _WMCQI09meSePHYFgxKI8bvraYMU
    extends ConsumerState<EhxhpNzmE1p0vjyJcCc56y> {
  var _vz8RZexcvU = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.fnm2Y,
        title: widget.yMbKtsQDOk.title,
      ),
      body: Stack(
        children: [
          EtpChecklistForm(
            definition: widget.yMbKtsQDOk,
            userName: widget.npydikRi,
            checklistName: widget.oUvNQD8S0PVzV,
            onSubmit: _m7pqDUaf,
          ),
          if (_vz8RZexcvU)
            const Positioned.fill(
              child: ColoredBox(
                color: Color(0x88000000),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _m7pqDUaf(EtpChecklistDraft draft) async {
    if (_vz8RZexcvU) return;
    setState(() => _vz8RZexcvU = true);

    try {
      final bytes = await EtpChecklistPdf.build(
        definition: widget.yMbKtsQDOk,
        draft: draft,
      );

      final safeId = draft.reportTypeId.replaceAll(
        RegExp(r'[^a-zA-Z0-9_-]'),
        '',
      );
      final filename =
          'checklist_${safeId}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      await ref
          .read(generatedPdfRepositoryProvider)
          .add(
            GeneratedPdf(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              filename: filename,
              localPath: file.path,
              createdAt: DateTime.now(),
              createdByUserId: user?.id ?? '',
              createdByName: user?.nombre ?? '',
              area: user?.area ?? '',
              gerenciaId: user?.resolvedGerenciaId,
              source: 'reporte',
            ),
          );
      ref.invalidate(generatedPdfsProvider);

      if (user != null && user.id.trim().isNotEmpty) {
        final tarea = Tarea(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          reporteId: 'checklist:$safeId',
          titulo: filename,
          descripcion: filename,
          creadoPor: user.id,
          asignadoA: user.id,
          estado: TareaEstado.pendiente,
        );
        await ref.read(tareaControllerProvider).crearTarea(tarea);
      }

      await PdfFileService.openFile(file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo generar PDF: $e')));
    } finally {
      if (mounted) setState(() => _vz8RZexcvU = false);
    }
  }
}

abstract class XIWrqWibgCzh6LQky {
  Future<void> qwZRQyZ3isRW(RVvHrcu reporte);
  Future<List<RVvHrcu>> mpKDucC1Cwiao2C();
}

class WBcR9YHktYr1jJXQ5C {
  final int xF;
  final String el6gcA;
  final int cVkkh0I6e2;
  final int jk6hZl98fG;
  final String snWzQObVgPR;

  const WBcR9YHktYr1jJXQ5C({
    required this.xF,
    required this.el6gcA,
    required this.cVkkh0I6e2,
    required this.jk6hZl98fG,
    required this.snWzQObVgPR,
  });

  factory WBcR9YHktYr1jJXQ5C.qkXdEpJQ(Map<String, dynamic> json) {
    final id = json['id'] ?? json['id_cl'] ?? json['checklist_id'];

    return WBcR9YHktYr1jJXQ5C(
      xF: int.tryParse(id?.toString() ?? '') ?? 0,
      el6gcA: (json['nombre_cl'] ?? json['nombre'] ?? '').toString(),
      cVkkh0I6e2:
          int.tryParse(
            (json['gerencia_cl'] ??
                    json['gerencia_id'] ??
                    json['gerenciaId'] ??
                    '')
                .toString(),
          ) ??
          0,
      jk6hZl98fG:
          int.tryParse(
            (json['jefatura'] ??
                    json['jefatura_id'] ??
                    json['jefaturaId'] ??
                    '')
                .toString(),
          ) ??
          0,
      snWzQObVgPR: (json['funcion_form'] ?? json['funcionForm'] ?? '')
          .toString(),
    );
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.read(appDatabaseProvider));
});

final dashboardMetricsProvider = FutureProvider<DashboardMetrics>((ref) async {
  return ref.read(dashboardRepositoryProvider).obtenerMetricas();
});

class Z5GmlKPdd3BaxOC {
  static Future<Uint8List> zQg8s({
    required TOrYuZvGOIatVhQ7HHjUs5 definition,
    required NfW2LWZq2KjvbSa3C draft,
    String leftLogoAsset = 'assets/img/login.png',
    String rightLogoAsset = 'assets/img/logo_ae.png',
  }) async {
    final pdf = pw.Document();

    final now = draft.qOp52xkYl;
    final dia = DateFormat('dd').format(now);
    final mes = DateFormat('MM').format(now);
    final year = DateFormat('yyyy').format(now);

    final imageLeft = (await rootBundle.load(
      leftLogoAsset,
    )).buffer.asUint8List();
    final imageRight = (await rootBundle.load(
      rightLogoAsset,
    )).buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return [
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(
                    width: 80,
                    height: 80,
                    child: pw.Image(
                      pw.MemoryImage(imageLeft),
                      fit: pw.BoxFit.contain,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      definition.gIVWK0AnkqvrFz,
                      style: pw.TextStyle(
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.SizedBox(
                    width: 80,
                    height: 80,
                    child: pw.Image(
                      pw.MemoryImage(imageRight),
                      fit: pw.BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(child: pw.Text('Nombre: ${draft.t3aSr7z2}')),
                pw.Expanded(
                  child: pw.Text(
                    'Fecha: $dia/$mes/$year',
                    textAlign: pw.TextAlign.end,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(child: pw.Text('Area: ${draft.k7YAey0RC6sEJ}')),
                pw.Expanded(child: pw.Text('', textAlign: pw.TextAlign.end)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              cellAlignment: pw.Alignment.center,
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
                border: pw.Border.all(width: 1, color: PdfColors.black),
              ),
              cellDecoration: (index, data, rowNum) => pw.BoxDecoration(
                border: pw.Border.all(width: 1, color: PdfColors.black),
              ),
              headers: const [
                'Sistema/Equipo',
                'Cable Roto',
                'Falla Red',
                'Anomalías',
                'Observaciones',
              ],
              data: draft.kfQ8o.map((it) {
                return [
                  it.gFSF1,
                  it.ybLGi2BbR ? 'X' : '',
                  it.myA5Emfw ? 'X' : '',
                  it.mKlRFyNhx,
                  it.aBEipUYKaEqit,
                ];
              }).toList(),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 2, color: PdfColors.blue),
                borderRadius: pw.BorderRadius.circular(6),
              ),
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Resumen',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'Total de sistemas revisados: ${draft.kfQ8o.length}',
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                  pw.Text(
                    'Sistemas con anomalías: ${draft.kfQ8o.where((p) => p.mKlRFyNhx.isNotEmpty).length}',
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }
}

class Q34UmEFmZpJBug5absWen858 {
  static Future<Uint8List> oryjC({
    required A32xKOUKm8KMrJkQEMBm9puVx definition,
    required IDXe8JudY4J27fMVDEST draft,
    String leftLogoAsset = 'assets/img/login.png',
    String rightLogoAsset = 'assets/img/logo_ae.png',
    int rowsPerTable = 15,
  }) async {
    final pdf = pw.Document();

    final now = draft.yS9AY8riA;
    final dia = DateFormat('dd').format(now);
    final mes = DateFormat('MM').format(now);
    final year = DateFormat('yyyy').format(now);

    final imageLeft = (await rootBundle.load(
      leftLogoAsset,
    )).buffer.asUint8List();
    final imageRight = (await rootBundle.load(
      rightLogoAsset,
    )).buffer.asUint8List();

    final chunks = _iC0sH(draft.y6Dy1, rowsPerTable);

    final imagesByItemId = <String, List<Uint8List>>{};
    for (final item in draft.y6Dy1) {
      if (item.y35qpUs2ZT.isEmpty) continue;
      final bytesList = <Uint8List>[];
      for (final path in item.y35qpUs2ZT) {
        try {
          final bytes = await File(path).readAsBytes();
          bytesList.add(bytes);
        } catch (e) {
          debugPrint('Error loading image $path: $e');
        }
      }
      if (bytesList.isNotEmpty) {
        imagesByItemId[item.oVxZdl] = bytesList;
      }
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          final widgets = <pw.Widget>[];

          widgets.add(
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(
                    width: 80,
                    height: 80,
                    child: pw.Image(
                      pw.MemoryImage(imageLeft),
                      fit: pw.BoxFit.contain,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      definition.bVUNaMkVhBAwRt,
                      style: pw.TextStyle(
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.SizedBox(
                    width: 80,
                    height: 80,
                    child: pw.Image(
                      pw.MemoryImage(imageRight),
                      fit: pw.BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );

          widgets.add(pw.SizedBox(height: 10));

          widgets.add(
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      '${definition.xUX9iztXXpohN}: ',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      draft.fQbZ.isEmpty ? '_______________' : draft.fQbZ,
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: draft.fQbZ.isEmpty
                            ? PdfColors.grey600
                            : PdfColors.black,
                      ),
                    ),
                  ],
                ),
                pw.Expanded(
                  child: pw.Text(
                    'Fecha: $dia/$mes/$year',
                    textAlign: pw.TextAlign.end,
                  ),
                ),
              ],
            ),
          );

          widgets.add(pw.SizedBox(height: 5));

          widgets.add(
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      'Responsable: ',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      draft.cslvKXrhK6M.isEmpty
                          ? '_______________'
                          : draft.cslvKXrhK6M,
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: draft.cslvKXrhK6M.isEmpty
                            ? PdfColors.grey600
                            : PdfColors.black,
                      ),
                    ),
                  ],
                ),
                pw.Expanded(
                  child: pw.Text(
                    'Folio: ${draft.syA1h.isEmpty ? '_______________' : draft.syA1h}',
                    textAlign: pw.TextAlign.end,
                  ),
                ),
              ],
            ),
          );

          widgets.add(pw.SizedBox(height: 20));

          for (var chunkIndex = 0; chunkIndex < chunks.length; chunkIndex++) {
            final part = chunks[chunkIndex];

            widgets.add(
              pw.Text(
                definition.xAWWV,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            );
            widgets.add(pw.SizedBox(height: 5));

            widgets.add(_ocf6hoizP3(part));

            widgets.add(pw.SizedBox(height: 20));

            final hasImages = part.any(
              (i) => (imagesByItemId[i.oVxZdl] ?? const []).isNotEmpty,
            );
            if (hasImages) {
              widgets.add(
                pw.Text(
                  'Evidencias fotográficas - ${definition.xAWWV}',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              );
              widgets.add(pw.SizedBox(height: 10));

              for (var i = 0; i < part.length; i++) {
                final item = part[i];
                final bytesList =
                    imagesByItemId[item.oVxZdl] ?? const <Uint8List>[];
                if (bytesList.isEmpty) continue;

                widgets.add(
                  pw.Text(
                    '${_cwPu63t5OPp(draft.y6Dy1, item.oVxZdl) + 1}. ${item.eGm7S}',
                    style: pw.TextStyle(
                      fontSize: 11,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                );
                widgets.add(pw.SizedBox(height: 5));

                widgets.add(
                  pw.Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: bytesList
                        .map(
                          (b) => pw.Container(
                            width: 160,
                            height: 120,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey600),
                            ),
                            child: pw.Image(
                              pw.MemoryImage(b),
                              fit: pw.BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );

                widgets.add(pw.SizedBox(height: 12));
              }
            }

            if (chunkIndex != chunks.length - 1) {
              widgets.add(pw.SizedBox(height: 12));
            }
          }

          return widgets;
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _ocf6hoizP3(List<FrKyfgAdXg4rDE7QpFC> items) {
    return pw.Table(
      border: pw.TableBorder.all(width: 1, color: PdfColors.black),
      columnWidths: {
        0: const pw.FixedColumnWidth(180),
        1: const pw.FixedColumnWidth(60),
        2: const pw.FixedColumnWidth(60),
        3: const pw.FlexColumnWidth(),
      },
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey300),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text(
                'Generalidades',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text(
                'Cumple',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text(
                'No cumple',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text(
                'Observaciones',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
        ...items.map((product) {
          return pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  product.eGm7S,
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  product.xDksiE ? 'X' : '',
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  product.jjrHH614 ? 'X' : '',
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  product.hlbyb6DeF9B,
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  static List<List<T>> _iC0sH<T>(List<T> list, int size) {
    if (size <= 0) return [list];
    final out = <List<T>>[];
    for (var i = 0; i < list.length; i += size) {
      out.add(list.sublist(i, i + size > list.length ? list.length : i + size));
    }
    return out;
  }

  static int _cwPu63t5OPp(List<FrKyfgAdXg4rDE7QpFC> all, String itemId) {
    return all.indexWhere((e) => e.oVxZdl == itemId);
  }
}

class Lp9cGlFl extends StatelessWidget {
  final String coS9K;
  final IconData rPdL;
  final Color eadD9;
  final VoidCallback rzBTF;

  const Lp9cGlFl({
    super.key,
    required this.coS9K,
    required this.rPdL,
    required this.eadD9,
    required this.rzBTF,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: rzBTF,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [eadD9, eadD9.withValues(alpha: 0.8)],
            ),
            borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
            boxShadow: [
              BoxShadow(
                color: eadD9.withValues(alpha: 0.4),
                blurRadius: isTablet ? 12 : 10,
                offset: Offset(0, isTablet ? 6 : 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(isTablet ? 20 : 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  rPdL,
                  size: isTablet ? 40 : 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isTablet ? 16 : 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 8),
                child: Text(
                  coS9K,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JvByaF7Uwqqha {
  final String fEXiH4;
  final Color cuAERFgvM0I8m;
  final Color lLaDPomRgRwkvpc;
  final IconData u4GxC227bNHkvK;

  const JvByaF7Uwqqha({
    required this.fEXiH4,
    required this.cuAERFgvM0I8m,
    required this.lLaDPomRgRwkvpc,
    required this.u4GxC227bNHkvK,
  });
}

class VB3O229kxsSo8T {
  static JvByaF7Uwqqha eoPiZjRLu(String gerenciaId) {
    final normalized = gerenciaId.trim().toUpperCase();

    switch (normalized) {
      case '1':
      case 'TICS':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Tecnologías de la Información',
          cuAERFgvM0I8m: Color(0xFF4A90E2),
          lLaDPomRgRwkvpc: Color(0xFF6FB1FC),
          u4GxC227bNHkvK: Icons.computer,
        );
      case '3':
      case 'MANTENIMIENTO':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Mantenimiento',
          cuAERFgvM0I8m: Color(0xFFFF6F00),
          lLaDPomRgRwkvpc: Color(0xFFFFB74D),
          u4GxC227bNHkvK: Icons.build,
        );
      case '4':
      case 'FAUNA':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Fauna',
          cuAERFgvM0I8m: Color(0xFF388E3C),
          lLaDPomRgRwkvpc: Color(0xFF66BB6A),
          u4GxC227bNHkvK: Icons.pets,
        );
      case 'OPERACIONES':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Operaciones',
          cuAERFgvM0I8m: Color(0xFF2ECC71),
          lLaDPomRgRwkvpc: Color(0xFF58D68D),
          u4GxC227bNHkvK: Icons.flight_takeoff,
        );
      default:
        return const JvByaF7Uwqqha(
          fEXiH4: 'General',
          cuAERFgvM0I8m: Colors.blue,
          lLaDPomRgRwkvpc: Colors.lightBlue,
          u4GxC227bNHkvK: Icons.business,
        );
    }
  }
}

class NTH9i9aPwrRRm8OPAhRpr2 {
  final Dio bFo;

  NTH9i9aPwrRRm8OPAhRpr2({required this.bFo});

  Future<FormData> _g3eCiOdHRRQo5({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) async {
    final normalized = _u7vaVRuAaryMVhmeKmquIe4vwk(
      file: file,
      filename: filename,
      metadata: metadata,
    );

    return FormData.fromMap({
      ...normalized,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: filename,
        contentType: MediaType('application', 'pdf'),
      ),
    });
  }

  Future<String> xBl0mt4FH({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) async {
    final source = (metadata['source'] ?? '').toString().toLowerCase().trim();

    final preferred = <String>[
      '/documentos-pdf/upload',
      '/documentos_pdf/upload',
      if (source == 'checklist') '/checklists/adjuntos',
      if (source == 'reporte') '/reportes/adjuntos',
      if (source != 'checklist' && source != 'reporte') '/tareas/adjuntos',
    ];

    final candidates = <String>[
      ...preferred,
      '/pdfs',
      '/pdfs/upload',
      '/documentos/pdf',
      '/documentos_pdf',
      '/checklists/pdf',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        final formData = await _g3eCiOdHRRQo5(
          file: file,
          filename: filename,
          metadata: metadata,
        );
        final res = await bFo.post(path, data: formData);
        final data = res.data;
        if (data is Map) {
          final m = data.cast<String, dynamic>();
          final url = (m['url'] ?? m['publicUrl'] ?? m['url_storage'] ?? '')
              .toString();
          if (url.isNotEmpty) return url;
        }
        continue;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('No se encontró un endpoint para subir PDF');
  }

  Map<String, dynamic> _u7vaVRuAaryMVhmeKmquIe4vwk({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) {
    final source = (metadata['source'] ?? '').toString().toLowerCase().trim();
    final tipoDocumento = switch (source) {
      'checklist' => 'checklist',
      'reporte' => 'reporte',
      _ => 'reporte',
    };

    int? yT4Py(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      return int.tryParse(v.toString());
    }

    final usuarioNombre =
        metadata['usuarioNombre'] ??
        metadata['usuario_nombre'] ??
        metadata['usuario'];
    final gerenciaId = yT4Py(metadata['gerenciaId'] ?? metadata['gerencia_id']);
    final jefaturaId = yT4Py(metadata['jefaturaId'] ?? metadata['jefatura_id']);
    final checklistNombre =
        metadata['checklistNombre'] ?? metadata['checklist_nombre'];

    if (usuarioNombre == null || usuarioNombre.toString().trim().isEmpty) {
      throw StateError('usuario_nombre es requerido para subir el PDF');
    }

    return <String, dynamic>{
      'tipo_documento': tipoDocumento,
      'usuario_nombre': usuarioNombre,
      'gerencia_id': gerenciaId ?? 0,
      'jefatura_id': jefaturaId ?? 0,
      'checklist_nombre': (checklistNombre ?? filename).toString(),
      'nombre_archivo': filename,
      'tamano_bytes': file.lengthSync().toString(),
    };
  }
}

enum T8YWRFGIjddgKqji {
  ns5r,
  n59mswxFyhl,
  n03uct0,
  zuvpx,
}

class TIvHO3IpwKq8h6r {
  final T8YWRFGIjddgKqji ew1svY;
  final String? dNkWxlu;

  const TIvHO3IpwKq8h6r({
    this.ew1svY = T8YWRFGIjddgKqji.ns5r,
    this.dNkWxlu,
  });

  TIvHO3IpwKq8h6r hFkHQFYX({
    T8YWRFGIjddgKqji? status,
    String? message,
  }) {
    return TIvHO3IpwKq8h6r(
      ew1svY: status ?? this.ew1svY,
      dNkWxlu: message,
    );
  }
}

class K0WQpasZb3yUjqQaJp48moMa implements AsistenciaRepository {
  final AppDatabase by;

  K0WQpasZb3yUjqQaJp48moMa(this.by);

  @override
  Future<void> registrar({
    required String usuarioId,
    required TipoAsistencia tipo,
    required String metodo,
  }) async {
    final id = await by
        .into(by.asistenciaTable)
        .insert(
          AsistenciaTableCompanion.insert(
            usuarioId: usuarioId,
            fechaHora: DateTime.now(),
            tipo: tipo.name, // entrada | salida
            metodo: Value(metodo), // manual / biometrico
            sincronizado: const Value(false),
          ),
        );

    await by
        .into(by.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'asistencia',
            entidadId: id.toString(),
            accion: 'create',
            payload: const Value(null),
          ),
        );
  }

  @override
  Future<List<Asistencia>> obtenerHistorial(String usuarioId) async {
    final rows =
        await (by.select(by.asistenciaTable)
              ..where((a) => a.usuarioId.equals(usuarioId))
              ..orderBy([(a) => OrderingTerm.desc(a.fechaHora)]))
            .get();

    return rows
        .map(
          (a) => Asistencia(
            id: a.id,
            usuarioId: a.usuarioId,
            fechaHora: a.fechaHora,
            tipo: TipoAsistencia.values.byName(a.tipo),
            metodo: a.metodo,
            sincronizado: a.sincronizado,
          ),
        )
        .toList();
  }
}

enum Rl13JzlRLG33iqP {
  ltLLKYhinTg,
  yneafBerP6,
}

class FMiwu4wtBwxE {
  final String fZtJ3l;
  final Rl13JzlRLG33iqP jyy;

  FMiwu4wtBwxE({
    required this.fZtJ3l,
    required this.jyy,
  });
}

enum J7OYk8rIWDVpkP {
  eKYrnx3,
  asG53i,
}

class GXcG6a0OPJ {
  final int dd;
  final String oZr53E57z;
  final DateTime cfduGXXkZ;
  final J7OYk8rIWDVpkP ehfA;
  final String jYfRMJ; // manual / biometrico (futuro)
  final bool u2aCQFocSFuc;

  GXcG6a0OPJ({
    required this.dd,
    required this.oZr53E57z,
    required this.cfduGXXkZ,
    required this.ehfA,
    required this.jYfRMJ,
    required this.u2aCQFocSFuc,
  });
}

class R7hXKM6tAZNKFFb {
  static const _nlo9omyp = 'users_cache_v1';

  final Dio iVC;
  final SharedPreferences mznVX;

  R7hXKM6tAZNKFFb({required this.iVC, required this.mznVX});

  List<SpHMLML>? ooogGHMNl() {
    final raw = mznVX.getString(_nlo9omyp);
    if (raw == null || raw.trim().isEmpty) return null;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return null;

      final users = <SpHMLML>[];
      for (final item in decoded) {
        if (item is! Map) continue;
        final map = item.cast<String, dynamic>();
        final id = (map['id'] ?? map['userId'] ?? map['uuid'] ?? '').toString();
        final name = (map['name'] ?? map['nombre'] ?? map['username'] ?? '')
            .toString();
        if (id.trim().isEmpty || name.trim().isEmpty) continue;
        users.add(SpHMLML(bf: id, xQjl: name));
      }
      users.sort(
        (a, b) => a.xQjl.toLowerCase().compareTo(b.xQjl.toLowerCase()),
      );
      return users;
    } catch (_) {
      return null;
    }
  }

  Future<List<SpHMLML>> tnAEvwmAeq4fL({int? gerenciaId}) async {
    final candidates = <_LoaO5tvtUmF7Oa>[
      _LoaO5tvtUmF7Oa('/users', _tsemKMb1xo(gerenciaId)),
      _LoaO5tvtUmF7Oa('/usuarios', _tsemKMb1xo(gerenciaId)),

      _LoaO5tvtUmF7Oa('/tareas/asignables', null),
      _LoaO5tvtUmF7Oa('/tareas/usuarios', null),
    ];

    Future<Response<dynamic>> eQL0NrHQgvt34VqKy4dT0qjgYZ(
      _LoaO5tvtUmF7Oa candidate,
    ) async {
      try {
        return await iVC.get(
          candidate.a4Xl,
          queryParameters: candidate.em352AitxMEvujH,
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        final baseUrl = iVC.options.baseUrl;
        final canTryWithoutApi =
            status == 404 &&
            baseUrl.endsWith('/api') &&
            candidate.a4Xl.startsWith('/');
        if (!canTryWithoutApi) rethrow;

        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi${candidate.a4Xl}').replace(
          queryParameters: candidate.em352AitxMEvujH?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await iVC.getUri(uri);
      }
    }

    DioException? last;

    for (final c in candidates) {
      try {
        final res = await eQL0NrHQgvt34VqKy4dT0qjgYZ(c);
        final parsed = _eSMOJdmYSKImEHtQz(res.data);
        if (parsed.isEmpty) {
          continue;
        }

        await _mLgVOeSoCd(parsed);
        return parsed;
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if (status == 401 || status == 403) {
          throw StateError('No autorizado: inicia sesión de nuevo');
        }
        if (status == 404) {
          last = e;
          continue;
        }

        if (status == 400) {
          final msg = (e.response?.data is Map)
              ? ((e.response?.data as Map)['message'] ?? '').toString()
              : (e.response?.data ?? '').toString();
          if (msg.toLowerCase().contains('invalid id')) {
            last = e;
            continue;
          }
        }
        last = e;
      }
    }

    if (last != null) throw last;
    throw StateError(
      'No se pudo cargar usuarios. El backend no expuso un endpoint de usuarios o requiere un parámetro adicional.',
    );
  }

  Future<List<SpHMLML>> bFJUUKdn({int? gerenciaId}) async {
    try {
      return await tnAEvwmAeq4fL(gerenciaId: gerenciaId);
    } on DioException catch (e) {
      final cached = ooogGHMNl();
      if (cached != null && cached.isNotEmpty) return cached;

      if (_hpKTKk0iFEaGA7KXnEl(e)) {
        final baseUrl = iVC.options.baseUrl;
        throw StateError(
          'Servidor no disponible. Verifica que estés en la LAN/VPN y que el backend esté encendido. ($baseUrl)',
        );
      }

      rethrow;
    } catch (_) {
      final cached = ooogGHMNl();
      if (cached != null && cached.isNotEmpty) return cached;
      rethrow;
    }
  }

  bool _hpKTKk0iFEaGA7KXnEl(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }

  Future<void> _mLgVOeSoCd(List<SpHMLML> users) async {
    final payload = users
        .map((u) => <String, dynamic>{'id': u.bf, 'name': u.xQjl})
        .toList(growable: false);
    await mznVX.setString(_nlo9omyp, jsonEncode(payload));
  }

  List<SpHMLML> _eSMOJdmYSKImEHtQz(dynamic data) {
    dynamic listData = data;

    if (data is Map) {
      final map = data.cast<String, dynamic>();
      listData =
          map['data'] ??
          map['items'] ??
          map['usuarios'] ??
          map['users'] ??
          map['asignables'] ??
          map['result'];
    }

    if (listData is! List) return const <SpHMLML>[];

    final users = <SpHMLML>[];
    for (final item in listData) {
      if (item is! Map) continue;
      final map = item.cast<String, dynamic>();

      final id =
          (map['id'] ??
                  map['userId'] ??
                  map['usuarioId'] ??
                  map['usuario_id'] ??
                  map['uuid'] ??
                  '')
              .toString();

      final nombre = (map['nombre'] ?? map['name'] ?? map['username'] ?? '')
          .toString();
      final apellido = (map['apellido'] ?? map['lastName'] ?? '').toString();

      final displayName =
          ('${nombre.trim()} ${apellido.trim()}'.trim().isNotEmpty
                  ? '${nombre.trim()} ${apellido.trim()}'.trim()
                  : id)
              .trim();

      if (id.trim().isEmpty || displayName.isEmpty) continue;
      users.add(SpHMLML(bf: id, xQjl: displayName));
    }

    users.sort((a, b) => a.xQjl.toLowerCase().compareTo(b.xQjl.toLowerCase()));
    return users;
  }

  Map<String, dynamic>? _tsemKMb1xo(int? gerenciaId) {
    if (gerenciaId == null) return null;
    return {
      'gerenciaId': gerenciaId,
    };
  }
}

class _LoaO5tvtUmF7Oa {
  final String a4Xl;
  final Map<String, dynamic>? em352AitxMEvujH;

  _LoaO5tvtUmF7Oa(this.a4Xl, this.em352AitxMEvujH);
}

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
            if (state.bAPqE08) const CircularProgressIndicator(),

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

class Z8gTxYj2MLOinJ0B3zI implements TareaRepository {
  final AppDatabase fU;

  Z8gTxYj2MLOinJ0B3zI(this.fU);

  @override
  Future<void> crearTarea(Tarea tarea) async {
    await fU
        .into(fU.tareasTable)
        .insert(
          TareasTableCompanion.insert(
            id: tarea.id,
            groupId: Value(tarea.groupId),
            reporteId: tarea.reporteId,
            titulo: tarea.titulo,
            descripcion: Value(tarea.descripcion),
            creadoPor: Value(tarea.creadoPor),
            asignadoA: tarea.asignadoA,
            estado: tarea.estado.name,
          ),
        );

    await fU
        .into(fU.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea',
            entidadId: tarea.id,
            accion: 'create',
            payload: Value({
              'id': tarea.id,
              if (tarea.groupId != null && tarea.groupId!.trim().isNotEmpty)
                'groupId': tarea.groupId,
              'titulo': tarea.titulo,
              'reporteId': tarea.reporteId,
              'creadoPor': tarea.creadoPor,
              'asignadoA': tarea.asignadoA,
              'descripcion': tarea.descripcion,
              'creadorId': tarea.creadoPor,
              'estado': tarea.estado.name,
            }),
          ),
        );
  }

  @override
  Future<void> actualizarEstado({
    required String tareaId,
    required TareaEstado estado,
  }) async {
    await (fU.update(fU.tareasTable)..where((t) => t.id.equals(tareaId))).write(
      TareasTableCompanion(estado: Value(estado.name)),
    );

    await fU
        .into(fU.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea',
            entidadId: tareaId,
            accion: 'update_estado',
            payload: Value({'id': tareaId, 'estado': estado.name}),
          ),
        );
  }

  @override
  Future<List<Tarea>> obtenerPorAsignado(String asignadoA) async {
    final rows =
        await (fU.select(fU.tareasTable)
              ..where((t) => t.asignadoA.equals(asignadoA))
              ..orderBy([(t) => OrderingTerm.desc(t.titulo)]))
            .get();

    return rows
        .map(
          (t) => Tarea(
            id: t.id,
            groupId: t.groupId,
            reporteId: t.reporteId,
            titulo: t.titulo,
            descripcion: t.descripcion,
            creadoPor: t.creadoPor,
            asignadoA: t.asignadoA,
            estado: TareaEstado.values.byName(t.estado),
          ),
        )
        .toList();
  }

  @override
  Future<List<Tarea>> obtenerPorCreador(String creadoPor) async {
    final rows =
        await (fU.select(fU.tareasTable)
              ..where((t) => t.creadoPor.equals(creadoPor))
              ..orderBy([(t) => OrderingTerm.desc(t.titulo)]))
            .get();

    return rows
        .map(
          (t) => Tarea(
            id: t.id,
            groupId: t.groupId,
            reporteId: t.reporteId,
            titulo: t.titulo,
            descripcion: t.descripcion,
            creadoPor: t.creadoPor,
            asignadoA: t.asignadoA,
            estado: TareaEstado.values.byName(t.estado),
          ),
        )
        .toList();
  }

  @override
  Future<List<Tarea>> obtenerTodas() async {
    final rows = await (fU.select(
      fU.tareasTable,
    )..orderBy([(t) => OrderingTerm.desc(t.titulo)])).get();

    return rows
        .map(
          (t) => Tarea(
            id: t.id,
            groupId: t.groupId,
            reporteId: t.reporteId,
            titulo: t.titulo,
            descripcion: t.descripcion,
            creadoPor: t.creadoPor,
            asignadoA: t.asignadoA,
            estado: TareaEstado.values.byName(t.estado),
          ),
        )
        .toList();
  }
}

class Xura32lRWpuixuMRU extends StateNotifier<AsyncValue<List<Reporte>>> {
  final ReporteRepository mbnkVqAhgB;
  final NotificacionRepository exvOz4ephsyeyqD0;

  Xura32lRWpuixuMRU(this.mbnkVqAhgB, this.exvOz4ephsyeyqD0)
    : super(const AsyncValue.loading()) {
    _okWw();
  }

  Future<void> _okWw() async {
    try {
      final data = await mbnkVqAhgB.obtenerReportes();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> uJxtR8M() => _okWw();

  Future<void> f6fRU({
    required String titulo,
    required String descripcion,
    required String categoria,
    required String area,
    required String creadoPor,
  }) async {
    final reporte = Reporte(
      id: const Uuid().v4(),
      titulo: titulo,
      descripcion: descripcion,
      categoria: categoria,
      area: area,
      creadoPor: creadoPor,
      creadoEn: DateTime.now(),
    );

    await mbnkVqAhgB.crearReporte(reporte);

    await exvOz4ephsyeyqD0.crear(
      tipo: NotificacionTipo.reporte.name,
      titulo: 'Reporte enviado',
      mensaje: reporte.titulo,
      referenciaId: reporte.id,
    );

    await _okWw();
  }
}

class DqtZo2wiDAf {
  final SQrj3Cecjbvq0H tFRr;

  DqtZo2wiDAf(this.tFRr);

  Future<ZUV35mlB33k> dbJIw({
    required String username,
    required String password,
  }) {
    return tFRr.inKrK(
      username: username,
      password: password,
    );
  }

  Future<void> ywgJha() async {
    await tFRr.bGwfss();
  }

  Future<ZUV35mlB33k?> s019QwCxV8() {
    return tFRr.ygDJQag3yA();
  }
}

class HjanytJONp {
  final String yeTLbxJ;
  final String bel6w1y3;
  final int qCZPzQ9z;

  const HjanytJONp({
    required this.yeTLbxJ,
    required this.bel6w1y3,
    required this.qCZPzQ9z,
  });
}

class Ro5fGjn4Vu {
  final String sLG4c1;
  final String tUEfz7M6b23;
  final DateTime pZrRr;

  final List<String> c1RpVvAn6XR;

  final List<String> oOtjbQPSn;

  final String d4iUVqGxP;
  final String l7jd3z7Ls;
  final List<N1UoL2JwYVelFG> cndE4;
  final Map<String, dynamic>? dD43OIsV;

  Ro5fGjn4Vu({
    required this.sLG4c1,
    required this.tUEfz7M6b23,
    required this.pZrRr,
    required this.c1RpVvAn6XR,
    required this.oOtjbQPSn,
    required this.d4iUVqGxP,
    required this.l7jd3z7Ls,
    required this.cndE4,
    this.dD43OIsV,
  });

  Map<String, dynamic> lUgIea() => {
    'titulo': sLG4c1,
    'descripcion': tUEfz7M6b23,
    'fecha': pZrRr.toIso8601String(),
    'asignadores': c1RpVvAn6XR,
    'asignados': oOtjbQPSn,
    'categoria': d4iUVqGxP,
    'prioridad': l7jd3z7Ls,
    'users': cndE4.map((u) => u.qirj5T()).toList(),
    if (dD43OIsV != null) 'metadata': dD43OIsV,
  };
}

enum VAtBUsgP4nOHQw {
  d80FdeRoE,
  sR0ySLVN,
  urioBbkp,
}

extension SJ4sjLGjZYEhPqE on VAtBUsgP4nOHQw {
  String get asString {
    switch (this) {
      case VAtBUsgP4nOHQw.d80FdeRoE:
        return 'requester';
      case VAtBUsgP4nOHQw.sR0ySLVN:
        return 'assignee';
      case VAtBUsgP4nOHQw.urioBbkp:
        return 'observer';
    }
  }
}

class N1UoL2JwYVelFG {
  final String iEMDwH;
  final VAtBUsgP4nOHQw mDjs;

  N1UoL2JwYVelFG({
    required this.iEMDwH,
    required this.mDjs,
  });

  Map<String, dynamic> qirj5T() => {
    'userId': iEMDwH,
    'role': mDjs.asString,
  };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final app = await AppDisableGuard.guard(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const NLu(),
    ),
    killSwitch: const KillSwitchService(),
    hasLan: true,
  );

  runApp(app);
}

enum YK3VClXnaFNxD {
  vjjsJK,
  fy5Gw7bRP,
  tI8gH,
  ndHC,
}

class HcVpDLKUzZ9nRLEP {
  final String dg;
  final String vgfZYou3H;
  final YK3VClXnaFNxD pfXF;
  final String fCBDEZ;
  final String jrL8Kkz87; // archivo local (offline)
  final String? xdxMCUf4Y; // URL backend cuando se sincroniza
  final DateTime myZ21HUw;

  HcVpDLKUzZ9nRLEP({
    required this.dg,
    required this.vgfZYou3H,
    required this.pfXF,
    required this.fCBDEZ,
    required this.jrL8Kkz87,
    this.xdxMCUf4Y,
    required this.myZ21HUw,
  });
}

class Fgj2JhFyN4MxWi0 {
  final String lN;

  final String lPdlFVA;
  final String wRD35r7;
  final String orH77lR;
  final DateTime kdZ6PFcD;

  Fgj2JhFyN4MxWi0({
    required this.lN,
    required this.lPdlFVA,
    required this.wRD35r7,
    required this.orH77lR,
    required this.kdZ6PFcD,
  });
}

final counterProvider = StateNotifierProvider<CErVfRX, int>((ref) => CErVfRX());

class CErVfRX extends StateNotifier<int> {
  CErVfRX() : super(0);
}

class BHXr3H0gu6FNldMHfq extends Table {
  TextColumn get yE => text()();
  TextColumn get sDKp7v => text()();
  TextColumn get b54gA0B => text()();
  TextColumn get wrKy =>
      text().withDefault(const Constant('info'))(); // info | alerta | critica
  BoolColumn get puyxl => boolean().withDefault(const Constant(false))();
  TextColumn get imrA2q => text().nullable()(); // asistencia, glpi, inventarios
  DateTimeColumn get rLq1z => dateTime().withDefault(currentDateAndTime)();
}

class WLJrYbz5JZj0Piu6Liv {
  static Future<void> ez3zCfMx(Map<String, dynamic> json) async {
    if (!json.containsKey('signature')) return;

    final signature = json['signature'] as String;

    final payload = Map<String, dynamic>.from(json)..remove('signature');

    final valid = DevKillSwitch.verify(
      payload: payload,
      signatureBase64: signature,
    );

    if (!valid) return;

    switch (payload['action']) {
      case 'BLOCK_APP':
        await LocalFlags.blockApp(
          reason: AppBlockReason.manualDeveloperBlock,
        );
        break;

      default:
        return;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  final config = ref.read(appConfigProvider);

  final protocol = config.useHttps ? 'https' : 'http';
  final baseUrl = '$protocol://${config.apiBaseUrl}:${config.apiPort}/api';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
  }

  if (config.useJwt) {
    final session = SessionManager();
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await session.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  return dio;
});

final networkCheckerProvider = Provider<DzFehef3VL4MoV>((ref) {
  return DzFehef3VL4MoV();
});

final serverProbeProvider = Provider<VSMjebYuPdJ>((ref) {
  return VSMjebYuPdJ();
});

final lanGuardProvider = Provider<CA4pt8U5>((ref) {
  final config = ref.read(appConfigProvider);

  final protocol = config.useHttps ? 'https' : 'http';
  final healthUrl =
      '$protocol://${config.apiBaseUrl}:${config.apiPort}/api/health';

  return CA4pt8U5(
    aKhxd5xHS8RGYc: ref.read(networkCheckerProvider),
    thbjNLmqO6g: ref.read(serverProbeProvider),
    fNFxH7Ml7: healthUrl,
    dx4Y3NHECPz2G1: true,
  );
});

class KtmMSNUbXPg93e {
  static final ECDomainParameters _tqnEh1 = ECDomainParameters('secp256r1');

  static final ECPublicKey xTVAbg9J8 = ECPublicKey(
    _tqnEh1.curve.createPoint(
      BigInt.parse(
        '11223344556677889900AABBCCDDEEFF11223344556677889900AABBCCDDEEFF',
        radix: 16,
      ),
      BigInt.parse(
        '99887766554433221100FFEEDDCCBBAA99887766554433221100FFEEDDCCBBAA',
        radix: 16,
      ),
    ),
    _tqnEh1,
  );
}

class SpHMLML {
  final String bf;
  final String xQjl;

  const SpHMLML({required this.bf, required this.xQjl});
}

final biometricServiceProvider = Provider<E3Rl9qbo5VSQRrvk>(
  (_) => E3Rl9qbo5VSQRrvk(),
);

final sessionManagerProvider = Provider<PDrvVgaQueI15K>((ref) {
  return PDrvVgaQueI15K();
});

final authRepositoryProvider = Provider<SQrj3Cecjbvq0H>((ref) {
  final config = ref.read(appConfigProvider);
  return HXmufg8PhipZgTVXm(
    x5O: ref.read(dioProvider),
    wfDsPRvQIBID: config.authEndpoint,
  );
});

final authServiceProvider = Provider<DqtZo2wiDAf>((ref) {
  return DqtZo2wiDAf(ref.read(authRepositoryProvider));
});

final authControllerProvider = StateNotifierProvider<Q1AxIGqmhlVvio, VgJlYXlcR>(
  (ref) {
    return Q1AxIGqmhlVvio(
      jal3: ref.read(authRepositoryProvider),
      yLINSHk: ref.read(sessionManagerProvider),
      kdj: ref,
    );
  },
);

abstract class SQrj3Cecjbvq0H {
  Future<ZUV35mlB33k> inKrK({
    required String username,
    required String password,
  });

  Future<void> bGwfss();

  Future<ZUV35mlB33k?> ygDJQag3yA();
}

class QmArr4NYD extends ConsumerStatefulWidget {
  const QmArr4NYD({super.key});

  @override
  ConsumerState<QmArr4NYD> createState() => _CfwzNwgzOYdF4d();
}

class _CfwzNwgzOYdF4d extends ConsumerState<QmArr4NYD> {
  final _huQJMNT = GlobalKey<FormState>();
  final _tlbrQmmXeo4s = TextEditingController();
  final _fNIjpd1bgTxy = TextEditingController();

  bool _jVCgByp = false;
  bool _kLg0vMP6GmQrkAW = true;
  ProviderSubscription<VgJlYXlcR>? _x5EcCkp;

  @override
  void initState() {
    super.initState();

    _x5EcCkp = ref.listenManual<VgJlYXlcR>(authControllerProvider, (
      prev,
      next,
    ) {
      if (prev?.axjCVg == Ja6KZpv6M7.d70OR6T &&
          next.axjCVg != Ja6KZpv6M7.d70OR6T) {
        return;
      }

      if (prev?.axjCVg != next.axjCVg && mounted) {
        if (next.axjCVg == Ja6KZpv6M7.rWrnh809fWrwm00 && _jVCgByp) {
          setState(() => _jVCgByp = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login fallido. Revisa tus credenciales.'),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _x5EcCkp?.close();
    _tlbrQmmXeo4s.dispose();
    _fNIjpd1bgTxy.dispose();
    super.dispose();
  }

  Future<void> _kjZM96() async {
    final ok = _huQJMNT.currentState?.validate() ?? false;
    if (!ok) return;

    final username = _tlbrQmmXeo4s.text.trim();
    final password = _fNIjpd1bgTxy.text;

    setState(() => _jVCgByp = true);
    await ref.read(authControllerProvider.notifier).pPCVW(username, password);

    if (!mounted) return;
    setState(() => _jVCgByp = false);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final horizontalPadding = constraints.maxWidth >= 1200
            ? 120.0
            : constraints.maxWidth >= 900
            ? 80.0
            : constraints.maxWidth >= 600
            ? 60.0
            : 24.0;

        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: isTablet ? 56 : 48,
                          height: isTablet ? 56 : 48,
                          decoration: BoxDecoration(
                            color: cs.primary.withAlpha(22),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.description_rounded,
                            color: cs.primary,
                            size: isTablet ? 30 : 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GTO Docs',
                                style: TextStyle(
                                  fontSize: isTablet ? 28.0 : 22.0,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.2,
                                  color: cs.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Acceso con tu cuenta',
                                style: TextStyle(
                                  fontSize: isTablet ? 14 : 13,
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: isTablet ? 22 : 18),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(isTablet ? 24 : 16),
                        child: Form(
                          key: _huQJMNT,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Iniciar sesión',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Ingresa tu usuario y contraseña para continuar.',
                                style: TextStyle(color: cs.onSurfaceVariant),
                              ),
                              SizedBox(height: isTablet ? 22 : 16),
                              TextFormField(
                                controller: _tlbrQmmXeo4s,
                                decoration: const InputDecoration(
                                  labelText: 'Usuario AD o correo',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Campo requerido'
                                    : null,
                              ),
                              SizedBox(height: isTablet ? 18 : 12),
                              TextFormField(
                                controller: _fNIjpd1bgTxy,
                                obscureText: _kLg0vMP6GmQrkAW,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _kLg0vMP6GmQrkAW
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () => setState(
                                      () =>
                                          _kLg0vMP6GmQrkAW = !_kLg0vMP6GmQrkAW,
                                    ),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => _kjZM96(),
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                    ? 'Campo requerido'
                                    : null,
                              ),
                              SizedBox(height: isTablet ? 22 : 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _jVCgByp ? null : _kjZM96,
                                  child: _jVCgByp
                                      ? const SizedBox(
                                          height: 22,
                                          width: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text('Ingresar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 18 : 14),
                    AnimatedOpacity(
                      opacity: _jVCgByp ? 0.65 : 1,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        '© 2025 GTO Docs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 12,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class M5ZVoUz4 {
  static const double _qM3EXE = 16;

  static ThemeData mNjrq() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB),
      brightness: Brightness.light,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
    );

    final textTheme = base.textTheme.copyWith(
      bodySmall: base.textTheme.bodySmall?.copyWith(fontSize: 14),
    );

    return base.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withAlpha(110),
        thickness: 1,
        space: 1,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_qM3EXE),
          side: BorderSide(color: colorScheme.outlineVariant.withAlpha(90)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_qM3EXE),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.error, width: 1.6),
        ),
        labelStyle: base.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          side: BorderSide(color: colorScheme.outlineVariant),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide(color: colorScheme.outlineVariant.withAlpha(120)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static ThemeData beHc() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB),
      brightness: Brightness.dark,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
    );

    final textTheme = base.textTheme.copyWith(
      bodySmall: base.textTheme.bodySmall?.copyWith(fontSize: 14),
    );

    return base.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: colorScheme.onSurface,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.6),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_qM3EXE),
          side: BorderSide(color: colorScheme.outlineVariant.withAlpha(80)),
        ),
      ),
    );
  }
}

class Zzy12mIJOO extends ConsumerWidget {
  final GerenciaTheme dWmw3;

  const Zzy12mIJOO({super.key, required this.dWmw3});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);

    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final user = auth.user!;
    final isSupervisor = user.isSupervisor;

    if (isSupervisor) {
      return BxcwXKwTw1RSLl7(st9rH: dWmw3);
    }

    final tareasAsync = ref.watch(tareasPorAsignadoProvider(user.id));

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: dWmw3,
        title: 'Tareas',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(tareasPorAsignadoProvider(user.id)),
            tooltip: 'Actualizar',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => K8NwCbJv8ZuhjZ(yiiNG: dWmw3, yIzgxjLvS: user.id),
            ),
          );

          if (created == true) {
            ref.invalidate(tareasPorAsignadoProvider(user.id));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Añadir'),
      ),
      body: tareasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No hay tareas'));
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: isTablet ? 32 : 24,
            ),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (_, i) {
              final t = items[i];
              return _J8goYbw2U(
                fy6oF: t,
                r7N7K: () {
                  final gid =
                      (t.groupId != null && t.groupId!.trim().isNotEmpty)
                      ? t.groupId!.trim()
                      : null;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => gid == null
                          ? Iom0ztcBxmImKVs2(u4Wka: dWmw3, aLTtu: t)
                          : UxxIZKOxhp0dVMt9SSl7a(
                              meoZv: dWmw3,
                              nRze6RO: gid,
                              bg6QWa2E: t,
                            ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _J8goYbw2U extends StatelessWidget {
  final Tarea fy6oF;
  final VoidCallback r7N7K;

  const _J8goYbw2U({required this.fy6oF, required this.r7N7K});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: r7N7K,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 56 : 48,
                  height: isTablet ? 56 : 48,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                  ),
                  child: Icon(
                    Icons.task_alt,
                    color: Colors.blue[700],
                    size: isTablet ? 30 : 26,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fy6oF.titulo,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Estado: ${fy6oF.estado.name}',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: isTablet ? 24 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PBDyUOohYkRmCY extends ConsumerStatefulWidget {
  final GerenciaTheme s49Kw;

  const PBDyUOohYkRmCY({super.key, required this.s49Kw});

  @override
  ConsumerState<PBDyUOohYkRmCY> createState() => _Th0uvKq1RbiI5n8dJCh();
}

class _Th0uvKq1RbiI5n8dJCh extends ConsumerState<PBDyUOohYkRmCY> {
  final _iIoSHNhBKndnL3a6 = TextEditingController();
  String _nB11aksxec5 = '';

  @override
  void dispose() {
    _iIoSHNhBKndnL3a6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);
    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final user = auth.user!;
    final canCrud = user.isSupervisor && !user.isAuxiliar;

    final inventarioAsync = ref.watch(inventarioItemsProvider);

    return Scaffold(
      appBar: GerenciaAppBar(theme: widget.s49Kw, title: 'Inventario'),
      floatingActionButton: canCrud
          ? FloatingActionButton.extended(
              onPressed: () => _zcGC6o6pF6WmMxAC(context),
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
            )
          : null,
      body: inventarioAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar inventario: $e'),
          ),
        ),
        data: (items) {
          final filtered = _ayluIZfpi7o(items);

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(inventarioItemsProvider);
              await ref.read(inventarioItemsProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              children: [
                TextField(
                  controller: _iIoSHNhBKndnL3a6,
                  onChanged: (v) => setState(() => _nB11aksxec5 = v),
                  decoration: InputDecoration(
                    hintText: 'Buscar en inventario…',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                if (items.isEmpty)
                  const Center(child: Text('No hay registros de inventario')),
                ...filtered.map(
                  (a) => _O0xhg5lQIi(
                    oYWMgy: a,
                    yuysQNl: canCrud,
                    pgiW6m: () => _j9lxeNazyNwsyQ(context, a),
                    ybjwa11n: () => _am2Q9kEgYfPc2(context, a),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _zcGC6o6pF6WmMxAC(BuildContext context) async {
    final created = await showDialog<Activo>(
      context: context,
      builder: (_) => _TJhdL7Hgd4q9(hnj0b: widget.s49Kw),
    );
    if (created == null) return;

    try {
      await ref.read(inventarioRepositoryProvider).crearActivo(created);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo crear: $e')));
    }
  }

  Future<void> _j9lxeNazyNwsyQ(BuildContext context, Activo activo) async {
    final updated = await showDialog<Activo>(
      context: context,
      builder: (_) => _TJhdL7Hgd4q9(hnj0b: widget.s49Kw, ygJrsoe: activo),
    );
    if (updated == null) return;

    try {
      await ref.read(inventarioRepositoryProvider).actualizarActivo(updated);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo actualizar: $e')));
    }
  }

  Future<void> _am2Q9kEgYfPc2(BuildContext context, Activo activo) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar'),
        content: Text('¿Eliminar "${activo.nombre}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (ok != true) return;

    try {
      await ref.read(inventarioRepositoryProvider).eliminarActivo(activo.id);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo eliminar: $e')));
    }
  }

  List<Activo> _ayluIZfpi7o(List<Activo> items) {
    final q = _nB11aksxec5.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((a) {
      final hay = '${a.nombre} ${a.tipo} ${a.ubicacion} ${a.estado}'
          .toLowerCase();
      return hay.contains(q);
    }).toList();
  }
}

class _O0xhg5lQIi extends StatelessWidget {
  final Activo oYWMgy;

  final bool yuysQNl;
  final VoidCallback? pgiW6m;
  final VoidCallback? ybjwa11n;

  const _O0xhg5lQIi({
    required this.oYWMgy,
    required this.yuysQNl,
    this.pgiW6m,
    this.ybjwa11n,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: isTablet ? 15 : 12,
            offset: Offset(0, isTablet ? 6 : 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 20 : 16),
        child: Row(
          children: [
            Container(
              width: isTablet ? 64 : 56,
              height: isTablet ? 64 : 56,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
              ),
              child: Icon(
                Icons.inventory_2,
                color: Colors.blue[700],
                size: isTablet ? 34 : 30,
              ),
            ),
            SizedBox(width: isTablet ? 20 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oYWMgy.nombre,
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    children: [
                      if (oYWMgy.tipo.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.tipo, rhou: Icons.category),
                      if (oYWMgy.ubicacion.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.ubicacion, rhou: Icons.place),
                      if (oYWMgy.estado.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.estado, rhou: Icons.info_outline),
                      _Xl0R(
                        huqB: 'Cant: ${oYWMgy.cantidad}',
                        rhou: Icons.numbers,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (yuysQNl)
              PopupMenuButton<String>(
                onSelected: (v) {
                  if (v == 'edit') pgiW6m?.call();
                  if (v == 'delete') ybjwa11n?.call();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'edit', child: Text('Editar')),
                  PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _TJhdL7Hgd4q9 extends StatefulWidget {
  final GerenciaTheme hnj0b;
  final Activo? ygJrsoe;

  const _TJhdL7Hgd4q9({required this.hnj0b, this.ygJrsoe});

  @override
  State<_TJhdL7Hgd4q9> createState() => _YpqdJ5qKnniBPwB7t();
}

class _YpqdJ5qKnniBPwB7t extends State<_TJhdL7Hgd4q9> {
  final _xAotw5Y = GlobalKey<FormState>();
  late final TextEditingController _gxU0yv;
  late final TextEditingController _hrMa;
  late final TextEditingController _aaTUFbhND;
  late final TextEditingController _pHk3eB;
  late final TextEditingController _zBiaPlCm;
  late final TextEditingController _iy7B8FfaPls;

  @override
  void initState() {
    super.initState();
    final a = widget.ygJrsoe;
    _gxU0yv = TextEditingController(text: a?.nombre ?? '');
    _hrMa = TextEditingController(text: a?.tipo ?? '');
    _aaTUFbhND = TextEditingController(text: a?.ubicacion ?? '');
    _pHk3eB = TextEditingController(text: a?.estado ?? '');
    _zBiaPlCm = TextEditingController(text: (a?.cantidad ?? 0).toString());
    _iy7B8FfaPls = TextEditingController(text: a?.descripcion ?? '');
  }

  @override
  void dispose() {
    _gxU0yv.dispose();
    _hrMa.dispose();
    _aaTUFbhND.dispose();
    _pHk3eB.dispose();
    _zBiaPlCm.dispose();
    _iy7B8FfaPls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: widget.hnj0b.colorPrimario.withAlpha(22),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              widget.ygJrsoe == null ? Icons.add : Icons.edit,
              color: widget.hnj0b.colorPrimario,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ygJrsoe == null ? 'Agregar activo' : 'Editar activo',
                ),
                const SizedBox(height: 2),
                Text(
                  'Completa los datos del inventario.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 14, 24, 10),
      content: SizedBox(
        width: 520,
        child: Form(
          key: _xAotw5Y,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _gxU0yv,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _hrMa,
                  decoration: const InputDecoration(
                    labelText: 'Tipo/Categoría',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _aaTUFbhND,
                  decoration: const InputDecoration(labelText: 'Ubicación'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pHk3eB,
                  decoration: const InputDecoration(labelText: 'Estado'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _zBiaPlCm,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _iy7B8FfaPls,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _zUKi4P, child: const Text('Guardar')),
      ],
    );
  }

  void _zUKi4P() {
    if (!_xAotw5Y.currentState!.validate()) return;
    final id =
        widget.ygJrsoe?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final cant = int.tryParse(_zBiaPlCm.text.trim()) ?? 0;
    Navigator.pop(
      context,
      Activo(
        id: id,
        nombre: _gxU0yv.text.trim(),
        tipo: _hrMa.text.trim(),
        ubicacion: _aaTUFbhND.text.trim(),
        estado: _pHk3eB.text.trim(),
        cantidad: cant,
        descripcion: _iy7B8FfaPls.text.trim().isEmpty
            ? null
            : _iy7B8FfaPls.text.trim(),
      ),
    );
  }
}

class _Xl0R extends StatelessWidget {
  final String huqB;
  final IconData rhou;

  const _Xl0R({required this.huqB, required this.rhou});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(rhou, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(huqB, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        ],
      ),
    );
  }
}

@DriftDatabase(
  tables: [
    AsistenciaTable,
    CombustibleRegistrosTable,
    NotificationsTable,
    SyncQueueTable,
    TareasTable,
    TareaComentariosTable,
    TareaAdjuntosTable,
    ReportesTable,
    ReporteComentariosTable,
    ReporteEvidenciasTable,
    ReporteParticipantesTable,
  ],
)
class CiQEfOmbPmN extends _Dd6MZrmiYCBX {
  CiQEfOmbPmN() : super(_openConnection());

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.creadoPor);
      }
      if (from < 3) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.descripcion);
      }
      if (from < 4) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.remoteId);
      }
      if (from < 5) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.groupId);
      }
      if (from < 6) {
        await m.createTable(jU5VEJTz8C7WwoYYJfIlQ);
        await m.createTable(qaBIf6ei74qAD99wRU);
      }

      if (from < 7) {
        await m.createTable(oUFGqb3kTTei6pB1c72oFuUjt);
      }

      if (from < 8) {
        await m.addColumn(
          oUFGqb3kTTei6pB1c72oFuUjt,
          oUFGqb3kTTei6pB1c72oFuUjt.syncError,
        );
      }

      if (from < 9) {
        await m.addColumn(
          oUFGqb3kTTei6pB1c72oFuUjt,
          oUFGqb3kTTei6pB1c72oFuUjt.syncInfo,
        );
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'gto_docs.db'));
    return NativeDatabase(file);
  });
}

class KQ1YQeRPEL {
  final String mAfZDxQ9;
  final bool x2L0U1;

  const KQ1YQeRPEL({
    required this.mAfZDxQ9,
    required this.x2L0U1,
  });
}

abstract class IkWShC7JxRyhe8BTq0gp {
  Future<void> bxznKa77p({
    required String usuarioId,
    required J7OYk8rIWDVpkP tipo,
    required String metodo,
  });

  Future<List<GXcG6a0OPJ>> sjCzX0uJlZCyqcCR(String usuarioId);
}

@immutable
class AuHnvgWVYlrtTLknyggazMJ {
  final String n2;
  final String u8JzM;

  const AuHnvgWVYlrtTLknyggazMJ({required this.n2, required this.u8JzM});
}

@immutable
class A32xKOUKm8KMrJkQEMBm9puVx {
  final String bY;
  final String xAWWV;
  final String bVUNaMkVhBAwRt;
  final String xUX9iztXXpohN;
  final List<AuHnvgWVYlrtTLknyggazMJ> twWXC;

  const A32xKOUKm8KMrJkQEMBm9puVx({
    required this.bY,
    required this.xAWWV,
    this.bVUNaMkVhBAwRt = 'REPORTE DE MANTENIMIENTO PREVENTIVO',
    this.xUX9iztXXpohN = 'Site',
    required this.twWXC,
  });
}

@immutable
class FrKyfgAdXg4rDE7QpFC {
  final String oVxZdl;
  final String eGm7S;
  final bool xDksiE;
  final bool jjrHH614;
  final String hlbyb6DeF9B;

  final List<String> y35qpUs2ZT;

  const FrKyfgAdXg4rDE7QpFC({
    required this.oVxZdl,
    required this.eGm7S,
    required this.xDksiE,
    required this.jjrHH614,
    required this.hlbyb6DeF9B,
    required this.y35qpUs2ZT,
  });
}

@immutable
class IDXe8JudY4J27fMVDEST {
  final String uQYHwcu6pGQl;
  final String i61BPT32Jku;

  final String fQbZ;
  final String cslvKXrhK6M;
  final String syA1h;

  final DateTime yS9AY8riA;
  final List<FrKyfgAdXg4rDE7QpFC> y6Dy1;

  const IDXe8JudY4J27fMVDEST({
    required this.uQYHwcu6pGQl,
    required this.i61BPT32Jku,
    required this.fQbZ,
    required this.cslvKXrhK6M,
    required this.syA1h,
    required this.yS9AY8riA,
    required this.y6Dy1,
  });
}

class BxcwXKwTw1RSLl7 extends ConsumerStatefulWidget {
  final GerenciaTheme st9rH;

  const BxcwXKwTw1RSLl7({super.key, required this.st9rH});

  @override
  ConsumerState<BxcwXKwTw1RSLl7> createState() => _EiyxBruSApfQtromNFXC();
}

class _EiyxBruSApfQtromNFXC extends ConsumerState<BxcwXKwTw1RSLl7> {
  int _va7nIz5uxPJ5F = 0; // 0=Mis(creadas), 1=Asignadas(a mí), 2=Todas

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);
    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final userId = auth.user!.id;
    final gerenciaId = auth.user!.resolvedGerenciaId;
    final tareasAsync = switch (_va7nIz5uxPJ5F) {
      0 => ref.watch(tareasPorCreadorProvider(userId)),
      1 => ref.watch(tareasPorAsignadoProvider(userId)),
      _ => ref.watch(todasLasTareasProvider),
    };

    final usersAsync = ref.watch(usersListByGerenciaProvider(gerenciaId));

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.st9rH,
        title: 'Tareas',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (_va7nIz5uxPJ5F == 0) {
                ref.invalidate(tareasPorCreadorProvider(userId));
              }
              if (_va7nIz5uxPJ5F == 1) {
                ref.invalidate(tareasPorAsignadoProvider(userId));
              }
              if (_va7nIz5uxPJ5F == 2) {
                ref.invalidate(todasLasTareasProvider);
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  K8NwCbJv8ZuhjZ(yiiNG: widget.st9rH, yIzgxjLvS: auth.user!.id),
            ),
          );

          if (created == true) {
            ref.invalidate(tareasPorCreadorProvider(userId));
            ref.invalidate(tareasPorAsignadoProvider(userId));
            ref.invalidate(todasLasTareasProvider);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Crear'),
      ),
      body: tareasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          final grouped = <String, List<Tarea>>{};
          for (final t in items) {
            final gid = (t.groupId != null && t.groupId!.trim().isNotEmpty)
                ? t.groupId!.trim()
                : t.id;
            (grouped[gid] ??= <Tarea>[]).add(t);
          }

          final groups = grouped.entries.toList(growable: false)
            ..sort((a, b) {
              final at = a.value.isNotEmpty ? a.value.first.titulo : '';
              final bt = b.value.isNotEmpty ? b.value.first.titulo : '';
              return at.toLowerCase().compareTo(bt.toLowerCase());
            });

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  16,
                  horizontalPadding,
                  8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SegmentedButton<int>(
                        segments: const [
                          ButtonSegment(value: 0, label: Text('Mis')),
                          ButtonSegment(value: 1, label: Text('Asignadas')),
                          ButtonSegment(value: 2, label: Text('Todas')),
                        ],
                        selected: <int>{_va7nIz5uxPJ5F},
                        onSelectionChanged: (s) {
                          setState(() => _va7nIz5uxPJ5F = s.first);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: groups.isEmpty
                    ? const Center(child: Text('No hay tareas'))
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          8,
                          horizontalPadding,
                          isTablet ? 32 : 24,
                        ),
                        itemCount: groups.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (_, i) {
                          final entry = groups[i];
                          return usersAsync.when(
                            loading: () => _FNgdYAzHn0CCOT(
                              vfl8Nhk: entry.key,
                              leasl3: entry.value,
                              dm8ys: widget.st9rH,
                              ynbuTyc7EnfT8: (id) => id,
                            ),
                            error: (error, stackTrace) => _FNgdYAzHn0CCOT(
                              vfl8Nhk: entry.key,
                              leasl3: entry.value,
                              dm8ys: widget.st9rH,
                              ynbuTyc7EnfT8: (id) => id,
                            ),
                            data: (users) {
                              final byId = <String, String>{
                                for (final u in users) u.id: u.name,
                              };
                              return _FNgdYAzHn0CCOT(
                                vfl8Nhk: entry.key,
                                leasl3: entry.value,
                                dm8ys: widget.st9rH,
                                ynbuTyc7EnfT8: (id) => byId[id] ?? id,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FNgdYAzHn0CCOT extends StatelessWidget {
  final String vfl8Nhk;
  final List<Tarea> leasl3;
  final GerenciaTheme dm8ys;
  final String Function(String userId) ynbuTyc7EnfT8;

  const _FNgdYAzHn0CCOT({
    required this.vfl8Nhk,
    required this.leasl3,
    required this.dm8ys,
    required this.ynbuTyc7EnfT8,
  });

  TareaEstado _nWzFIwL40Lipgps() {
    if (leasl3.any((t) => t.estado == TareaEstado.pendiente)) {
      return TareaEstado.pendiente;
    }
    if (leasl3.any((t) => t.estado == TareaEstado.enProceso)) {
      return TareaEstado.enProceso;
    }
    return TareaEstado.completada;
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final head = leasl3.isNotEmpty ? leasl3.first : null;
    final estado = _nWzFIwL40Lipgps();

    String kaHDhqzvgKh() => switch (estado) {
      TareaEstado.pendiente => 'Pendiente',
      TareaEstado.enProceso => 'En proceso',
      TareaEstado.completada => 'Completada',
    };

    final assignees = leasl3.map((t) => ynbuTyc7EnfT8(t.asignadoA)).toList();
    assignees.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    String u1CW7Irod6oQLVN7() {
      if (assignees.isEmpty) return 'Sin asignados';
      if (assignees.length <= 2) return assignees.join(', ');
      return '${assignees.take(2).join(', ')} +${assignees.length - 2}';
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: isTablet ? 15 : 12,
            offset: Offset(0, isTablet ? 6 : 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (head == null) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UxxIZKOxhp0dVMt9SSl7a(
                  meoZv: dm8ys,
                  nRze6RO: vfl8Nhk,
                  bg6QWa2E: head,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 56 : 48,
                  height: isTablet ? 56 : 48,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                  ),
                  child: Icon(
                    Icons.assignment,
                    color: Colors.blue[700],
                    size: isTablet ? 30 : 26,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        head?.titulo ?? 'Tarea',
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Asignados: ${leasl3.length} • ${u1CW7Irod6oQLVN7()}',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Estado: ${kaHDhqzvgKh()}',
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: isTablet ? 24 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension TbRGTOChF9v47 on KqBOLs41 {
  List<String> get rolesLower => fH7uu.map((e) => e.toLowerCase()).toList();

  bool get isAdmin => rolesLower.any((r) => r.contains('admin'));

  bool get isGerente => rolesLower.any((r) => r.contains('gerente'));

  bool get isJefeDepartamento => rolesLower.any((r) => r.contains('jefe'));

  bool get isSupervisor =>
      isAdmin ||
      isGerente ||
      isJefeDepartamento ||
      rolesLower.any((r) => r.contains('supervisor'));

  bool get isAuxiliar => rolesLower.any((r) => r.contains('aux'));

  int? get resolvedGerenciaId {
    final raw = ucAcyxha.trim();
    final parsed = int.tryParse(raw);
    if (parsed != null) return parsed;

    final normalized = raw.toUpperCase();
    switch (normalized) {
      case 'TICS':
        return 1;
      case 'MANTENIMIENTO':
        return 3;
      case 'FAUNA':
        return 4;
      case 'OPERACIONES':
        return 2;
    }

    final tId = int.tryParse(raw);
    if (tId != null) return tId;
    return null;
  }
}

class IpwipU2fEn4NVODke7Zr8A4 {
  final AppDatabase bU;

  IpwipU2fEn4NVODke7Zr8A4(this.bU);

  Future<void> dAY90mcuKf0R7F({
    required String tareaId,
    required TareaAdjuntoTipo tipo,
    required String nombre,
    required String localPath,
    String? mimeType,
  }) async {
    final a = TareaAdjunto(
      id: const Uuid().v4(),
      tareaId: tareaId,
      tipo: tipo,
      nombre: nombre,
      localPath: localPath,
      mimeType: mimeType,
      remoteUrl: null,
      creadoEn: DateTime.now(),
    );

    await bU
        .into(bU.tareaAdjuntosTable)
        .insert(
          TareaAdjuntosTableCompanion.insert(
            id: a.id,
            tareaId: a.tareaId,
            tipo: a.tipo.name,
            nombre: a.nombre,
            localPath: a.localPath,
            mimeType: Value(a.mimeType),
            remoteUrl: const Value.absent(),
            creadoEn: a.creadoEn,
          ),
        );

    await bU
        .into(bU.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea_adjunto',
            entidadId: a.id,
            accion: 'upload',
            payload: Value({
              'id': a.id,
              'tareaId': a.tareaId,
              'tipo': a.tipo.name,
              'nombre': a.nombre,
              'localPath': a.localPath,
              if (a.mimeType != null) 'mimeType': a.mimeType,
            }),
          ),
        );
  }

  Stream<List<TareaAdjunto>> hnGLtSIPUnj9wkv(String tareaId) {
    return (bU.select(bU.tareaAdjuntosTable)
          ..where((a) => a.tareaId.equals(tareaId))
          ..orderBy([(a) => OrderingTerm.asc(a.creadoEn)]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => TareaAdjunto(
                  id: r.id,
                  tareaId: r.tareaId,
                  tipo: TareaAdjuntoTipo.values.byName(r.tipo),
                  nombre: r.nombre,
                  localPath: r.localPath,
                  mimeType: r.mimeType,
                  remoteUrl: r.remoteUrl,
                  creadoEn: r.creadoEn,
                ),
              )
              .toList(growable: false),
        );
  }
}

class JocEtaIUGoL {
  final AppConfig iuxFWS;

  JocEtaIUGoL(this.iuxFWS);

  String get aGSKurF => iuxFWS.glpiBaseUrl;
  String get qYwoc => iuxFWS.glpiApiToken;
}

class K8NwCbJv8ZuhjZ extends ConsumerStatefulWidget {
  final GerenciaTheme yiiNG;
  final String yIzgxjLvS;
  final String? cGfjaaA21BXhTE;

  const K8NwCbJv8ZuhjZ({
    super.key,
    required this.yiiNG,
    required this.yIzgxjLvS,
    this.cGfjaaA21BXhTE,
  });

  @override
  ConsumerState<K8NwCbJv8ZuhjZ> createState() => _BYTdaOeouo5mziomkSs();
}

class _BYTdaOeouo5mziomkSs extends ConsumerState<K8NwCbJv8ZuhjZ> {
  final _hYkE9zr = GlobalKey<FormState>();
  final _mlqbeUOw1T = TextEditingController();
  final _ifL0UXLnyPDWKNg = TextEditingController();
  final _lbCqX3daNcv = TextEditingController();

  final Set<String> _tjKAHFReX9rnWjc = <String>{};
  final Set<String> _bDHKPIjcN5cFXoIsLQOW = <String>{};

  final GlobalKey _g16FLGcEUufnWx0ed = GlobalKey();
  final GlobalKey _yBIFG1yhDxlA6Twx1 = GlobalKey();

  bool _xqkxwc = false;

  void _ft26uOdI1zPG() {
    final gerenciaId = ref
        .read(authControllerProvider)
        .user
        ?.resolvedGerenciaId;
    ref.invalidate(usersListByGerenciaProvider(gerenciaId));
  }

  RelativeRect _yiIyBoSIBGf6ab2YF(GlobalKey key) {
    final overlayBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final fieldBox = key.currentContext!.findRenderObject() as RenderBox;

    final fieldBottomLeft = fieldBox.localToGlobal(
      Offset(0, fieldBox.size.height),
      ancestor: overlayBox,
    );

    final left = fieldBottomLeft.dx;
    final top = fieldBottomLeft.dy;
    final right = overlayBox.size.width - left - fieldBox.size.width;
    final bottom = overlayBox.size.height - top;

    return RelativeRect.fromLTRB(left, top, right, bottom);
  }

  double _xdAUVbwJ0V(GlobalKey key) {
    final fieldBox = key.currentContext!.findRenderObject() as RenderBox;
    return fieldBox.size.width;
  }

  Future<Set<String>?> _caYSPgaBRXO9HolmNsz({
    required List<UserRef> users,
  }) async {
    if (_g16FLGcEUufnWx0ed.currentContext == null) return null;
    final pos = _yiIyBoSIBGf6ab2YF(_g16FLGcEUufnWx0ed);
    final width = _xdAUVbwJ0V(_g16FLGcEUufnWx0ed);

    final selected = await showMenu<Set<String>>(
      context: context,
      position: pos,
      items: [
        _W4dDHNea24XbR<Set<String>>(
          width: width,
          height: 360,
          nhc2T: _IsBao0zpvkVz3K5uBTVlnaC(
            fjlm1: users,
            v0ZLLRKyxT1RqGq: _bDHKPIjcN5cFXoIsLQOW,
            e78Jfp: _xqkxwc,
            wTIDDi: (selected) => Navigator.of(context).pop(selected),
          ),
        ),
      ],
    );

    return selected;
  }

  Future<Set<String>?> _mv3kBcIcVDfgNZcFi({
    required List<UserRef> users,
  }) async {
    if (_yBIFG1yhDxlA6Twx1.currentContext == null) return null;
    final pos = _yiIyBoSIBGf6ab2YF(_yBIFG1yhDxlA6Twx1);
    final width = _xdAUVbwJ0V(_yBIFG1yhDxlA6Twx1);

    final result = await showMenu<Set<String>>(
      context: context,
      position: pos,
      items: [
        _W4dDHNea24XbR<Set<String>>(
          width: width,
          height: 360,
          nhc2T: _Qw5rtjh55SsSHJLElRhKX(
            wIk6T: users,
            w8JauVMU4UfbJz8: _tjKAHFReX9rnWjc,
            uzL58j: _xqkxwc,
            aOIem4: (selected) => Navigator.of(context).pop(selected),
          ),
        ),
      ],
    );

    return result;
  }

  @override
  void initState() {
    super.initState();

    final creado = widget.yIzgxjLvS.trim();
    if (creado.isNotEmpty) {
      _bDHKPIjcN5cFXoIsLQOW.add(creado);
    }

    final fixed = widget.cGfjaaA21BXhTE;
    if (fixed != null && fixed.trim().isNotEmpty) {
      _tjKAHFReX9rnWjc.add(fixed.trim());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _ft26uOdI1zPG();
    });
  }

  @override
  void dispose() {
    _mlqbeUOw1T.dispose();
    _ifL0UXLnyPDWKNg.dispose();
    _lbCqX3daNcv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final gerenciaId = auth.user?.resolvedGerenciaId;
    final asignadorLabel = auth.user?.nombre ?? widget.yIzgxjLvS;

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
      appBar: AppBar(
        backgroundColor: widget.yiiNG.colorPrimario,
        elevation: 4,
        shadowColor: widget.yiiNG.colorPrimario.withAlpha(38),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Crear tarea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isTablet ? 24 : 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        child: Form(
          key: _hYkE9zr,
          child: Column(
            children: [
              SectionContainer(
                title: 'Datos de la tarea',
                subtitle: 'Completa la información principal.',
                icon: Icons.task_alt,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mlqbeUOw1T,
                      decoration: const InputDecoration(labelText: 'Título'),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _ifL0UXLnyPDWKNg,
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                      ),
                      minLines: 3,
                      maxLines: 6,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lbCqX3daNcv,
                      decoration: const InputDecoration(
                        labelText: 'Reporte ID (opcional)',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SectionContainer(
                title: 'Asignación',
                subtitle: 'Define quién asigna y a quién se asigna.',
                icon: Icons.group_add,
                child: Column(
                  children: [
                    if (auth.user == null) ...[
                      TextFormField(
                        initialValue: asignadorLabel,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Asignado por',
                        ),
                      ),
                      const SizedBox(height: 12),
                    ] else ...[
                      ref
                          .watch(usersListByGerenciaProvider(gerenciaId))
                          .when(
                            loading: () => InkWell(
                              onTap: _xqkxwc
                                  ? null
                                  : () {
                                      _ft26uOdI1zPG();
                                    },
                              child: const InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Asignado por',
                                ),
                                child: Text('Cargando...'),
                              ),
                            ),
                            error: (e, _) => InkWell(
                              onTap: _xqkxwc
                                  ? null
                                  : () {
                                      _ft26uOdI1zPG();
                                    },
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Asignado por',
                                ),
                                child: Text(
                                  _oAk9M0qWePGmAVfA4Fv2O(e),
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            data: (users) {
                              final byId = <String, String>{
                                for (final u in users) u.id: u.name,
                              };

                              String xpMGnAG3JCylx9a() {
                                final ids = _bDHKPIjcN5cFXoIsLQOW
                                    .where((e) => e.trim().isNotEmpty)
                                    .toList(growable: false);
                                if (ids.isEmpty) return 'Ninguno';
                                final names = ids
                                    .map((id) => byId[id] ?? id)
                                    .toList(growable: false);
                                names.sort(
                                  (a, b) => a.toLowerCase().compareTo(
                                    b.toLowerCase(),
                                  ),
                                );
                                if (names.length <= 2) return names.join(', ');
                                return '${names.take(2).join(', ')} +${names.length - 2}';
                              }

                              return InkWell(
                                key: _g16FLGcEUufnWx0ed,
                                onTap: _xqkxwc
                                    ? null
                                    : () async {
                                        _ft26uOdI1zPG();
                                        final picked =
                                            await _caYSPgaBRXO9HolmNsz(
                                              users: users,
                                            );
                                        if (!mounted || picked == null) return;
                                        setState(() {
                                          _bDHKPIjcN5cFXoIsLQOW
                                            ..clear()
                                            ..addAll(picked);
                                        });
                                      },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Asignado por',
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                  ),
                                  child: Text(
                                    'Seleccionados: ${_bDHKPIjcN5cFXoIsLQOW.length} • ${xpMGnAG3JCylx9a()}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                      const SizedBox(height: 12),
                    ],

                    if (widget.cGfjaaA21BXhTE == null) ...[
                      ref
                          .watch(usersListByGerenciaProvider(gerenciaId))
                          .when(
                            loading: () => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: LinearProgressIndicator(),
                            ),
                            error: (e, _) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                _oAk9M0qWePGmAVfA4Fv2O(e),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            data: (users) {
                              String xpMGnAG3JCylx9a() {
                                if (_tjKAHFReX9rnWjc.isEmpty) return 'Ninguno';
                                final byId = <String, String>{
                                  for (final u in users) u.id: u.name,
                                };
                                final names = _tjKAHFReX9rnWjc
                                    .map((id) => byId[id] ?? id)
                                    .toList(growable: false);
                                names.sort(
                                  (a, b) => a.toLowerCase().compareTo(
                                    b.toLowerCase(),
                                  ),
                                );
                                if (names.length <= 2) return names.join(', ');
                                return '${names.take(2).join(', ')} +${names.length - 2}';
                              }

                              final subtitle =
                                  'Seleccionados: ${_tjKAHFReX9rnWjc.length} • ${xpMGnAG3JCylx9a()}';

                              return InkWell(
                                key: _yBIFG1yhDxlA6Twx1,
                                onTap: _xqkxwc
                                    ? null
                                    : () async {
                                        _ft26uOdI1zPG();
                                        final picked = await _mv3kBcIcVDfgNZcFi(
                                          users: users,
                                        );
                                        if (!mounted || picked == null) return;
                                        setState(() {
                                          _tjKAHFReX9rnWjc
                                            ..clear()
                                            ..addAll(picked);
                                        });
                                      },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Asignado a',
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                  ),
                                  child: Text(
                                    subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _xqkxwc ? null : _l8d7H0,
                  child: _xqkxwc
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _l8d7H0() async {
    if (!_hYkE9zr.currentState!.validate()) return;

    final asignadores = <String>{..._bDHKPIjcN5cFXoIsLQOW.map((e) => e.trim())}
      ..removeWhere((e) => e.isEmpty);

    if (asignadores.isEmpty) {
      final fallback = widget.yIzgxjLvS.trim();
      if (fallback.isNotEmpty) asignadores.add(fallback);
    }

    final asignadorId = () {
      final ordered = asignadores.toList(growable: false)
        ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
      return ordered.isEmpty ? widget.yIzgxjLvS.trim() : ordered.first;
    }();

    final asignados = <String>{..._tjKAHFReX9rnWjc}
      ..removeWhere((e) => e.trim().isEmpty);
    if (asignados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona al menos un usuario.')),
      );
      return;
    }

    setState(() => _xqkxwc = true);
    try {
      const uuid = Uuid();

      final batchId = uuid.v4();
      final createdAt = DateTime.now();
      final asignadoresGlpi = <String>{...asignadores}
        ..removeWhere((e) => e.isEmpty);

      for (final userId in asignados) {
        final tarea = Tarea(
          id: uuid.v4(),
          groupId: batchId,
          reporteId: _lbCqX3daNcv.text.trim(),
          titulo: _mlqbeUOw1T.text.trim(),
          descripcion: _ifL0UXLnyPDWKNg.text.trim(),
          creadoPor: asignadorId,
          asignadoA: userId,
          estado: TareaEstado.pendiente,
        );

        await ref.read(tareaControllerProvider).xJaXqYSeLc(tarea);
      }

      final titulo = _mlqbeUOw1T.text.trim();
      final descripcionBase = _ifL0UXLnyPDWKNg.text.trim();
      final reporteId = _lbCqX3daNcv.text.trim();

      final desc = StringBuffer()
        ..writeln(descripcionBase.isEmpty ? titulo : descripcionBase)
        ..writeln('')
        ..writeln('---')
        ..writeln('Origen: GTO Docs')
        ..writeln('BatchId: $batchId');

      if (reporteId.isNotEmpty) {
        desc.writeln('ReporteId: $reporteId');
      }

      final ticket = GlpiTicket(
        titulo: 'Tarea: $titulo',
        descripcion: desc.toString(),
        fecha: createdAt,
        asignadores: asignadoresGlpi.toList(growable: false),
        asignados: asignados.toList(growable: false),
        categoria: 'tareas',
        prioridad: 'media',
        users: [
          for (final a in asignadoresGlpi)
            GlpiTicketUser(userId: a, role: TicketUserRole.requester),
          for (final u in asignados)
            GlpiTicketUser(userId: u, role: TicketUserRole.assignee),
        ],
        metadata: {
          'source': 'gto_docs_v2_ad',
          'batchId': batchId,
          if (reporteId.isNotEmpty) 'reporteId': reporteId,
        },
      );

      await ref
          .read(glpiRepositoryProvider)
          .crearTicket(ticket, entidadId: batchId);

      if (mounted) {
        ref.invalidate(tareasPorAsignadoProvider);
        ref.invalidate(tareasPorCreadorProvider);
        ref.invalidate(todasLasTareasProvider);
        Navigator.of(context).pop(true);
      }
    } finally {
      if (mounted) setState(() => _xqkxwc = false);
    }
  }

  String _oAk9M0qWePGmAVfA4Fv2O(Object e) {
    if (e is StateError) {
      return e.message;
    }
    return 'No se pudieron cargar usuarios. ${e.toString()}';
  }
}

class _W4dDHNea24XbR<T> extends PopupMenuEntry<T> {
  final double _afyNul;
  final double? _s0ykq;
  final Widget nhc2T;

  const _W4dDHNea24XbR({
    required double height,
    double? width,
    required this.nhc2T,
  }) : _afyNul = height,
       _s0ykq = width;

  @override
  double get height => _afyNul;

  @override
  bool represents(T? value) => false;

  @override
  State<_W4dDHNea24XbR<T>> createState() => _CgxyYM1FW9UC2RMpTK<T>();
}

class _CgxyYM1FW9UC2RMpTK<T> extends State<_W4dDHNea24XbR<T>> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: SizedBox(width: widget._s0ykq, child: widget.nhc2T),
    );
  }
}

class _IsBao0zpvkVz3K5uBTVlnaC extends StatefulWidget {
  final List<UserRef> fjlm1;
  final Set<String> v0ZLLRKyxT1RqGq;
  final bool e78Jfp;
  final ValueChanged<Set<String>> wTIDDi;

  const _IsBao0zpvkVz3K5uBTVlnaC({
    required this.fjlm1,
    required this.v0ZLLRKyxT1RqGq,
    required this.e78Jfp,
    required this.wTIDDi,
  });

  @override
  State<_IsBao0zpvkVz3K5uBTVlnaC> createState() =>
      _CFRwLMznYmLUo1UgdHSP76cQ1mfl();
}

class _CFRwLMznYmLUo1UgdHSP76cQ1mfl extends State<_IsBao0zpvkVz3K5uBTVlnaC> {
  late final Set<String> _iSCDEVAf = <String>{...widget.v0ZLLRKyxT1RqGq}
    ..removeWhere((e) => e.trim().isEmpty);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Asignado por (${_iSCDEVAf.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: widget.e78Jfp
                      ? null
                      : () {
                          setState(() => _iSCDEVAf.clear());
                        },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: widget.fjlm1.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('No hay usuarios disponibles.'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.fjlm1.length,
                    itemBuilder: (context, i) {
                      final u = widget.fjlm1[i];
                      final checked = _iSCDEVAf.contains(u.id);
                      return CheckboxListTile(
                        dense: true,
                        value: checked,
                        title: Text(u.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: widget.e78Jfp
                            ? null
                            : (v) {
                                setState(() {
                                  if (v == true) {
                                    _iSCDEVAf.add(u.id);
                                  } else {
                                    _iSCDEVAf.remove(u.id);
                                  }
                                });
                              },
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.e78Jfp
                    ? null
                    : () => widget.wTIDDi(_iSCDEVAf),
                child: const Text('Listo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Qw5rtjh55SsSHJLElRhKX extends StatefulWidget {
  final List<UserRef> wIk6T;
  final Set<String> w8JauVMU4UfbJz8;
  final bool uzL58j;
  final ValueChanged<Set<String>> aOIem4;

  const _Qw5rtjh55SsSHJLElRhKX({
    required this.wIk6T,
    required this.w8JauVMU4UfbJz8,
    required this.uzL58j,
    required this.aOIem4,
  });

  @override
  State<_Qw5rtjh55SsSHJLElRhKX> createState() => _Y9kkaMCQCNw2Fk9eHKvsivxCp1();
}

class _Y9kkaMCQCNw2Fk9eHKvsivxCp1 extends State<_Qw5rtjh55SsSHJLElRhKX> {
  late final Set<String> _sxRm23np = <String>{...widget.w8JauVMU4UfbJz8};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Asignar a (${_sxRm23np.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: widget.uzL58j
                      ? null
                      : () {
                          setState(() => _sxRm23np.clear());
                        },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: widget.wIk6T.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('No hay usuarios disponibles.'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.wIk6T.length,
                    itemBuilder: (context, i) {
                      final u = widget.wIk6T[i];
                      final checked = _sxRm23np.contains(u.id);
                      return CheckboxListTile(
                        dense: true,
                        value: checked,
                        title: Text(u.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: widget.uzL58j
                            ? null
                            : (v) {
                                setState(() {
                                  if (v == true) {
                                    _sxRm23np.add(u.id);
                                  } else {
                                    _sxRm23np.remove(u.id);
                                  }
                                });
                              },
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.uzL58j
                    ? null
                    : () => widget.aOIem4(_sxRm23np),
                child: const Text('Listo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Wf4ddykqAEjGBjQGuK0wZvrD extends ConsumerWidget {
  final GerenciaTheme hVHqc;

  const Wf4ddykqAEjGBjQGuK0wZvrD({super.key, required this.hVHqc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendientesAsync = ref.watch(combustiblePendientesCountProvider);
    final registrosAsync = ref.watch(combustibleRegistrosProvider);
    final lanStatus = ref
        .watch(lanStatusProvider)
        .maybeWhen(data: (s) => s, orElse: () => LanStatus.disconnected);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de combustible'),
        backgroundColor: hVHqc.colorPrimario,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Reintentar sincronización',
            onPressed: () {
              if (lanStatus != LanStatus.connected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Sin conexión al servidor (revisa Wi‑Fi y /api/health).',
                    ),
                  ),
                );
                return;
              }
              ref.read(syncWorkerProvider).runCombustibleOnly();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sincronización iniciada...')),
              );
            },
            icon: const Icon(Icons.sync),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.black.withValues(alpha: 0.04),
            child: pendientesAsync.when(
              data: (count) => Text(
                'Pendientes por subir: $count',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              loading: () => const Text('Pendientes por subir: ...'),
              error: (err, _) => const Text('Pendientes por subir: -'),
            ),
          ),
          Expanded(
            child: registrosAsync.when(
              data: (rows) {
                if (rows.isEmpty) {
                  return const Center(
                    child: Text('Aún no hay registros guardados localmente.'),
                  );
                }

                return ListView.separated(
                  itemCount: rows.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final r = rows[i];
                    final title = r.modo == 'cargar_combustible'
                        ? 'Carga de combustible'
                        : 'Uso de vehículo';
                    final subtitle = r.modo == 'cargar_combustible'
                        ? (r.operador ?? '-')
                        : (r.destino ?? '-');
                    final syncError = (r.syncError ?? '').trim();
                    final hasError = syncError.isNotEmpty;
                    final syncInfo = (r.syncInfo ?? '').trim();
                    final hasInfo = syncInfo.isNotEmpty;

                    return ListTile(
                      leading: Icon(
                        r.sincronizado ? Icons.cloud_done : Icons.cloud_off,
                        color: r.sincronizado ? Colors.green : Colors.orange,
                      ),
                      title: Text(title),
                      subtitle: Text(
                        [
                          '$subtitle • ${r.creadoEn.toLocal().toString()}',
                          if (hasError) 'Error: $syncError',
                          if (!hasError && hasInfo) 'Servidor: $syncInfo',
                        ].join('\n'),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: r.sincronizado
                          ? const Text('OK')
                          : (hasError
                                ? const Text('Error')
                                : const Text('Pendiente')),
                      onTap: (hasError || hasInfo)
                          ? () {
                              final text = hasError ? syncError : syncInfo;
                              showDialog<void>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    hasError
                                        ? 'Error de sincronización'
                                        : 'Respuesta del servidor',
                                  ),
                                  content: SingleChildScrollView(
                                    child: Text(text),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).maybePop(),
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          : null,
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

class NANXAg6T21qwQW {
  static const _vjaV4eGRJa6Sn9x1 = <AuHnvgWVYlrtTLknyggazMJ>[
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_01', u8JzM: 'Pintura en muros'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_02', u8JzM: 'Pintura epoxica en piso'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_03', u8JzM: 'Iluminación'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_04', u8JzM: 'Sensor de humo'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_05', u8JzM: 'Cámara de videovigilancia'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_06', u8JzM: 'Control de acceso'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_07', u8JzM: 'Condiciones de plafón'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_08', u8JzM: 'Temperatura interna de CT'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_09', u8JzM: 'Limpieza general del CT'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_10',
      u8JzM: 'Objetos, articulos y/o equipos no correspondientes al CT',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_11', u8JzM: 'Comentarios'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_12',
      u8JzM: 'Control de acceso frontal por gabinete',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_13',
      u8JzM: 'Control de acceso posterior por gabinete',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_14',
      u8JzM: 'Temperatura interna de gabinete',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_15', u8JzM: 'Humedad relativa interna'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_16',
      u8JzM: 'Sujesión de tuercas enjauladas y tornilleria',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_17', u8JzM: 'Netboz, monitor de rack'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_18', u8JzM: 'Comentarios'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_19', u8JzM: 'Voltaje de entrada UPS01'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_20', u8JzM: 'Voltaje de entrada UPS02'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_21', u8JzM: 'Voltaje de salida UPS01'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_22', u8JzM: 'Voltaje de salida UPS02'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_23',
      u8JzM: 'Estado de baterias del UPS01',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_24',
      u8JzM: 'Estado de baterias del UPS02',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_25',
      u8JzM: 'Funcionamiento del Bypass 01',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_26',
      u8JzM: 'Funcionamiento del Bypass 02',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_27', u8JzM: 'Comentarios'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_28',
      u8JzM: 'Etiquetado frontal y posterior de gabinete',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_29', u8JzM: 'Golpes o daños'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_30', u8JzM: 'Conexión de TGB a SBB'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_31', u8JzM: 'Etiqueta de barra de TF'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_32', u8JzM: 'Equipos aterrizados'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_33', u8JzM: 'Comentarios'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_34', u8JzM: 'Soporteria ajustada'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_35',
      u8JzM: 'Limpieza de escalera Runway',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_36', u8JzM: 'Estado de los accesorios'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_37', u8JzM: 'Sujeción de postes'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_38',
      u8JzM: 'Revisión y ajuste de tornilleria en cada unión',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_39',
      u8JzM: 'Aterrizado de escalera Runway',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_40', u8JzM: 'Nivelación de escalera'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_41', u8JzM: 'Comentarios'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_42', u8JzM: 'Limpieza de rack'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_43',
      u8JzM: 'Sujeción y anclaje de cada rack',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_44',
      u8JzM: 'Aterrizado a TF de cada rack',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_45',
      u8JzM:
          'Sujeción y ajuste en todos los tornillos de cada accesorio y/o equipo rackeado',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_46',
      u8JzM: 'Tapas frontales y traseras de organizadores frontales',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_47',
      u8JzM: 'Inspección fisica de la conexión en los paneles de parcheo',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_48',
      u8JzM: 'Etiquetado de cada uno de los nodos rematados',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_49', u8JzM: 'Etiquetado de line cord'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_50',
      u8JzM: 'Acomodo/peinado del sistema de cableado',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_51',
      u8JzM: 'Conexión de los pacht cord a los paneles de parcheo',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_52',
      u8JzM: 'Inspeción física de conexión de FO',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_53',
      u8JzM: 'Etiquetado de enlaces de FO',
    ),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_54',
      u8JzM: 'Etiquetado correcto de los jumper',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_55', u8JzM: 'Etiquetado de cada rack'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_56', u8JzM: 'Etiqueta de barra de TF'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_57', u8JzM: 'Conexión de TGB a SBB'),
    AuHnvgWVYlrtTLknyggazMJ(
      n2: 'site_58',
      u8JzM: 'Suministro eléctrico en los contactos del rack',
    ),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_59', u8JzM: 'Nivelación de escalera'),
    AuHnvgWVYlrtTLknyggazMJ(n2: 'site_60', u8JzM: 'Comentarios'),
  ];

  static const l9FV09ej3LL6mzbLKWIwsX = A32xKOUKm8KMrJkQEMBm9puVx(
    bY: 'mantto_mostrador',
    xAWWV: 'Equipos de mostrador',
    bVUNaMkVhBAwRt: 'REPORTE DE MANTENIMIENTO PREVENTIVO',
    xUX9iztXXpohN: 'Mostrador',
    twWXC: [
      AuHnvgWVYlrtTLknyggazMJ(n2: 'impresora_atb', u8JzM: 'Impresora ATB'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'impresora_btp', u8JzM: 'Impresora BTP'),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'impresora_puntos',
        u8JzM: 'Impresora de puntos',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'lector_documentos',
        u8JzM: 'Lector de documentos',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'lector_pases_abordar',
        u8JzM: 'Lector de pases de abordar',
      ),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'sistema_pava', u8JzM: 'Sistema PAVA'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'telefono_ip', u8JzM: 'Teléfono IP'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'monitor', u8JzM: 'Monitor'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'cpu', u8JzM: 'CPU'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'teclado', u8JzM: 'Teclado'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'mouse', u8JzM: 'Mouse'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'cableado_red', u8JzM: 'Cableado de red'),
      AuHnvgWVYlrtTLknyggazMJ(n2: 'cableado_gral', u8JzM: 'Cableado Gral.'),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'limpieza_general_mostrador',
        u8JzM: 'Limpieza general del mostrador',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'comentarios_generales_1',
        u8JzM: 'Comentarios generales',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'voltaje_entrada_nobreak_01',
        u8JzM: 'Voltaje de entrada No Breack 01',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'voltaje_entrada_nobreak_02',
        u8JzM: 'Voltaje de entrada No Breack 02',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'voltaje_salida_contactos_regulado',
        u8JzM: 'Voltaje de salida en contactos regulado',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'estado_baterias_ups_01',
        u8JzM: 'Estado de baterias del UPS 01',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'estado_baterias_ups_02',
        u8JzM: 'Estado de baterias del UPS 02',
      ),
      AuHnvgWVYlrtTLknyggazMJ(
        n2: 'comentarios_generales_2',
        u8JzM: 'Comentarios generales',
      ),
    ],
  );

  static const b6LNULRlCDV9nHlWUs = A32xKOUKm8KMrJkQEMBm9puVx(
    bY: 'mantto_sites',
    xAWWV: 'Equipos de site',
    bVUNaMkVhBAwRt: 'REPORTE DE MANTENIMIENTO PREVENTIVO',
    xUX9iztXXpohN: 'Site',
    twWXC: _vjaV4eGRJa6Sn9x1,
  );

  static const fZ0L6K338In0 = TOrYuZvGOIatVhQ7HHjUs5(
    jB: 'cl_etp',
    cOAhH: 'Check List Diario de Sistemas y Equipos TIC´S',
    gIVWK0AnkqvrFz: 'CHECK LIST DIARIO DE SISTEMAS Y EQUIPOS TIC´S',
    r6U77: [
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'videowalls',
        tl0sv: 'Videowalls y pantallas',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'telefonia_ip', tl0sv: 'Teléfonia IP'),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'pava', tl0sv: 'Pava'),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'equipo_computo',
        tl0sv: 'Equipo de computo',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'imp_xerox_epson',
        tl0sv: 'Imp.Xerox/Epson',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'fids', tl0sv: 'Fids'),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'cupps', tl0sv: 'CUPPS'),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'radiocomunicacion',
        tl0sv: 'Radiocomunicación',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'sistemas_aeroportuarios',
        tl0sv: 'Sistemas aeroportuarios',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'wifi', tl0sv: 'Wifi'),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'egate', tl0sv: 'E-gate'),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'telefono_rojo', tl0sv: 'Telefono rojo'),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'videovigilancia',
        tl0sv: 'Videovigilancia',
      ),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'kioscos', tl0sv: 'Kioscos'),
      QzH7mDXpjUABrAM6te4gGryVj3(jn: 'grp', tl0sv: 'GRP'),
      QzH7mDXpjUABrAM6te4gGryVj3(
        jn: 'equipo_activo_red',
        tl0sv: 'Equipo activo de red',
      ),
    ],
  );
}

class PDrvVgaQueI15K {
  static const _uukb4rp = FlutterSecureStorage();

  static const _hZsvgRo3 = 'auth_token';
  static const _d8tecDu = 'auth_user';

  Future<void> cHip(ZUV35mlB33k session) async {
    await _uukb4rp.write(
      key: _hZsvgRo3,
      value: session.zkR30,
    );

    await _uukb4rp.write(
      key: _d8tecDu,
      value: jsonEncode(_oOe9USP3N4(session.goQt)),
    );
  }

  Future<KqBOLs41?> zXZOOZY() async {
    final json = await _uukb4rp.read(key: _d8tecDu);
    if (json == null) return null;

    final map = jsonDecode(json) as Map<String, dynamic>;
    return _e6qDcEztKOo6(map);
  }

  Future<String?> lVlMk1NQ() async {
    return _uukb4rp.read(key: _hZsvgRo3);
  }

  Future<void> rAn5s() async {
    await _uukb4rp.delete(key: _hZsvgRo3);
    await _uukb4rp.delete(key: _d8tecDu);
  }

  Map<String, dynamic> _oOe9USP3N4(KqBOLs41 user) {
    return {
      'id': user.gw,
      'nombre': user.u3aymK,
      'area': user.sFiI,
      'gerencia': user.ucAcyxha,
      'roles': user.fH7uu,
    };
  }

  KqBOLs41 _e6qDcEztKOo6(Map<String, dynamic> json) {
    return KqBOLs41(
      gw: json['id'] as String,
      u3aymK: json['nombre'] as String,
      sFiI: json['area'] as String,
      ucAcyxha: (json['gerencia'] ?? '').toString(),
      fH7uu: List<String>.from(json['roles']),
    );
  }
}

class ZUV35mlB33k {
  final String zkR30;
  final KqBOLs41 goQt;

  ZUV35mlB33k({
    required this.zkR30,
    required this.goQt,
  });
}

@immutable
class QzH7mDXpjUABrAM6te4gGryVj3 {
  final String jn;
  final String tl0sv;

  const QzH7mDXpjUABrAM6te4gGryVj3({required this.jn, required this.tl0sv});
}

@immutable
class TOrYuZvGOIatVhQ7HHjUs5 {
  final String jB;
  final String cOAhH;
  final String gIVWK0AnkqvrFz;
  final List<QzH7mDXpjUABrAM6te4gGryVj3> r6U77;

  const TOrYuZvGOIatVhQ7HHjUs5({
    required this.jB,
    required this.cOAhH,
    required this.gIVWK0AnkqvrFz,
    required this.r6U77,
  });
}

@immutable
class DSNmK1QNCAsvVrsnHK4lUg {
  final String bZ4FPt;
  final String gFSF1;
  final bool ybLGi2BbR;
  final bool myA5Emfw;
  final String mKlRFyNhx;
  final String aBEipUYKaEqit;

  const DSNmK1QNCAsvVrsnHK4lUg({
    required this.bZ4FPt,
    required this.gFSF1,
    required this.ybLGi2BbR,
    required this.myA5Emfw,
    required this.mKlRFyNhx,
    required this.aBEipUYKaEqit,
  });
}

@immutable
class NfW2LWZq2KjvbSa3C {
  final String jonUKbKxt7pr;
  final String aaymfjA3J6G;

  final String t3aSr7z2;
  final String k7YAey0RC6sEJ;

  final DateTime qOp52xkYl;
  final List<DSNmK1QNCAsvVrsnHK4lUg> kfQ8o;

  const NfW2LWZq2KjvbSa3C({
    required this.jonUKbKxt7pr,
    required this.aaymfjA3J6G,
    required this.t3aSr7z2,
    required this.k7YAey0RC6sEJ,
    required this.qOp52xkYl,
    required this.kfQ8o,
  });
}

class Egx5YFxPIPYFUxIPtvJNo3n {
  final Dio uBg;

  Egx5YFxPIPYFUxIPtvJNo3n({required this.uBg});

  Future<List<Activo>> wmuYVH0gfQc4yjImI({
    int? gerenciaId,
    int? jefaturaId,
  }) async {
    final candidates = <_RequestCandidate>[
      _RequestCandidate(
        '/inventario-tics',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventario_tics',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventarios',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventario',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
    ];

    final res = await _xcgF2wYzgt(candidates);
    final list = _v1azHL7mHkf(res.data);

    return list
        .whereType<Map>()
        .map((m) => Activo.fromJson(m.cast<String, dynamic>()))
        .toList();
  }

  Future<Activo> eQ7AqLn0bj3(Activo activo) async {
    final payload = activo.toJson()..remove('id');

    final candidates = <String>[
      '/inventario-tics',
      '/inventarios',
      '/inventario',
    ];
    DioException? last;

    for (final path in candidates) {
      try {
        final res = await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'POST',
          path: path,
          data: payload,
        );
        final data = res.data;
        if (data is Map) {
          return Activo.fromJson(data.cast<String, dynamic>());
        }
        return activo;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para crear');
  }

  Future<void> wQeNzbhAilqc4rEk(Activo activo) async {
    final payload = activo.toJson();
    final id = activo.id;

    final candidates = <String>[
      '/inventario-tics/$id',
      '/inventarios/$id',
      '/inventario/$id',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'PUT',
          path: path,
          data: payload,
        );
        return;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        if (e.response?.statusCode == 405) {
          try {
            await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
              method: 'PATCH',
              path: path,
              data: payload,
            );
            return;
          } on DioException {
            rethrow;
          }
        }
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para actualizar');
  }

  Future<void> lAPlOXMzXjXRUy(String id) async {
    final candidates = <String>[
      '/inventario-tics/$id',
      '/inventarios/$id',
      '/inventario/$id',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(method: 'DELETE', path: path);
        return;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para eliminar');
  }

  Map<String, dynamic>? _xe({int? gerenciaId, int? jefaturaId}) {
    final qp = <String, dynamic>{};
    if (gerenciaId != null) {
      qp['gerencia'] = gerenciaId;
      qp['gerencia_id'] = gerenciaId;
      qp['gerenciaId'] = gerenciaId;
    }
    if (jefaturaId != null) {
      qp['jefatura'] = jefaturaId;
      qp['jefatura_id'] = jefaturaId;
      qp['jefaturaId'] = jefaturaId;
    }
    return qp.isEmpty ? null : qp;
  }

  Future<Response<dynamic>> _xcgF2wYzgt(
    List<_RequestCandidate> candidates,
  ) async {
    DioException? lastDioError;

    for (final c in candidates) {
      try {
        return await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'GET',
          path: c.path,
          queryParameters: c.queryParameters,
        );
      } on DioException catch (e) {
        lastDioError = e;
        final status = e.response?.statusCode;

        if (status == 404) continue;

        rethrow;
      }
    }

    if (lastDioError != null) throw lastDioError;
    throw StateError('Inventario: no se encontró un endpoint disponible');
  }

  List<dynamic> _v1azHL7mHkf(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      final map = data.cast<String, dynamic>();
      final v = map['data'] ?? map['items'] ?? map['result'];
      if (v is List) return v;
    }
    return const [];
  }

  Future<Response<dynamic>> _k6F4aRLh8rVIjQpHTz7TupnlMtckrC({
    required String method,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      return await uBg.request(
        path,
        options: Options(method: method),
        queryParameters: queryParameters,
        data: data,
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = uBg.options.baseUrl;
      final is404 = status == 404;

      if (!is404 || !path.startsWith('/')) rethrow;

      if (!baseUrl.endsWith('/api') && !path.startsWith('/api/')) {
        return await uBg.request(
          '/api$path',
          options: Options(method: method),
          queryParameters: queryParameters,
          data: data,
        );
      }

      if (baseUrl.endsWith('/api')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi$path').replace(
          queryParameters: queryParameters?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await uBg.requestUri(
          uri,
          options: Options(method: method),
          data: data,
        );
      }

      rethrow;
    }
  }
}

class _RequestCandidate {
  final String path;
  final Map<String, dynamic>? queryParameters;

  _RequestCandidate(this.path, this.queryParameters);
}

class RNEVvWsv9UVqyU7LQ3ixET8 extends Table {
  TextColumn get e1 => text()();
  TextColumn get pMfnkJIJc => text()();
  TextColumn get afKIwHG => text()();
  TextColumn get w52Q8yJ => text()();
  DateTimeColumn get q1y0mtak => dateTime()();

  @override
  Set<Column> get primaryKey => {e1};
}

class YgZFetYh1vLyAe extends StatelessWidget implements PreferredSizeWidget {
  final GerenciaTheme vGZ4q;
  final String fBFkV;
  final List<Widget>? bQCu54C;
  final bool bPUFmYe3;

  const YgZFetYh1vLyAe({
    super.key,
    required this.vGZ4q,
    required this.fBFkV,
    this.bQCu54C,
    this.bPUFmYe3 = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final radius = isTablet ? 24.0 : 20.0;

    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.2,
    );

    return AppBar(
      backgroundColor: vGZ4q.colorPrimario,
      elevation: 4,
      scrolledUnderElevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: bPUFmYe3
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(fBFkV, style: titleStyle),
      actions: bQCu54C,
      shadowColor: vGZ4q.colorPrimario.withAlpha(60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
      ),
    );
  }
}

class GWqmPL1h92soN8 extends Table {
  IntColumn get f4 => integer().autoIncrement()();

  TextColumn get s5lJvd3 => text()();

  TextColumn get opiJZDaB0 => text()();

  TextColumn get dQ2fJw => text()(); // create, update, delete

  TextColumn get v3Dvw1i =>
      text().map(const CH4QcDZ8hi5WYcPfn8gxACzf()).nullable()();

  BoolColumn get tFiRWl5I4 => boolean().withDefault(const Constant(false))();

  DateTimeColumn get iGXSnoPMI => dateTime().withDefault(currentDateAndTime)();
}

class CH4QcDZ8hi5WYcPfn8gxACzf
    extends TypeConverter<Map<String, dynamic>, String> {
  const CH4QcDZ8hi5WYcPfn8gxACzf();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      jsonDecode(fromDb) as Map<String, dynamic>;

  @override
  String toSql(Map<String, dynamic> value) => jsonEncode(value);
}

class UxxIZKOxhp0dVMt9SSl7a extends ConsumerStatefulWidget {
  final GerenciaTheme meoZv;
  final String nRze6RO;
  final Tarea? bg6QWa2E;

  const UxxIZKOxhp0dVMt9SSl7a({
    super.key,
    required this.meoZv,
    required this.nRze6RO,
    this.bg6QWa2E,
  });

  @override
  ConsumerState<UxxIZKOxhp0dVMt9SSl7a> createState() =>
      _YVq0ZgHwk9ya6Hg0jdvie61ivj();
}

class _YVq0ZgHwk9ya6Hg0jdvie61ivj extends ConsumerState<UxxIZKOxhp0dVMt9SSl7a> {
  final _hq26IBiSYNb2eE = TextEditingController();
  final _qHM49C = ImagePicker();

  @override
  void dispose() {
    _hq26IBiSYNb2eE.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final user = auth.user;

    if (auth.status != AuthStatus.authenticated || user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final allAsync = ref.watch(todasLasTareasProvider);
    final comentariosAsync = ref.watch(
      tareaComentariosProvider(widget.nRze6RO),
    );
    final adjuntosAsync = ref.watch(tareaAdjuntosProvider(widget.nRze6RO));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: widget.meoZv.colorPrimario,
        elevation: 4,
        shadowColor: widget.meoZv.colorPrimario.withValues(alpha: 0.15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detalle de tarea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: allAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (all) {
          final group = all
              .where(
                (t) =>
                    (t.groupId?.trim().isNotEmpty ?? false) &&
                    t.groupId == widget.nRze6RO,
              )
              .toList(growable: false);

          final effective = group.isNotEmpty
              ? group
              : (widget.bg6QWa2E != null
                    ? <Tarea>[widget.bg6QWa2E!]
                    : const <Tarea>[]);

          if (effective.isEmpty) {
            return const Center(child: Text('No se encontró la tarea'));
          }

          final head = effective.first;

          final gerenciaId = user.resolvedGerenciaId;
          final usersAsync = ref.watch(usersListByGerenciaProvider(gerenciaId));

          String sejdvPIY5p2XY(TareaEstado estado) {
            return switch (estado) {
              TareaEstado.pendiente => 'Pendiente',
              TareaEstado.enProceso => 'En proceso',
              TareaEstado.completada => 'Completada',
            };
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth >= 600;
              final horizontalPadding = constraints.maxWidth >= 1200
                  ? 120.0
                  : constraints.maxWidth >= 900
                  ? 80.0
                  : constraints.maxWidth >= 600
                  ? 60.0
                  : 24.0;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isTablet ? 32 : 24,
                ),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            isTablet ? 20 : 16,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: isTablet ? 15 : 12,
                              offset: Offset(0, isTablet ? 6 : 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isTablet ? 20 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                head.titulo,
                                style: TextStyle(
                                  fontSize: isTablet ? 22 : 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _qCx('Descripción', head.descripcion),
                              _qCx(
                                'Reporte',
                                head.reporteId.isEmpty ? '-' : head.reporteId,
                              ),
                              _qCx(
                                'Asignadores',
                                (head.creadoPor ?? '').isEmpty
                                    ? '-'
                                    : head.creadoPor!,
                              ),
                              _qCx('Grupo', widget.nRze6RO),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isTablet ? 16 : 12),
                      const TabBar(
                        tabs: [
                          Tab(text: 'Asignados'),
                          Tab(text: 'Comentarios'),
                          Tab(text: 'Adjuntos'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: TabBarView(
                          children: [
                            usersAsync.when(
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              error: (error, stackTrace) => _rEnac1ja0iiHL(
                                context,
                                effective,
                                sejdvPIY5p2XY,
                                nameForUserId: (id) => id,
                                canEdit: (t) =>
                                    user.isSupervisor ||
                                    t.asignadoA == user.id ||
                                    t.creadoPor == user.id,
                              ),
                              data: (users) {
                                final byId = <String, String>{
                                  for (final u in users) u.id: u.name,
                                };
                                return _rEnac1ja0iiHL(
                                  context,
                                  effective,
                                  sejdvPIY5p2XY,
                                  nameForUserId: (id) => byId[id] ?? id,
                                  canEdit: (t) =>
                                      user.isSupervisor ||
                                      t.asignadoA == user.id ||
                                      t.creadoPor == user.id,
                                  onEstadoChanged: (t, next) async {
                                    await ref
                                        .read(tareaRepositoryProvider)
                                        .actualizarEstado(
                                          tareaId: t.id,
                                          estado: next,
                                        );
                                    ref.invalidate(todasLasTareasProvider);
                                  },
                                );
                              },
                            ),
                            _gQsv01B3AugCap(
                              context,
                              comentariosAsync,
                              currentUserId: user.id,
                            ),
                            _qT2X1qe2dP6(context, adjuntosAsync),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _gQsv01B3AugCap(
    BuildContext context,
    AsyncValue<List<TareaComentario>> comentariosAsync, {
    required String currentUserId,
  }) {
    return Column(
      children: [
        Expanded(
          child: comentariosAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (comentarios) {
              final list = comentarios;
              if (list.isEmpty) {
                return const Center(child: Text('Sin comentarios'));
              }
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final c = list[i];
                  final autor = c.autorId;
                  final mensaje = c.mensaje;
                  final creadoEn = c.creadoEn;
                  final cs = Theme.of(context).colorScheme;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            autor == currentUserId ? 'Tú' : autor,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 6),
                          Text(mensaje),
                          const SizedBox(height: 6),
                          Text(
                            creadoEn.toLocal().toString(),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _hq26IBiSYNb2eE,
                decoration: const InputDecoration(
                  hintText: 'Escribe un comentario…',
                  isDense: true,
                ),
                minLines: 1,
                maxLines: 3,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Enviar',
              icon: const Icon(Icons.send),
              onPressed: () async {
                final txt = _hq26IBiSYNb2eE.text.trim();
                if (txt.isEmpty) return;
                _hq26IBiSYNb2eE.clear();
                await ref
                    .read(tareaComentariosRepositoryProvider)
                    .agregarComentario(
                      tareaId: widget.nRze6RO,
                      autorId: currentUserId,
                      mensaje: txt,
                    );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _qT2X1qe2dP6(
    BuildContext context,
    AsyncValue<List<TareaAdjunto>> adjuntosAsync,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final source = await showModalBottomSheet<ImageSource>(
                    context: context,
                    builder: (ctx) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.photo_camera),
                            title: const Text('Cámara'),
                            onTap: () =>
                                Navigator.of(ctx).pop(ImageSource.camera),
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Galería'),
                            onTap: () =>
                                Navigator.of(ctx).pop(ImageSource.gallery),
                          ),
                        ],
                      ),
                    ),
                  );
                  if (source == null) return;
                  final file = await _qHM49C.pickImage(
                    source: source,
                    imageQuality: 85,
                  );
                  if (file == null) return;
                  await ref
                      .read(tareaAdjuntosRepositoryProvider)
                      .agregarAdjunto(
                        tareaId: widget.nRze6RO,
                        tipo: TareaAdjuntoTipo.foto,
                        nombre: file.name,
                        localPath: file.path,
                        mimeType: 'image/${file.path.split('.').last}',
                      );
                },
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Foto'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    withData: false,
                  );
                  final picked = result?.files.single;
                  final path = picked?.path;
                  if (picked == null || path == null) return;
                  await ref
                      .read(tareaAdjuntosRepositoryProvider)
                      .agregarAdjunto(
                        tareaId: widget.nRze6RO,
                        tipo: TareaAdjuntoTipo.documento,
                        nombre: picked.name,
                        localPath: path,
                        mimeType: null,
                      );
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Documento'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: adjuntosAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (adjuntos) {
              final list = adjuntos;
              if (list.isEmpty) {
                return const Center(child: Text('Sin adjuntos'));
              }
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final a = list[i];
                  final tipo = a.tipo;
                  final nombre = a.nombre;
                  final localPath = a.localPath;
                  final remoteUrl = a.remoteUrl;
                  final icon = (tipo.toString().contains('foto'))
                      ? Icons.image
                      : Icons.description;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(icon),
                      title: Text(nombre),
                      subtitle: Text(remoteUrl ?? localPath),
                      trailing: remoteUrl == null
                          ? const Text('Pendiente')
                          : const Text('OK'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  static Widget _qCx(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  static Widget _rEnac1ja0iiHL(
    BuildContext context,
    List<Tarea> tasks,
    String Function(TareaEstado) displayEstado, {
    required String Function(String userId) nameForUserId,
    required bool Function(Tarea tarea) canEdit,
    Future<void> Function(Tarea tarea, TareaEstado next)? onEstadoChanged,
  }) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final t = tasks[i];
        final editable = canEdit(t);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(nameForUserId(t.asignadoA)),
            subtitle: Text(displayEstado(t.estado)),
            trailing: DropdownButton<TareaEstado>(
              value: t.estado,
              onChanged: (!editable || onEstadoChanged == null)
                  ? null
                  : (v) async {
                      if (v == null) return;
                      await onEstadoChanged(t, v);
                    },
              items: TareaEstado.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(displayEstado(e)),
                    ),
                  )
                  .toList(growable: false),
            ),
          ),
        );
      },
    );
  }
}

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

class WFCAuC3v1ianMKpJAKtS extends StateNotifier<AsistenciaState> {
  final AsistenciaRepository eAIrDoPzhH;
  final Ref gV2;

  WFCAuC3v1ianMKpJAKtS(this.eAIrDoPzhH, this.gV2)
    : super(const AsistenciaState());

  Future<void> uJdPtHtTtxc2AOJBQlk({
    required String usuarioId,
    required TipoAsistencia tipo,
    String metodo = 'manual',
  }) async {
    final lanStatus = gV2
        .read(lanStatusProvider)
        .maybeWhen(
          data: (s) => s,
          orElse: () => LanStatus.disconnected,
        );

    if (lanStatus != LanStatus.connected) {
      state = state.copyWith(
        error: 'Debes estar conectado a la red del aeropuerto',
      );
      return;
    }

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

enum LITfieoDDg8eEyKK { jtX9, dxGTBUsSN }

class RRZ2eSJ3heW8 {
  final String jY;

  final String mmb5zGV;
  final LITfieoDDg8eEyKK ggg8;
  final String gKbL2L;
  final String j27Lc8uCC;
  final String? zrPoVDNY;
  final String? fNthKj10D;
  final DateTime qV1n9F6Q;

  RRZ2eSJ3heW8({
    required this.jY,
    required this.mmb5zGV,
    required this.ggg8,
    required this.gKbL2L,
    required this.j27Lc8uCC,
    this.zrPoVDNY,
    this.fNthKj10D,
    required this.qV1n9F6Q,
  });
}

class ZwEeMSnXUt067XMh {
  final int dDG0WLg1xeHX5NlY;
  final int vaPtIsWXglE7VGXe;
  final int n17OQmGdCQaCRQ0H;
  final int rlcjYCwoCRP6aau8rcy;
  final int mpUJgzSzi3hDN;

  ZwEeMSnXUt067XMh({
    required this.dDG0WLg1xeHX5NlY,
    required this.vaPtIsWXglE7VGXe,
    required this.n17OQmGdCQaCRQ0H,
    required this.rlcjYCwoCRP6aau8rcy,
    required this.mpUJgzSzi3hDN,
  });
}

enum MbEHQlSm7QuXHG {
  dPNaqxtQQHtz5ugCVCQk,

  mBeYn13MTJu4,

  k8tSnngdH7N8soIEN,
}

class JyKCDl3xPcu45E1G {
  final bool k6UOhan;
  final MbEHQlSm7QuXHG? c6UmdP;

  const JyKCDl3xPcu45E1G({
    required this.k6UOhan,
    this.c6UmdP,
  });

  factory JyKCDl3xPcu45E1G.hnmGyW() {
    return const JyKCDl3xPcu45E1G(k6UOhan: false);
  }

  factory JyKCDl3xPcu45E1G.px8NoMu(MbEHQlSm7QuXHG reason) {
    return JyKCDl3xPcu45E1G(
      k6UOhan: true,
      c6UmdP: reason,
    );
  }
}

class FEtVp6B4E9VZy {
  static bool hvtV18BJvk8() {
    if (!kReleaseMode) return false;

    return false;
  }
}

class N7ryjQbQHaTbZcmZy6MwR {
  final AppDatabase j6;

  N7ryjQbQHaTbZcmZy6MwR(this.j6);

  Stream<List<CombustibleRegistrosTableData>> gMdD8Ei3rHejfR() {
    final query = j6.select(j6.combustibleRegistrosTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.creadoEn, mode: OrderingMode.desc),
      ]);
    return query.watch();
  }

  Stream<int> vrqvpgNUrkUJ3r4Ct9fT() {
    final q = j6.selectOnly(j6.combustibleRegistrosTable)
      ..addColumns([j6.combustibleRegistrosTable.id.count()])
      ..where(j6.combustibleRegistrosTable.sincronizado.equals(false));

    return q.watchSingle().map((row) {
      return row.read(j6.combustibleRegistrosTable.id.count()) ?? 0;
    });
  }

  Future<String> pUsacB2aUz1h3kcy3X({
    required String usuarioId,
    required String nombre,
    required String destino,
    String? gerenciaNombre,
    int? gerenciaId,
    String? vehiculo,
    String? horaInicio,
    String? combustibleInicial,
    int? kilometrajeInicial,
    String? horaFinal,
    String? combustibleFinal,
    int? kilometrajeFinal,
    Map<String, dynamic>? metadata,
  }) async {
    final id = const Uuid().v4();

    final mergedMetadata = <String, dynamic>{
      if (metadata != null) ...metadata,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
    };

    final payload = <String, dynamic>{
      'id': id,
      'usuarioId': usuarioId,
      'modo': 'usar_vehiculo',
      'nombre': nombre,
      'destino': destino,
      if (gerenciaNombre != null && gerenciaNombre.trim().isNotEmpty)
        'gerencia': gerenciaNombre.trim(),
      if (gerenciaId != null) 'gerenciaId': gerenciaId,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
      'horaInicio': horaInicio,
      'horaFinal': horaFinal,
      'combustibleInicial': combustibleInicial,
      'combustibleFinal': combustibleFinal,
      'kilometrajeInicial': kilometrajeInicial,
      'kilometrajeFinal': kilometrajeFinal,
      'metadata': mergedMetadata.isEmpty ? null : mergedMetadata,
    }..removeWhere((_, v) => v == null);

    await j6
        .into(j6.combustibleRegistrosTable)
        .insert(
          CombustibleRegistrosTableCompanion.insert(
            id: id,
            usuarioId: usuarioId,
            modo: 'usar_vehiculo',
            nombre: Value(nombre),
            destino: Value(destino),
            horaInicio: Value(horaInicio),
            horaFinal: Value(horaFinal),
            combustibleInicial: Value(combustibleInicial),
            combustibleFinal: Value(combustibleFinal),
            kilometrajeInicial: Value(kilometrajeInicial),
            kilometrajeFinal: Value(kilometrajeFinal),
            metadata: Value(
              mergedMetadata.isEmpty ? null : jsonEncode(mergedMetadata),
            ),
            sincronizado: const Value(false),
          ),
        );

    await j6
        .into(j6.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'combustible_registro',
            entidadId: id,
            accion: 'create',
            payload: Value(payload),
          ),
        );

    return id;
  }

  Future<String> mJAHRmQYVj5b65jV1gP4nVa({
    required String usuarioId,
    String? fechaCarga,
    required String operador,
    String? vehiculo,
    String? gerenciaNombre,
    int? gerenciaId,
    int? kmAntes,
    int? kmDespues,
    Map<String, dynamic>? metadata,
  }) async {
    final id = const Uuid().v4();
    final mergedMetadata = <String, dynamic>{
      if (metadata != null) ...metadata,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
    };
    final payload = <String, dynamic>{
      'id': id,
      'usuarioId': usuarioId,
      'modo': 'cargar_combustible',
      'fechaCarga': fechaCarga,
      'operador': operador,
      if (gerenciaNombre != null && gerenciaNombre.trim().isNotEmpty)
        'gerencia': gerenciaNombre.trim(),
      if (gerenciaId != null) 'gerenciaId': gerenciaId,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
      'kmAntes': kmAntes,
      'kmDespues': kmDespues,
      'metadata': mergedMetadata.isEmpty ? null : mergedMetadata,
    }..removeWhere((_, v) => v == null);

    await j6
        .into(j6.combustibleRegistrosTable)
        .insert(
          CombustibleRegistrosTableCompanion.insert(
            id: id,
            usuarioId: usuarioId,
            modo: 'cargar_combustible',
            fechaCarga: Value(fechaCarga),
            operador: Value(operador),
            kmAntes: Value(kmAntes),
            kmDespues: Value(kmDespues),
            metadata: Value(
              mergedMetadata.isEmpty ? null : jsonEncode(mergedMetadata),
            ),
            sincronizado: const Value(false),
          ),
        );

    await j6
        .into(j6.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'combustible_registro',
            entidadId: id,
            accion: 'create',
            payload: Value(payload),
          ),
        );

    return id;
  }
}

class YkAKoy6 {
  static Future<bool> ede9fJl() async {
    final result = await Connectivity().checkConnectivity();
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }
}

enum PRIays {
  gBy,
  lC,
  oQi6,
}

class Q1AxIGqmhlVvio extends StateNotifier<VgJlYXlcR> {
  final SQrj3Cecjbvq0H jal3;
  final PDrvVgaQueI15K yLINSHk;
  final Ref kdj;

  Q1AxIGqmhlVvio({required this.jal3, required this.yLINSHk, required this.kdj})
    : super(VgJlYXlcR.i5Gzg0e()) {
    _peej1LtPEoZ();
  }

  Future<void> _peej1LtPEoZ() async {
    final user = await yLINSHk.zXZOOZY();
    if (user != null) {
      final config = kdj.read(appConfigProvider);
      if (config.useJwt) {
        final token = await yLINSHk.lVlMk1NQ();
        if (token == null || token.trim().isEmpty) {
          await yLINSHk.rAn5s();
          state = VgJlYXlcR.zZoZETFaKv1JC1h();
          return;
        }
      }

      state = VgJlYXlcR.i6EtUTyVpISly(user);
    } else {
      state = VgJlYXlcR.zZoZETFaKv1JC1h();
    }
  }

  Future<void> pPCVW(String username, String password) async {
    final lanStatus = kdj
        .read(lanStatusProvider)
        .maybeWhen(data: (s) => s, orElse: () => LanStatus.disconnected);

    try {
      final sessionData = await jal3.inKrK(
        username: username,
        password: password,
      );

      await yLINSHk.cHip(sessionData);

      state = VgJlYXlcR.i6EtUTyVpISly(sessionData.goQt);
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('[AUTH] login failed (lan=$lanStatus): $e');
        debugPrint('$st');
      }
      state = VgJlYXlcR.zZoZETFaKv1JC1h();
    }
  }

  Future<void> aZQAoR() async {
    await yLINSHk.rAn5s();
    state = VgJlYXlcR.zZoZETFaKv1JC1h();
  }

  void bKBfanzh() {
    state = VgJlYXlcR.blocked();
  }
}

final usersRepositoryProvider = Provider<R7hXKM6tAZNKFFb>((ref) {
  return R7hXKM6tAZNKFFb(
    iVC: ref.read(dioProvider),
    mznVX: ref.read(sharedPreferencesProvider),
  );
});

final usersListProvider = FutureProvider<List<SpHMLML>>((ref) async {
  return ref.read(usersRepositoryProvider).bFJUUKdn();
});

final usersListByGerenciaProvider = FutureProvider.family<List<SpHMLML>, int?>((
  ref,
  gerenciaId,
) async {
  return ref.read(usersRepositoryProvider).bFJUUKdn(gerenciaId: gerenciaId);
});

final pdfUploadApiRepositoryProvider = Provider<NTH9i9aPwrRRm8OPAhRpr2>((ref) {
  return NTH9i9aPwrRRm8OPAhRpr2(bFo: ref.read(dioProvider));
});

class BbDQBPH1XjQxyWi6pnWbU extends Table {
  TextColumn get fS => text()();
  TextColumn get lbLqJXd => text()();
  TextColumn get fsSPKvL => text()();
  TextColumn get kj4kDZb => text()();
  DateTimeColumn get a5v3QBFz => dateTime()();

  @override
  Set<Column> get primaryKey => {fS};
}

class XyPYpOt4wpQevOe {
  static Future<bool> jqcIk8() async {
    return true;
  }
}

class T6Sp2bVXCuIMs2pcv extends ConsumerStatefulWidget {
  final GerenciaTheme bhiFm;

  const T6Sp2bVXCuIMs2pcv({super.key, required this.bhiFm});

  @override
  ConsumerState<T6Sp2bVXCuIMs2pcv> createState() => _MItF3csKEIXQhkNreFWULl();
}

class _MItF3csKEIXQhkNreFWULl extends ConsumerState<T6Sp2bVXCuIMs2pcv> {
  final _q1k4q0dsrA8aIcKL = TextEditingController();
  String _b5Cy7CujRUl = '';

  @override
  void dispose() {
    _q1k4q0dsrA8aIcKL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);
    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final jefaturasAsync = ref.watch(jefaturasProvider);

    return Scaffold(
      appBar: GerenciaAppBar(theme: widget.bhiFm, title: 'Checklist'),
      body: jefaturasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar jefaturas: ${_hvx9HL2V(e)}'),
          ),
        ),
        data: (items) {
          final filtered = _i1yUpr1E2bd(items);

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(jefaturasProvider);
              await ref.read(jefaturasProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              children: [
                TextField(
                  controller: _q1k4q0dsrA8aIcKL,
                  onChanged: (v) => setState(() => _b5Cy7CujRUl = v),
                  decoration: InputDecoration(
                    hintText: 'Buscar jefatura…',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                if (items.isEmpty)
                  const Center(child: Text('No hay jefaturas disponibles')),
                ...filtered.map(
                  (j) => _KdJQSc2NhdOd(
                    eqqtm5DH: j,
                    mo2Ad: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HXsf7zlICe(
                            mjUxc: widget.bhiFm,
                            voozy1rqGl: j.id,
                            zXBtPDtDfzb3jI: j.nombre,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Jefatura> _i1yUpr1E2bd(List<Jefatura> items) {
    final q = _b5Cy7CujRUl.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((j) => j.nombre.toLowerCase().contains(q)).toList();
  }

  String _hvx9HL2V(Object e) {
    if (e is StateError) return e.message;
    return e.toString();
  }
}

class _KdJQSc2NhdOd extends StatelessWidget {
  final Jefatura eqqtm5DH;
  final VoidCallback mo2Ad;

  const _KdJQSc2NhdOd({required this.eqqtm5DH, required this.mo2Ad});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    final cs = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: mo2Ad,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                _PFTKHH3M5u9ed9(cfS: eqqtm5DH.img),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eqqtm5DH.nombre,
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 16,
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ver checklist',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: cs.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 24 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PFTKHH3M5u9ed9 extends StatelessWidget {
  final String? cfS;

  const _PFTKHH3M5u9ed9({required this.cfS});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    final name = cfS?.trim();
    if (name == null || name.isEmpty) {
      return _lTN0fuF2(isTablet);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
      child: Image.asset(
        'assets/img/$name.png',
        width: isTablet ? 80 : 64,
        height: isTablet ? 80 : 64,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _lTN0fuF2(isTablet),
      ),
    );
  }

  Widget _lTN0fuF2(bool isTablet) {
    return Container(
      width: isTablet ? 80 : 64,
      height: isTablet ? 80 : 64,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
      ),
      child: Icon(
        Icons.business,
        color: Colors.blue[700],
        size: isTablet ? 40 : 32,
      ),
    );
  }
}

class L4x33R {
  final String yY;
  final String hks1zC;
  final String giub;
  final String zQaebqa7x;
  final String wjZUt3;
  final int dxE2uedc;
  final String? yatN4LOWLEf;
  final String? phR;

  L4x33R({
    required this.yY,
    required this.hks1zC,
    required this.giub,
    required this.zQaebqa7x,
    required this.wjZUt3,
    this.dxE2uedc = 0,
    this.yatN4LOWLEf,
    this.phR,
  });

  factory L4x33R.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] ?? json['activo_id'] ?? json['activoId'] ?? '')
        .toString();
    final nombre = (json['nombre'] ?? json['name'] ?? '').toString();
    final tipo = (json['categoria'] ?? json['tipo'] ?? '').toString();
    final ubicacion = (json['ubicacion'] ?? json['location'] ?? '').toString();
    final estado = (json['estado'] ?? '').toString();

    final cantidadRaw = json['cantidad'];
    final cantidad = cantidadRaw is int
        ? cantidadRaw
        : int.tryParse(cantidadRaw?.toString() ?? '') ?? 0;

    final descripcion = (json['descripcion'] ?? '').toString().trim();
    final img = (json['img'] ?? json['imagen'] ?? '').toString().trim();

    return L4x33R(
      yY: id,
      hks1zC: nombre,
      giub: tipo,
      zQaebqa7x: ubicacion,
      wjZUt3: estado,
      dxE2uedc: cantidad,
      yatN4LOWLEf: descripcion.isEmpty ? null : descripcion,
      phR: img.isEmpty ? null : img,
    );
  }

  Map<String, dynamic> a4Fv74() {
    return {
      'id': yY,
      'nombre': hks1zC,
      'tipo': giub,
      'categoria': giub,
      'ubicacion': zQaebqa7x,
      'estado': wjZUt3,
      'cantidad': dxE2uedc,
      'descripcion': yatN4LOWLEf,
      'img': phR,
      'imagen': phR,
    }..removeWhere((_, v) => v == null);
  }

  L4x33R tcnhoXd2({
    String? id,
    String? nombre,
    String? tipo,
    String? ubicacion,
    String? estado,
    int? cantidad,
    String? descripcion,
    String? img,
  }) {
    return L4x33R(
      yY: id ?? this.yY,
      hks1zC: nombre ?? this.hks1zC,
      giub: tipo ?? this.giub,
      zQaebqa7x: ubicacion ?? this.zQaebqa7x,
      wjZUt3: estado ?? this.wjZUt3,
      dxE2uedc: cantidad ?? this.dxE2uedc,
      yatN4LOWLEf: descripcion ?? this.yatN4LOWLEf,
      phR: img ?? this.phR,
    );
  }
}

class UlKJ4tygr7WfnyTNeVB extends ConsumerStatefulWidget {
  final GerenciaTheme dMGUn;
  final int g6e7CskfGn;
  final String gf58FST9dJ9aPv;
  final ChecklistExistente qsQyRlEYj;

  const UlKJ4tygr7WfnyTNeVB({
    super.key,
    required this.dMGUn,
    required this.g6e7CskfGn,
    required this.gf58FST9dJ9aPv,
    required this.qsQyRlEYj,
  });

  @override
  ConsumerState<UlKJ4tygr7WfnyTNeVB> createState() =>
      _E8tubzr4ABcUAajKtdZnaNT9();
}

class _E8tubzr4ABcUAajKtdZnaNT9 extends ConsumerState<UlKJ4tygr7WfnyTNeVB> {
  bool _sBbz = false;
  GeneratedPdf? _j1Om;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kind = _resolveKindForChecklist(
      funcionForm: widget.qsQyRlEYj.funcionForm,
      checklistNombre: widget.qsQyRlEYj.nombre,
    );

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.dMGUn,
        title: widget.qsQyRlEYj.nombre,
        actions: [
          IconButton(
            tooltip: 'Subir PDF (LAN)',
            icon: const Icon(Icons.cloud_upload),
            onPressed: _sBbz ? null : _aLd5gJ4h,
          ),
        ],
      ),
      body: Stack(
        children: [
          if (kind == _OmdH2VF3IXjjv.jfyHnNDqyQ)
            ChecklistReportForm(
              definition: ReportsCatalog.mantenimientoSites,
              onSubmit: _qfam7IePImWBYWEcCSe,
            )
          else if (kind == _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ)
            ChecklistReportForm(
              definition: ReportsCatalog.mantenimientoMostrador,
              onSubmit: _qfam7IePImWBYWEcCSe,
            )
          else if (kind == _OmdH2VF3IXjjv.oi2)
            EtpChecklistForm(
              definition: ReportsCatalog.checklistEtp,
              userName: ref.read(authControllerProvider).user?.nombre ?? '',
              checklistName: widget.qsQyRlEYj.nombre,
              onSubmit: _f7CVCBzjevV,
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Este checklist aún no está soportado en v2.\nfuncion_form: ${widget.qsQyRlEYj.funcionForm}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (_sBbz)
            const Positioned.fill(
              child: ColoredBox(
                color: Color(0x88000000),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _qfam7IePImWBYWEcCSe(ChecklistReportDraft draft) async {
    await _kIkIrW4fvZI0W5dHyi(
      filenamePrefix: 'checklist',
      build: () => MaintenancePreventivoPdf.build(
        definition: _s4VjK5MMu4BzCYQWI8zZO(
          funcionForm: widget.qsQyRlEYj.funcionForm,
          checklistNombre: widget.qsQyRlEYj.nombre,
        ),
        draft: draft,
      ),
    );
  }

  Future<void> _f7CVCBzjevV(EtpChecklistDraft draft) async {
    await _kIkIrW4fvZI0W5dHyi(
      filenamePrefix: 'checklist',
      build: () => EtpChecklistPdf.build(
        definition: ReportsCatalog.checklistEtp,
        draft: draft,
      ),
    );
  }

  ChecklistReportDefinition _s4VjK5MMu4BzCYQWI8zZO({
    required String funcionForm,
    required String checklistNombre,
  }) {
    final kind = _resolveKindForChecklist(
      funcionForm: funcionForm,
      checklistNombre: checklistNombre,
    );
    if (kind == _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ) {
      return ReportsCatalog.mantenimientoMostrador;
    }
    return ReportsCatalog.mantenimientoSites;
  }

  Future<void> _kIkIrW4fvZI0W5dHyi({
    required String filenamePrefix,
    required Future<Uint8List> Function() build,
  }) async {
    if (_sBbz) return;
    setState(() => _sBbz = true);

    try {
      final bytes = await build();
      final filename =
          '${filenamePrefix}_${widget.qsQyRlEYj.id}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      final pdf = GeneratedPdf(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        filename: filename,
        localPath: file.path,
        createdAt: DateTime.now(),
        createdByUserId: user?.id ?? '',
        createdByName: user?.nombre ?? '',
        area: user?.area ?? '',
        gerenciaId: user?.resolvedGerenciaId,
        source: 'checklist',
        jefaturaId: widget.g6e7CskfGn,
        checklistId: widget.qsQyRlEYj.id,
        checklistNombre: widget.qsQyRlEYj.nombre,
      );

      await ref.read(generatedPdfRepositoryProvider).add(pdf);
      setState(() => _j1Om = pdf);

      if (user != null && user.id.trim().isNotEmpty) {
        final tarea = Tarea(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          reporteId: 'checklist:${widget.qsQyRlEYj.id}',
          titulo: pdf.filename,
          descripcion: pdf.filename,
          creadoPor: user.id,
          asignadoA: user.id,
          estado: TareaEstado.pendiente,
        );
        await ref.read(tareaControllerProvider).crearTarea(tarea);
      }

      await PdfFileService.openFile(file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo generar PDF: $e')));
    } finally {
      if (mounted) setState(() => _sBbz = false);
    }
  }

  Future<void> _aLd5gJ4h() async {
    final pdf =
        _j1Om ??
        ref
            .read(generatedPdfRepositoryProvider)
            .latestForChecklist(
              jefaturaId: widget.g6e7CskfGn,
              checklistId: widget.qsQyRlEYj.id,
            );

    if (pdf == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Primero genera el PDF')));
      return;
    }

    if (!await LanGate.isOnLan()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subida disponible solo en LAN corporativa'),
        ),
      );
      return;
    }

    final file = File(pdf.localPath);
    if (!await file.exists()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se encontró el archivo local del PDF'),
        ),
      );
      return;
    }

    setState(() => _sBbz = true);
    try {
      final user = ref.read(authControllerProvider).user;
      final url = await ref
          .read(pdfUploadApiRepositoryProvider)
          .uploadPdf(
            file: file,
            filename: pdf.filename,
            metadata: {
              'usuarioId': user?.id,
              'usuarioNombre': user?.nombre,
              'area': user?.area,
              'gerenciaId': user?.resolvedGerenciaId,
              'jefaturaId': widget.g6e7CskfGn,
              'checklistId': widget.qsQyRlEYj.id,
              'checklistNombre': widget.qsQyRlEYj.nombre,
              'source': 'checklist',
            }..removeWhere((_, v) => v == null),
          );

      await ref
          .read(generatedPdfRepositoryProvider)
          .markUploaded(id: pdf.id, url: url);
      ref.invalidate(generatedPdfsProvider);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('PDF subido correctamente')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo subir PDF: $e')));
    } finally {
      if (mounted) setState(() => _sBbz = false);
    }
  }
}

enum _OmdH2VF3IXjjv { jfyHnNDqyQ, hTcocd4wcHMS5ZZ, oi2, lxkETqF }

String _normalizeToken(String text) {
  final raw = text.trim().toLowerCase();
  return raw.replaceAll(RegExp(r'[^a-z0-9]+'), '');
}

_OmdH2VF3IXjjv _resolveKind(String funcionForm) {
  final f = _normalizeToken(funcionForm);
  if (f.isEmpty) return _OmdH2VF3IXjjv.lxkETqF;
  if (f.contains('etp')) return _OmdH2VF3IXjjv.oi2;

  if (f.contains('mostra') ||
      f.contains('mostrador') ||
      f.contains('mostradores')) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  if (f.contains('site') || f.contains('sites')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  if (f.contains('telecomm') || f.contains('telecom') || f.contains('telco')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  if (f.contains('mantto') ||
      f.contains('mantenimiento') ||
      f.contains('mntto')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  return _OmdH2VF3IXjjv.lxkETqF;
}

_OmdH2VF3IXjjv _resolveKindForChecklist({
  required String funcionForm,
  required String checklistNombre,
}) {
  final kind = _resolveKind(funcionForm);
  final name = _normalizeToken(checklistNombre);

  final isGenericMantto =
      _normalizeToken(funcionForm).contains('mantto') ||
      _normalizeToken(funcionForm).contains('mantenimiento') ||
      _normalizeToken(funcionForm).contains('mntto');
  final nameSaysMostrador =
      name.contains('mostra') ||
      name.contains('mostrador') ||
      name.contains('mostradores');

  if (kind == _OmdH2VF3IXjjv.jfyHnNDqyQ &&
      isGenericMantto &&
      nameSaysMostrador) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  if (kind == _OmdH2VF3IXjjv.lxkETqF && nameSaysMostrador) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  return kind;
}

enum TmFstXFl2 {
  o14gHjvZ,
  sUXQy7BNP,
  s8cS9fN8yAl9,
  uvp7RkNl7n,
}

class DodDD90r3gJZxz {
  static Future<File> oPAtT1olYR({
    required Uint8List bytes,
    required String filename,
  }) async {
    final dir = await getTemporaryDirectory();
    final safeName = filename.endsWith('.pdf') ? filename : '$filename.pdf';
    final file = File(p.join(dir.path, safeName));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<File> vSmjrVTKAfq68hw({
    required Uint8List bytes,
    required String filename,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final safeName = filename.endsWith('.pdf') ? filename : '$filename.pdf';
    final outDir = Directory(p.join(dir.path, 'pdfs'));
    if (!await outDir.exists()) {
      await outDir.create(recursive: true);
    }
    final file = File(p.join(outDir.path, safeName));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<void> uRiUlccl(File file) async {
    await OpenFile.open(file.path);
  }
}

class QWCZ3N0WsPSm3nzS471lGJ {
  final AppDatabase ao;

  const QWCZ3N0WsPSm3nzS471lGJ(this.ao);

  Future<void> qvYYb({
    required String? tipo,
    required String titulo,
    required String mensaje,
    required String? referenciaId,
  }) async {
    await ao
        .into(ao.notificationsTable)
        .insert(
          NotificationsTableCompanion.insert(
            id: const Uuid().v4(),
            tipo: Value(tipo ?? ''),
            titulo: titulo,
            mensaje: mensaje,
            leida: Value(false),
          ),
        );
  }

  Future<List<Notificacion>> i4FxSFR078Yc() async {
    final query = ao.select(ao.notificationsTable)
      ..orderBy([(t) => OrderingTerm.desc(t.fecha)]);

    final rows = await query.get();

    return rows
        .map(
          (n) => Notificacion(
            id: n.id,
            tipo: NotificacionTipo.values.byName(n.tipo),
            titulo: n.titulo,
            mensaje: n.mensaje,
            creadaEn: n.fecha,
            leida: n.leida,
          ),
        )
        .toList();
  }

  Future<void> yaZTqv7rCTO(String id) async {
    await (ao.update(
      ao.notificationsTable,
    )..where((n) => n.id.equals(id))).write(
      const NotificationsTableCompanion(
        leida: Value(true),
      ),
    );
  }

  Future<void> oUDv0lXSB6XiKCCU2() async {
    await ao
        .update(ao.notificationsTable)
        .write(
          const NotificationsTableCompanion(
            leida: Value(true),
          ),
        );
  }

  Future<int> iXZ9aJVkinfrb3() async {
    final query = ao.select(ao.notificationsTable)
      ..where((n) => n.leida.equals(false));

    final rows = await query.get();
    return rows.length;
  }

  Stream<int> uucXE1bFuCMrU() {
    final query = ao.select(ao.notificationsTable)
      ..where((n) => n.leida.equals(false));

    return query.watch().map((rows) => rows.length);
  }
}

final syncServiceProvider = Provider<QDP06pvJjGc>((ref) {
  return QDP06pvJjGc(
    f3: ref.read(appDatabaseProvider),
    jJP: ref.read(dioProvider),
    cr3TaX0: ref.read(sessionManagerProvider),
  );
});

final syncWorkerProvider = Provider<LKUO7gQ6CD>((ref) {
  return LKUO7gQ6CD(
    tz: ref.read(appDatabaseProvider),
    iSLajur: ref.read(syncServiceProvider),
    vqn2Ij6l7vO3Tqq1: ref.read(notificacionRepositoryProvider),
  );
});

final syncListenerProvider = Provider<void>((ref) {
  Timer? timer;
  LanStatus? lastStatus;

  ref.onDispose(() {
    timer?.cancel();
  });

  void ensureTimerRunning() {
    timer ??= Timer.periodic(
      const Duration(seconds: 10),
      (_) => ref.read(syncWorkerProvider).bNa(LanStatus.connected),
    );
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  ref.listen<AsyncValue<LanStatus>>(lanStatusProvider, (prev, next) {
    next.whenData((status) {
      if (status == lastStatus) return;
      lastStatus = status;

      if (status == LanStatus.connected) {
        ref.read(syncWorkerProvider).bNa(status);
        ensureTimerRunning();
        return;
      }

      stopTimer();
    });
  });
});

class FHwWWNhl4p5UW extends ConsumerWidget {
  const FHwWWNhl4p5UW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(dashboardMetricsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: metrics.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error: $e'),
        data: (m) => Column(
          children: [
            _vbGv('Reportes abiertos', m.reportesAbiertos),
            _vbGv('Reportes cerrados', m.reportesCerrados),
            _vbGv('Tareas pendientes', m.tareasPendientes),
            _vbGv('Evidencias hoy', m.evidenciasHoy),
          ],
        ),
      ),
    );
  }

  Widget _vbGv(String label, int value) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text('$value'),
      ),
    );
  }
}

class HWjJ9fwI2ihQtU {
  static Future<bool> z6yfpc() async {
    final antiTamperOk = await AntiTamperGuard.verify();
    if (!antiTamperOk) return false;

    if (_soMkifR()) return true;

    if (await _rcgQyCsNle()) return false;

    if (_sbiuJImUkgnQFqbSjmu9T7()) return false;

    return true;
  }

  static bool _soMkifR() {
    bool debug = false;
    assert(() {
      debug = true;
      return true;
    }());
    return debug;
  }

  static Future<bool> _rcgQyCsNle() async {
    if (!Platform.isAndroid) return false;

    final androidProps = [
      'generic',
      'emulator',
      'sdk',
      'x86',
      'goldfish',
    ];

    final fingerprint = Platform.environment['ANDROID_BUILD_FINGERPRINT'] ?? '';

    return androidProps.any(
      (p) => fingerprint.toLowerCase().contains(p),
    );
  }

  static bool _sbiuJImUkgnQFqbSjmu9T7() {
    final suspicious = [
      'frida',
      'substrate',
      'xposed',
    ];

    for (final lib in suspicious) {
      if (Platform.environment.keys.any((k) => k.toLowerCase().contains(lib))) {
        return true;
      }
    }
    return false;
  }
}

class QDP06pvJjGc {
  final AppDatabase f3;
  final Dio jJP;
  final SessionManager cr3TaX0;

  QDP06pvJjGc({required this.f3, required this.jJP, required this.cr3TaX0});

  Future<Response<dynamic>> _xXtF0ovJ2ruRnzTIQHktmQulepu(
    String endpoint, {
    required dynamic data,
    Options? options,
  }) async {
    final normalized = endpoint.startsWith('/')
        ? endpoint.substring(1)
        : endpoint;

    try {
      return await jJP.post(normalized, data: data, options: options);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = jJP.options.baseUrl;
      if (status != 404) rethrow;

      if (baseUrl.endsWith('/api') && !normalized.startsWith('api/')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi/$normalized');
        return await jJP.postUri(uri, data: data, options: options);
      }

      if (!baseUrl.endsWith('/api') && !normalized.startsWith('api/')) {
        return await jJP.post('api/$normalized', data: data, options: options);
      }

      rethrow;
    }
  }

  Future<void> h08wM6fRLIWIW5(int asistenciaId) async {
    final asistencia = await (f3.select(
      f3.asistenciaTable,
    )..where((a) => a.id.equals(asistenciaId))).getSingle();

    await jJP.post(
      '/asistencia',
      data: {
        'usuarioId': asistencia.usuarioId,
        'fechaHora': asistencia.fechaHora.toIso8601String(),
        'tipo': asistencia.tipo,
        'metodo': asistencia.metodo,
      },
    );

    await (f3.update(f3.asistenciaTable)
          ..where((a) => a.id.equals(asistenciaId)))
        .write(const AsistenciaTableCompanion(sincronizado: Value(true)));
  }

  Future<void> qo76KwulDFyK9L(Map<String, dynamic> payload) async {
    await jJP.post('/glpi/tickets', data: payload);
  }

  Future<Response<dynamic>?> lG81qUjek0bPsniw7WpwY0P(
    Map<String, dynamic> payload,
  ) async {
    final id = payload['id']?.toString();
    final modo = payload['modo']?.toString();
    if (id == null || id.isEmpty || modo == null || modo.isEmpty) {
      throw StateError('Payload de combustible incompleto: $payload');
    }

    Response<dynamic>? lastResponse;

    if (modo == 'usar_vehiculo') {
      lastResponse = await _fBnkNgwXLrsgN2QcfO9yx(payload);
    } else if (modo == 'cargar_combustible') {
      lastResponse = await _lwTxAvRPRJ8B7cQD9RSfqh9Gvw(payload);
    } else {
      throw StateError('Modo de combustible no soportado: $modo');
    }

    return lastResponse;
  }

  Future<Response<dynamic>> _fBnkNgwXLrsgN2QcfO9yx(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? u9YiAfMnzUBL(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? jSjNmDnqzt(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? kp5RVqOx8BJhg(String? raw) {
      if (raw == null) return null;
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return null;
      final hhmm = RegExp(r'^\d{1,2}:\d{2}$');
      if (hhmm.hasMatch(trimmed)) return trimmed;
      final timeMatch = RegExp(r'(\d{1,2}):(\d{2})').firstMatch(trimmed);
      if (timeMatch == null) return trimmed;
      final hour = int.tryParse(timeMatch.group(1)!);
      final minute = int.tryParse(timeMatch.group(2)!);
      if (hour == null || minute == null) return trimmed;
      final suffix = trimmed
          .toLowerCase()
          .replaceAll('.', '')
          .replaceAll(' ', '')
          .replaceAll('\u00a0', '');
      if (!suffix.endsWith('am') && !suffix.endsWith('pm')) return trimmed;
      var h = hour % 12;
      if (suffix.endsWith('pm')) {
        h += 12;
      }
      final hh = h.toString().padLeft(2, '0');
      final mm = minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    String? jYQzheoONkaP() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = jYQzheoONkaP();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para uso de vehículo.');
    }

    final horaIni = kp5RVqOx8BJhg(jSjNmDnqzt('horaInicio'));
    final horaFin = kp5RVqOx8BJhg(jSjNmDnqzt('horaFinal'));

    final fotoIni = u9YiAfMnzUBL('fotosRegistroInicial');
    final fotoFin = u9YiAfMnzUBL('fotosRegistroFinal');
    if (fotoIni == null || fotoFin == null) {
      throw StateError('Se requieren fotos inicial y final.');
    }
    if (!await File(fotoIni).exists() || !await File(fotoFin).exists()) {
      throw StateError('No se encontraron fotos para subir.');
    }

    final form = FormData();
    form.fields.addAll([
      if (jSjNmDnqzt('nombre') != null)
        MapEntry('conductor', jSjNmDnqzt('nombre')!),
      if (jSjNmDnqzt('destino') != null)
        MapEntry('destino', jSjNmDnqzt('destino')!),
      if (horaIni != null) MapEntry('hora_inicio', horaIni),
      if (jSjNmDnqzt('combustibleInicial') != null)
        MapEntry('nivel_combustible', jSjNmDnqzt('combustibleInicial')!),
      if (payload['kilometrajeInicial'] != null)
        MapEntry(
          'kilometraje_inicial',
          payload['kilometrajeInicial'].toString(),
        ),
      if (horaFin != null) MapEntry('hora_final', horaFin),
      if (payload['kilometrajeFinal'] != null)
        MapEntry('kilometraje_final', payload['kilometrajeFinal'].toString()),
      MapEntry('vehiculo', vehiculo),
      if (payload['gerenciaId'] != null)
        MapEntry('gerenciaId', payload['gerenciaId'].toString()),
    ]);

    form.files.addAll([
      MapEntry('foto_km_inicial', await MultipartFile.fromFile(fotoIni)),
      MapEntry('foto_km_final', await MultipartFile.fromFile(fotoFin)),
    ]);

    try {
      return await jJP.post('/uso-car-tics/upload', data: form);
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
      return await _jmgdmpD2R1RCT1aYUVXPQUflV(payload);
    }
  }

  Future<Response<dynamic>> _lwTxAvRPRJ8B7cQD9RSfqh9Gvw(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? y6bBfGpNCJI1(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? ts2u4Oykdk(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? tffHpMjZtLOI() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = tffHpMjZtLOI();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para cargar combustible.');
    }

    final fotoKmAntes = y6bBfGpNCJI1('fotosKmAntes');
    final fotoKmDespues = y6bBfGpNCJI1('fotosKmDespues');
    final fotoTicket = y6bBfGpNCJI1('fotosTicket');
    if (fotoKmAntes == null || fotoKmDespues == null || fotoTicket == null) {
      throw StateError('Se requieren fotos antes, después y ticket.');
    }
    if (!await File(fotoKmAntes).exists() ||
        !await File(fotoKmDespues).exists() ||
        !await File(fotoTicket).exists()) {
      throw StateError('No se encontraron fotos para subir.');
    }

    final form = FormData();
    form.fields.addAll([
      if (ts2u4Oykdk('operador') != null)
        MapEntry('operador', ts2u4Oykdk('operador')!),
      if (payload['kmAntes'] != null)
        MapEntry('km_bf_carga', payload['kmAntes'].toString()),
      if (payload['kmDespues'] != null)
        MapEntry('km_af_carga', payload['kmDespues'].toString()),
      MapEntry('vehiculo', vehiculo),
      if (payload['gerenciaId'] != null)
        MapEntry('gerenciaId', payload['gerenciaId'].toString()),
    ]);

    form.files.addAll([
      MapEntry('foto_km_bf', await MultipartFile.fromFile(fotoKmAntes)),
      MapEntry('foto_km_af', await MultipartFile.fromFile(fotoKmDespues)),
      MapEntry('foto_ticket', await MultipartFile.fromFile(fotoTicket)),
    ]);

    try {
      return await jJP.post('/carga-car-tics/upload', data: form);
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
      return await _sMxPTGAhd5HaooTSUyCRxAlo0h3GQg(payload);
    }
  }

  Future<Response<dynamic>> _jmgdmpD2R1RCT1aYUVXPQUflV(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? omX0TumuMQGz(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? dKpQ2eeyfe(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? mKwYLiyE0wRkQ(String? raw) {
      if (raw == null) return null;
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return null;
      final hhmm = RegExp(r'^\d{1,2}:\d{2}$');
      if (hhmm.hasMatch(trimmed)) return trimmed;
      final timeMatch = RegExp(r'(\d{1,2}):(\d{2})').firstMatch(trimmed);
      if (timeMatch == null) return trimmed;
      final hour = int.tryParse(timeMatch.group(1)!);
      final minute = int.tryParse(timeMatch.group(2)!);
      if (hour == null || minute == null) return trimmed;
      final suffix = trimmed
          .toLowerCase()
          .replaceAll('.', '')
          .replaceAll(' ', '')
          .replaceAll('\u00a0', '');
      if (!suffix.endsWith('am') && !suffix.endsWith('pm')) return trimmed;
      var h = hour % 12;
      if (suffix.endsWith('pm')) {
        h += 12;
      }
      final hh = h.toString().padLeft(2, '0');
      final mm = minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    String? nmQI3A2piBJg() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = nmQI3A2piBJg();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para uso de vehículo.');
    }

    final data = <String, dynamic>{
      'vehiculo': vehiculo,
      'conductor': dKpQ2eeyfe('nombre'),
      'destino': dKpQ2eeyfe('destino'),
      'hora_inicio': mKwYLiyE0wRkQ(dKpQ2eeyfe('horaInicio')),
      'nivel_combustible': dKpQ2eeyfe('combustibleInicial'),
      'kilometraje_inicial': payload['kilometrajeInicial']?.toString(),
      'foto_km_inicial': await _nlKJE7JpVRZMwB(
        omX0TumuMQGz('fotosRegistroInicial'),
        'uso_ini',
      ),
      'hora_final': mKwYLiyE0wRkQ(dKpQ2eeyfe('horaFinal')),
      'kilometraje_final': payload['kilometrajeFinal']?.toString(),
      'foto_km_final': await _nlKJE7JpVRZMwB(
        omX0TumuMQGz('fotosRegistroFinal'),
        'uso_fin',
      ),
      if (payload['gerenciaId'] != null) 'gerenciaId': payload['gerenciaId'],
    }..removeWhere((_, v) => v == null || v.toString().trim().isEmpty);

    return await jJP.post('/uso-car-tics', data: data);
  }

  Future<Response<dynamic>> _sMxPTGAhd5HaooTSUyCRxAlo0h3GQg(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? nHYgBQJp9ird(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? ouHFHSVVRo(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? axtPv5hmsRA0() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = axtPv5hmsRA0();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para cargar combustible.');
    }

    final data = <String, dynamic>{
      'operador': ouHFHSVVRo('operador'),
      'km_bf_carga': payload['kmAntes']?.toString(),
      'foto_km_bf': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosKmAntes'),
        'carga_bf',
      ),
      'km_af_carga': payload['kmDespues']?.toString(),
      'foto_km_af': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosKmDespues'),
        'carga_af',
      ),
      'vehiculo': vehiculo,
      'foto_ticket': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosTicket'),
        'carga_ticket',
      ),
      if (payload['gerenciaId'] != null) 'gerenciaId': payload['gerenciaId'],
    }..removeWhere((_, v) => v == null || v.toString().trim().isEmpty);

    return await jJP.post('/carga-car-tics', data: data);
  }

  Future<String?> _nlKJE7JpVRZMwB(String? path, String prefix) async {
    if (path == null) return null;
    final file = File(path);
    if (!await file.exists()) return null;
    const maxBytes = 900 * 1024;
    final len = await file.length();
    if (len <= maxBytes) {
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    }

    try {
      final tempDir = await getTemporaryDirectory();
      final ext = p.extension(path).toLowerCase();
      final targetPath = p.join(
        tempDir.path,
        '${prefix}_${DateTime.now().millisecondsSinceEpoch}$ext',
      );

      Future<Uint8List?> fjXSBNGD1P(int quality, int size) async {
        return FlutterImageCompress.compressWithFile(
          path,
          quality: quality,
          minWidth: size,
          minHeight: size,
          format: CompressFormat.jpeg,
        );
      }

      final attempts = <(int quality, int size)>[
        (70, 1600),
        (60, 1400),
        (50, 1200),
        (40, 1000),
      ];

      Uint8List? best;
      for (final (q, s) in attempts) {
        final bytes = await fjXSBNGD1P(q, s);
        if (bytes == null || bytes.isEmpty) continue;
        best = bytes;
        if (bytes.lengthInBytes <= maxBytes) break;
      }

      if (best != null && best.isNotEmpty) {
        await File(targetPath).writeAsBytes(best, flush: true);
        return base64Encode(best);
      }
    } catch (_) {}

    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> ptNXLFqxsUl(Map<String, dynamic> payload) async {
    final creadorId =
        (payload['creadorId'] ?? payload['creadoPor'] ?? payload['usuarioId'])
            as String?;
    final usuarioId =
        (payload['usuarioId'] ?? payload['creadorId'] ?? payload['creadoPor'])
            as String?;

    final data = <String, dynamic>{
      'id': payload['id'],
      'titulo': payload['titulo'],
      'descripcion': payload['descripcion'],
      'area': payload['area'],
      'estado': payload['estado'],
      'creadorId': creadorId,
      'usuarioId': usuarioId,
    }..removeWhere((_, v) => v == null);

    await jJP.post('/reportes', data: data);
  }

  Future<void> dVKGFEmJTtoD4I7suGy8n(Map<String, dynamic> payload) async {
    final data = <String, dynamic>{
      'id': payload['id'],
      'reporteId': payload['reporteId'],
      'usuarioId': payload['usuarioId'] ?? payload['autorId'],
      'mensaje': payload['mensaje'],
    }..removeWhere((_, v) => v == null);

    await jJP.post('/reportes/comentarios', data: data);
  }

  Future<void> d7Pzjj0Rp74UGXxDNEr(Map<String, dynamic> payload) async {
    final data = <String, dynamic>{
      'id': payload['id'],
      'tareaId': payload['tareaId'],
      'usuarioId': payload['usuarioId'] ?? payload['autorId'],
      'mensaje': payload['mensaje'],
    }..removeWhere((_, v) => v == null);

    await _xXtF0ovJ2ruRnzTIQHktmQulepu('/tareas/comentarios', data: data);
  }

  Future<void> gDNtocqDuonYqPHe(Map<String, dynamic> payload) async {
    final filePath = payload['localPath'] as String;

    final formData = FormData.fromMap({
      'id': payload['id'],
      'tareaId': payload['tareaId'],
      'tipo': payload['tipo'],
      'nombre': payload['nombre'],
      'file': await MultipartFile.fromFile(filePath),
    });

    final resp = await _xXtF0ovJ2ruRnzTIQHktmQulepu(
      '/tareas/adjuntos',
      data: formData,
    );

    final data = resp.data;
    if (data is Map) {
      final url = (data['url'] ?? data['remoteUrl'])?.toString();
      if (url != null && url.isNotEmpty) {
        await (f3.update(f3.tareaAdjuntosTable)
              ..where((a) => a.id.equals(payload['id'] as String)))
            .write(TareaAdjuntosTableCompanion(remoteUrl: Value(url)));
      }
    }
  }

  Future<void> kyyFARPSE1WnMMB(Map<String, dynamic> payload) async {
    final id = payload['id']?.toString();
    final estado = payload['estado']?.toString();
    if (id == null || id.isEmpty || estado == null || estado.isEmpty) {
      throw StateError('Payload de estado incompleto: $payload');
    }

    final baseUrl = jJP.options.baseUrl;
    final endpoint = '/tareas/estado';
    if (baseUrl.endsWith('/api')) {
      final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
      final uri = Uri.parse('$baseWithoutApi$endpoint');
      await jJP.postUri(uri, data: {'id': id, 'estado': estado});
      return;
    }

    await jJP.post(endpoint, data: {'id': id, 'estado': estado});
  }

  Future<void> aCg3viF3f2Bwm4w0qcYz(Map<String, dynamic> payload) async {
    final filePath = payload['localPath'] as String;

    final formData = FormData.fromMap({
      'id': payload['id'],
      'reporteId': payload['reporteId'],
      'tipo': payload['tipo'],
      'nombre': payload['nombre'],
      'file': await MultipartFile.fromFile(filePath),
    });

    await jJP.post('/reportes/evidencias', data: formData);
  }

  Future<Map<String, dynamic>?> eF2GZvl2a(Map<String, dynamic> payload) async {
    bool f6Ia0XzGMiFF(int? code) => code == 409;

    Future<Response<dynamic>> yi8hPdaFuL7gHGhb1XAiQWdsGif(
      String endpoint, {
      required Map<String, dynamic> data,
    }) async {
      return _xXtF0ovJ2ruRnzTIQHktmQulepu(endpoint, data: data);
    }

    String iClKIHMdErPtjSi(String raw) {
      return switch (raw) {
        'enProceso' => 'en_proceso',
        'en_progreso' => 'en_progreso',
        _ => raw,
      };
    }

    final titulo = payload['titulo'] as String?;
    final estadoRaw = payload['estado'] as String?;
    final descripcionRaw = (payload['descripcion'] as String?) ?? '';
    final asignadoA = payload['asignadoA'] as String?;

    if (titulo == null || titulo.trim().isEmpty) {
      throw StateError('Payload de tarea incompleto (titulo): $payload');
    }

    final estado = iClKIHMdErPtjSi(estadoRaw ?? 'pendiente');
    final descripcion = descripcionRaw.trim().isEmpty
        ? titulo.trim()
        : descripcionRaw.trim();

    final usuarioAsignado =
        (payload['usuario_asignado'] ?? asignadoA) as String?;
    if (usuarioAsignado == null || usuarioAsignado.isEmpty) {
      throw StateError(
        'Payload de tarea incompleto (usuario_asignado): $payload',
      );
    }

    final legacyData = <String, dynamic>{
      'titulo': titulo,
      if (descripcion.isNotEmpty) 'descripcion': descripcion,
      'estatus': estado,
      'usuario_asignado': usuarioAsignado,
      if (payload['fecha_limite'] != null)
        'fecha_limite': payload['fecha_limite'],
    }..removeWhere((_, v) => v == null);

    final legacyEndpoints = <String>['/tareas'];

    DioException? last;
    for (final ep in legacyEndpoints) {
      try {
        print('[SYNC] POST $ep (legacy tarea) data=$legacyData');
        final response = await yi8hPdaFuL7gHGhb1XAiQWdsGif(
          ep,
          data: legacyData,
        );
        print('[SYNC] POST $ep (legacy tarea) -> OK');
        final data = response.data;
        return (data is Map<String, dynamic>) ? data : null;
      } on DioException catch (e) {
        print(
          '[SYNC] POST $ep (legacy tarea) -> ${e.response?.statusCode} ${e.message} body=${e.response?.data}',
        );
        if (f6Ia0XzGMiFF(e.response?.statusCode)) return null;
        last = e;
      }
    }
    if (last != null) throw last;
    return null;
  }
}

class M6omIvOuQ7Miovopq4WaturEj extends Table {
  TextColumn get f1aZPcGIB => text()();
  TextColumn get fODYhv => text()();
  TextColumn get q3z => text()();

  @override
  Set<Column> get primaryKey => {f1aZPcGIB, fODYhv};
}

class TwmDvGjPWAbsR {
  final bool m9oFNzpgDqoJblwa;
  final bool lUdiDMpH;
  final bool keRW229tOX;

  const TwmDvGjPWAbsR({
    required this.m9oFNzpgDqoJblwa,
    required this.lUdiDMpH,
    required this.keRW229tOX,
  });
}

final checkListRepositoryProvider = Provider<CheckListApiRepository>((ref) {
  return CheckListApiRepository(dio: ref.read(dioProvider));
});

final jefaturasProvider = FutureProvider<List<Jefatura>>((ref) async {
  final auth = ref.watch(authControllerProvider);
  final user = auth.user;

  final gerenciaId = user?.resolvedGerenciaId;

  return ref
      .read(checkListRepositoryProvider)
      .obtenerJefaturas(gerenciaId: gerenciaId);
});

final clExistentesPorJefaturaProvider =
    FutureProvider.family<List<ChecklistExistente>, int>((
      ref,
      jefaturaId,
    ) async {
      final auth = ref.watch(authControllerProvider);
      final user = auth.user;

      final gerenciaId = user?.resolvedGerenciaId;

      return ref
          .read(checkListRepositoryProvider)
          .obtenerClExistentes(jefaturaId: jefaturaId, gerenciaId: gerenciaId);
    });

class NotificacionRepository {
  final AppDatabase db;

  const NotificacionRepository(this.db);

  Future<void> crear({
    required String? tipo,
    required String titulo,
    required String mensaje,
    required String? referenciaId,
  }) async {
    await db
        .into(db.notificationsTable)
        .insert(
          NotificationsTableCompanion.insert(
            id: const Uuid().v4(),
            tipo: Value(tipo ?? ''),
            titulo: titulo,
            mensaje: mensaje,
            leida: Value(false),
          ),
        );
  }

  Future<List<Notificacion>> obtenerTodas() async {
    final query = db.select(db.notificationsTable)
      ..orderBy([(t) => OrderingTerm.desc(t.fecha)]);

    final rows = await query.get();

    return rows
        .map(
          (n) => Notificacion(
            id: n.id,
            tipo: NotificacionTipo.values.byName(n.tipo),
            titulo: n.titulo,
            mensaje: n.mensaje,
            creadaEn: n.fecha,
            leida: n.leida,
          ),
        )
        .toList();
  }

  Future<void> marcarLeida(String id) async {
    await (db.update(
      db.notificationsTable,
    )..where((n) => n.id.equals(id))).write(
      const NotificationsTableCompanion(
        leida: Value(true),
      ),
    );
  }

  Future<void> marcarTodasLeidas() async {
    await (db.update(
      db.notificationsTable,
    )..where((n) => n.leida.equals(false))).write(
      const NotificationsTableCompanion(
        leida: Value(true),
      ),
    );
  }

  Future<int> contarNoLeidas() async {
    final query = db.select(db.notificationsTable)
      ..where((n) => n.leida.equals(false));

    final rows = await query.get();
    return rows.length;
  }

  Stream<int> watchNoLeidas() {
    final query = db.select(db.notificationsTable)
      ..where((n) => n.leida.equals(false));

    return query.watch().map((rows) => rows.length);
  }
}

final reporteRepositoryProvider = Provider<ReporteRepository>((ref) {
  return ReporteRepositoryImpl(
    db: ref.read(appDatabaseProvider),
    dio: ref.read(dioProvider),
  );
});

final reporteControllerProvider =
    StateNotifierProvider<Xura32lRWpuixuMRU, AsyncValue<List<Reporte>>>(
      (ref) => Xura32lRWpuixuMRU(
        ref.read(reporteRepositoryProvider),
        ref.read(notificacionRepositoryProvider),
      ),
    );

final reportePorIdProvider = FutureProvider.family<Reporte, String>((
  ref,
  id,
) async {
  final repo = ref.read(reporteRepositoryProvider);
  final all = await repo.obtenerReportes();
  return all.firstWhere((r) => r.id == id);
});

class FkEyrbbzxWi8ot92tX extends Table {
  TextColumn get vP => text()();
  TextColumn get qRHtWp8 => text()();

  TextColumn get bMc2 => text()();

  TextColumn get nPMyMr => text()();
  TextColumn get eW08p7uUz => text()();
  TextColumn get oZsPNvga => text().nullable()();
  TextColumn get m0br3yhQ5 => text().nullable()();
  DateTimeColumn get dCJLg8oA => dateTime()();

  @override
  Set<Column> get primaryKey => {vP};
}

int adaptiveCrossAxisCount(double width) {
  if (width >= 1200) return 6;
  if (width >= 900) return 4;
  if (width >= 600) return 3;
  return 2;
}

class ETh6L6qff0BrwFJ7 extends StatefulWidget {
  final TOrYuZvGOIatVhQ7HHjUs5 hBsWGTPeee;
  final String uPRD7fZN;
  final String fuk9FreG7PKP8;

  final ValueChanged<NfW2LWZq2KjvbSa3C> bilLSzKS;

  const ETh6L6qff0BrwFJ7({
    super.key,
    required this.hBsWGTPeee,
    required this.uPRD7fZN,
    required this.fuk9FreG7PKP8,
    required this.bilLSzKS,
  });

  @override
  State<ETh6L6qff0BrwFJ7> createState() => _HGdkmsxvkNNZXOfWZCb55();
}

class _HGdkmsxvkNNZXOfWZCb55 extends State<ETh6L6qff0BrwFJ7> {
  late final List<bool> _f70Kr;
  late final List<bool> _wVl;
  late final List<bool> _kQn27Jbh;
  late final List<TextEditingController> _yGcaCAJfu;
  late final List<TextEditingController> _l9mPPe5BBgrzx;

  @override
  void initState() {
    super.initState();
    final n = widget.hBsWGTPeee.r6U77.length;
    _f70Kr = List<bool>.filled(n, false);
    _wVl = List<bool>.filled(n, false);
    _kQn27Jbh = List<bool>.filled(n, false);
    _yGcaCAJfu = List.generate(n, (_) => TextEditingController());
    _l9mPPe5BBgrzx = List.generate(n, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (final c in _yGcaCAJfu) {
      c.dispose();
    }
    for (final c in _l9mPPe5BBgrzx) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionContainer(
          title: widget.hBsWGTPeee.cOAhH,
          subtitle: 'Checklist ETP',
          icon: Icons.fact_check_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: ${widget.uPRD7fZN}'),
              Text('Área: ${widget.fuk9FreG7PKP8}'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(widget.hBsWGTPeee.r6U77.length, (index) {
          final item = widget.hBsWGTPeee.r6U77[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SectionContainer(
              title: 'Punto ${index + 1}',
              subtitle: item.tl0sv,
              icon: Icons.checklist_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    value: _kQn27Jbh[index],
                    onChanged: (v) {
                      final value = v ?? false;
                      setState(() {
                        _kQn27Jbh[index] = value;
                        if (value) {
                          _f70Kr[index] = false;
                          _wVl[index] = false;
                          _l9mPPe5BBgrzx[index].text = 'N/A';
                          _l9mPPe5BBgrzx[index].selection =
                              TextSelection.fromPosition(
                                TextPosition(
                                  offset: _l9mPPe5BBgrzx[index].text.length,
                                ),
                              );
                        } else {
                          if (_l9mPPe5BBgrzx[index].text.trim() == 'N/A') {
                            _l9mPPe5BBgrzx[index].clear();
                          }
                        }
                      });
                    },
                    title: const Text('No aplica'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          value: _f70Kr[index],
                          onChanged: _kQn27Jbh[index]
                              ? null
                              : (v) =>
                                    setState(() => _f70Kr[index] = v ?? false),
                          title: const Text('Cable roto'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CheckboxListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          value: _wVl[index],
                          onChanged: _kQn27Jbh[index]
                              ? null
                              : (v) => setState(() => _wVl[index] = v ?? false),
                          title: const Text('Falla red'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _yGcaCAJfu[index],
                    minLines: 1,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: 'Anomalías'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _l9mPPe5BBgrzx[index],
                    readOnly: _kQn27Jbh[index],
                    minLines: 1,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Observaciones',
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: _zaovMm,
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('Generar PDF'),
        ),
      ],
    );
  }

  void _zaovMm() {
    final answers = <DSNmK1QNCAsvVrsnHK4lUg>[];
    for (var i = 0; i < widget.hBsWGTPeee.r6U77.length; i++) {
      final def = widget.hBsWGTPeee.r6U77[i];
      final obs = _l9mPPe5BBgrzx[i].text.trim();
      answers.add(
        DSNmK1QNCAsvVrsnHK4lUg(
          bZ4FPt: def.jn,
          gFSF1: def.tl0sv,
          ybLGi2BbR: _f70Kr[i],
          myA5Emfw: _wVl[i],
          mKlRFyNhx: _yGcaCAJfu[i].text.trim(),
          aBEipUYKaEqit: _kQn27Jbh[i] && obs.isEmpty ? 'N/A' : obs,
        ),
      );
    }

    widget.bilLSzKS(
      NfW2LWZq2KjvbSa3C(
        jonUKbKxt7pr: widget.hBsWGTPeee.jB,
        aaymfjA3J6G: widget.hBsWGTPeee.cOAhH,
        t3aSr7z2: widget.uPRD7fZN,
        k7YAey0RC6sEJ: widget.fuk9FreG7PKP8,
        qOp52xkYl: DateTime.now(),
        kfQ8o: answers,
      ),
    );
  }
}

class QCAyhDdUmOcfY2VIHVu {
  final AppDatabase ap;

  QCAyhDdUmOcfY2VIHVu(this.ap);

  Future<DashboardMetrics> s1NcpF6m1BYc8S1() async {
    final reportes = await ap.select(ap.reportesTable).get();
    final tareas = await ap.select(ap.tareasTable).get();
    final evidencias = await ap.select(ap.reporteEvidenciasTable).get();

    final now = DateTime.now();

    return DashboardMetrics(
      reportesAbiertos: reportes.where((r) => r.estado != 'resuelto').length,
      reportesCerrados: reportes.where((r) => r.estado == 'resuelto').length,
      tareasPendientes: tareas.where((t) => t.estado != 'completada').length,
      incidenciasCriticas: 0,
      evidenciasHoy: evidencias
          .where(
            (e) =>
                e.creadoEn.year == now.year &&
                e.creadoEn.month == now.month &&
                e.creadoEn.day == now.day,
          )
          .length,
    );
  }
}

class A7ModBQ3DyUTcy extends StatelessWidget {
  final GerenciaTheme nL20Y;
  final String gOCUGqUZ;

  const A7ModBQ3DyUTcy({
    super.key,
    required this.nL20Y,
    required this.gOCUGqUZ,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      padding: EdgeInsets.fromLTRB(24, isTablet ? 32 : 24, 24, 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [nL20Y.colorPrimario, nL20Y.colorSecundario],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(isTablet ? 40 : 32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Hola! 👋',
            style: TextStyle(
              color: Colors.white70,
              fontSize: isTablet ? 20 : 16,
            ),
          ),
          Text(
            gOCUGqUZ,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 32 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class YPr3u6Kvc {
  final AppConfig dsnCNy;

  YPr3u6Kvc(this.dsnCNy);

  String get xIrcCbj =>
      '${dsnCNy.useHttps ? 'https' : 'http'}://${dsnCNy.apiBaseUrl}:${dsnCNy.apiPort}';
}

final notificacionRepositoryProvider = Provider<NotificacionRepository>((ref) {
  return NotificacionRepository(
    ref.read(appDatabaseProvider),
  );
});

final notificacionesProvider = FutureProvider<List<Notificacion>>((ref) {
  return ref.read(notificacionRepositoryProvider).obtenerTodas();
});

final notificacionesNoLeidasCountProvider = StreamProvider<int>((ref) {
  return ref.read(notificacionRepositoryProvider).watchNoLeidas();
});

class UM32rkedXM4fJJA extends Table {
  IntColumn get e8 => integer().autoIncrement()();

  TextColumn get uVjZenoVR => text()();

  DateTimeColumn get drqpLktq0 => dateTime()();

  TextColumn get cnNH =>
      text().check(CustomExpression<bool>("tipo IN ('entrada', 'salida')"))();

  TextColumn get a0DGLK => text().withDefault(const Constant('manual'))();

  BoolColumn get on24yoYmhoDH => boolean().withDefault(const Constant(false))();

  DateTimeColumn get pxyTrSdf => dateTime().withDefault(currentDateAndTime)();
}

class Zy1QHYyt2ixrp90 extends ConsumerStatefulWidget {
  final GerenciaTheme dWOfN;

  const Zy1QHYyt2ixrp90({super.key, required this.dWOfN});

  @override
  ConsumerState<Zy1QHYyt2ixrp90> createState() => _QISmtDZDqmxWhYdIpVPQ();
}

class _QISmtDZDqmxWhYdIpVPQ extends ConsumerState<Zy1QHYyt2ixrp90> {
  String _pxwBWBWontuW = 'usar_vehiculo';
  final ImagePicker _yxqA2F = ImagePicker();

  final List<XFile> _cbZA8TaYgKnD = [];
  final List<XFile> _wZrKJpLU7R3CAo = [];
  final List<XFile> _vmybZ3VSdyy = [];

  final List<XFile> _g4O9joQmGonv3hXMpLmP = [];
  final List<XFile> _ca6von1vUumXHtrfLD = [];

  final _b5JFu7ZL6sHiWkLi = TextEditingController();
  final _tmVVsZqJ7S8AXjldiY = TextEditingController();
  final _wRV5xqcKPQZkMq3dG = TextEditingController();
  final _ymrOmbvZmsYQtip53zJJ = TextEditingController();
  final _xYDX3FM1QUVzmIDAGP7ztPVS9Y6G = TextEditingController();
  final _bCs2HEcLesKbbDfnvPPvfCxaRW5y = TextEditingController();
  final _eL76aAqBDANtwOAAb7I = TextEditingController();
  final _xUUg3VG9boilrwKaQnnkjk3s6H = TextEditingController();
  final _oW1xNeOeXiFysCdsrxgLMNeb3g = TextEditingController();

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

class V71lpKxb1oabSqoeU8E5GS extends Table {
  TextColumn get dA => text()();
  TextColumn get kYPyxSHDW => text()();
  TextColumn get q9WF => text()();
  TextColumn get vLBshm => text()();
  TextColumn get ycbOlajvc => text()();
  TextColumn get gX0lk4IZm => text().nullable()();
  DateTimeColumn get u2qXtEc1 => dateTime()();

  @override
  Set<Column> get primaryKey => {dA};
}

abstract class Zi9OoW82v5JJH {
  Future<bool> cOFT5juRZo0t();
}

class NLu extends ConsumerWidget {
  const NLu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Stack(
          children: const [
            PD5JtSIi(),
            Positioned(left: 0, right: 0, top: 0, child: LanStatusBanner()),
          ],
        ),
      ),
    );
  }
}

class GuTuGdev8tdycwfH8 {
  const GuTuGdev8tdycwfH8();

  Future<JyKCDl3xPcu45E1G> ffw5R({
    required bool hasLan,
  }) async {
    final disabled = await LocalFlags.isAppDisabled();
    if (disabled) {
      final reason = await LocalFlags.getReason();
      return JyKCDl3xPcu45E1G.px8NoMu(
        reason ?? MbEHQlSm7QuXHG.dPNaqxtQQHtz5ugCVCQk,
      );
    }

    return JyKCDl3xPcu45E1G.hnmGyW();
  }
}

final glpiRepositoryProvider = Provider<GlpiRepository>((ref) {
  return GlpiRepositoryImpl(
    db: ref.read(appDatabaseProvider),
  );
});

const _currentEnv = IKhlHRPHkn4MPF.bRe;

String _readDefine(String key) {
  return String.fromEnvironment(key, defaultValue: '').trim();
}

QrcWKMuam _applyOverrides(QrcWKMuam base) {
  final apiBaseUrl = _readDefine('API_BASE_URL');
  final apiPortRaw = _readDefine('API_PORT');
  final useHttpsRaw = _readDefine('USE_HTTPS');
  final glpiBaseUrl = _readDefine('GLPI_BASE_URL');

  final apiPort = int.tryParse(apiPortRaw);
  final useHttps = switch (useHttpsRaw.toLowerCase()) {
    '1' || 'true' || 'yes' => true,
    '0' || 'false' || 'no' => false,
    _ => null,
  };

  return QrcWKMuam(
    aLK: base.aLK,
    lre0xaeol5A2xtH: base.lre0xaeol5A2xtH,
    yvEsMkca7s: apiBaseUrl.isNotEmpty ? apiBaseUrl : base.yvEsMkca7s,
    nXa1YWL: apiPort ?? base.nXa1YWL,
    iPaqsyrv: useHttps ?? base.iPaqsyrv,
    lXXb6wgZCAco: base.lXXb6wgZCAco,
    eRP61H: base.eRP61H,
    dSM4pBPjdVC: glpiBaseUrl.isNotEmpty ? glpiBaseUrl : base.dSM4pBPjdVC,
    ijWnk6vFqfO9: base.ijWnk6vFqfO9,
    ejYboNDRRcKW: base.ejYboNDRRcKW,
    hxRM3fYjRiKhH: base.hxRM3fYjRiKhH,
    v5CqdjIunXt7w2G0: base.v5CqdjIunXt7w2G0,
    gduW6QmUraG3r8Bc: base.gduW6QmUraG3r8Bc,
    jiT2qhvZ: base.jiT2qhvZ,
    twzCpEycwe: base.twzCpEycwe,
  );
}

final appConfigProvider = Provider<QrcWKMuam>((ref) {
  switch (_currentEnv) {
    case IKhlHRPHkn4MPF.bRe:
      return _applyOverrides(devConfig);
    case IKhlHRPHkn4MPF.pa:
      return _applyOverrides(qaConfig);
    case IKhlHRPHkn4MPF.srdE:
      return _applyOverrides(prodConfig);
  }
});

class Q3ORRT7xmyLi {
  final String n4;
  final String tMMKhV3H;
  final String bsgnqUUkv;
  final DateTime e8oZ3Wfig;

  final String ywhq14BTG0b43li;
  final String cqEcENRgqkJSQ;
  final String qddC;
  final int? d2npiuvZvd;

  final int? aMJZYEAeTh;
  final int? zXBUacE2fth;
  final String? zSe38rK9GorypDw;
  final String sjjG55; // 'checklist' | 'reporte'

  final bool k7omPnyS;
  final String? oZbTnA0ey9H;

  const Q3ORRT7xmyLi({
    required this.n4,
    required this.tMMKhV3H,
    required this.bsgnqUUkv,
    required this.e8oZ3Wfig,
    required this.ywhq14BTG0b43li,
    required this.cqEcENRgqkJSQ,
    required this.qddC,
    required this.d2npiuvZvd,
    required this.sjjG55,
    this.aMJZYEAeTh,
    this.zXBUacE2fth,
    this.zSe38rK9GorypDw,
    this.k7omPnyS = false,
    this.oZbTnA0ey9H,
  });

  Map<String, dynamic> nZyuVf() => {
    'id': n4,
    'filename': tMMKhV3H,
    'localPath': bsgnqUUkv,
    'createdAt': e8oZ3Wfig.toIso8601String(),
    'createdByUserId': ywhq14BTG0b43li,
    'createdByName': cqEcENRgqkJSQ,
    'area': qddC,
    'gerenciaId': d2npiuvZvd,
    'jefaturaId': aMJZYEAeTh,
    'checklistId': zXBUacE2fth,
    'checklistNombre': zSe38rK9GorypDw,
    'source': sjjG55,
    'uploaded': k7omPnyS,
    'uploadedUrl': oZbTnA0ey9H,
  };

  static Q3ORRT7xmyLi yOIFNA3A(Map<String, dynamic> json) {
    return Q3ORRT7xmyLi(
      n4: (json['id'] ?? '').toString(),
      tMMKhV3H: (json['filename'] ?? '').toString(),
      bsgnqUUkv: (json['localPath'] ?? '').toString(),
      e8oZ3Wfig:
          DateTime.tryParse((json['createdAt'] ?? '').toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      ywhq14BTG0b43li: (json['createdByUserId'] ?? '').toString(),
      cqEcENRgqkJSQ: (json['createdByName'] ?? '').toString(),
      qddC: (json['area'] ?? '').toString(),
      d2npiuvZvd: _asInt(json['gerenciaId']),
      aMJZYEAeTh: _asInt(json['jefaturaId']),
      zXBUacE2fth: _asInt(json['checklistId']),
      zSe38rK9GorypDw: (json['checklistNombre'] ?? '').toString().isEmpty
          ? null
          : (json['checklistNombre'] ?? '').toString(),
      sjjG55: (json['source'] ?? '').toString(),
      k7omPnyS: json['uploaded'] == true,
      oZbTnA0ey9H: (json['uploadedUrl'] ?? '').toString().isEmpty
          ? null
          : (json['uploadedUrl'] ?? '').toString(),
    );
  }

  Q3ORRT7xmyLi phnNhahU({
    bool? uploaded,
    String? uploadedUrl,
  }) {
    return Q3ORRT7xmyLi(
      n4: n4,
      tMMKhV3H: tMMKhV3H,
      bsgnqUUkv: bsgnqUUkv,
      e8oZ3Wfig: e8oZ3Wfig,
      ywhq14BTG0b43li: ywhq14BTG0b43li,
      cqEcENRgqkJSQ: cqEcENRgqkJSQ,
      qddC: qddC,
      d2npiuvZvd: d2npiuvZvd,
      sjjG55: sjjG55,
      aMJZYEAeTh: aMJZYEAeTh,
      zXBUacE2fth: zXBUacE2fth,
      zSe38rK9GorypDw: zSe38rK9GorypDw,
      k7omPnyS: uploaded ?? this.k7omPnyS,
      oZbTnA0ey9H: uploadedUrl ?? this.oZbTnA0ey9H,
    );
  }
}

int? _asInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  return int.tryParse(v.toString());
}

final reporteEvidenciasRepositoryProvider =
    Provider<ReporteEvidenciasRepository>((ref) {
      return ReporteEvidenciasRepository(
        ref.read(appDatabaseProvider),
      );
    });

final evidenciasPorReporteProvider =
    FutureProvider.family<List<ReporteEvidencia>, String>((
      ref,
      reporteId,
    ) async {
      final db = ref.read(appDatabaseProvider);
      final rows =
          await (db.select(db.reporteEvidenciasTable)
                ..where((e) => e.reporteId.equals(reporteId))
                ..orderBy([(e) => OrderingTerm.desc(e.creadoEn)]))
              .get();

      return rows
          .map(
            (e) => ReporteEvidencia(
              id: e.id,
              reporteId: e.reporteId,
              tipo: EvidenciaTipo.values.byName(e.tipo),
              nombre: e.nombre,
              localPath: e.localPath,
              remoteUrl: e.remoteUrl,
              creadoEn: e.creadoEn,
            ),
          )
          .toList();
    });

class YZ7NFdRNLi55WlgCwtz9jQS1x extends Table {
  TextColumn get gk => text()();
  TextColumn get tiYn2ZQTn => text()();

  TextColumn get nwRh => text()();

  TextColumn get rvTp1k => text().nullable()();
  TextColumn get ibSL46C => text().nullable()();
  TextColumn get tKAxtrCrSx => text().nullable()();
  TextColumn get nBR4gMxYp => text().nullable()();
  TextColumn get qImoTGYqjpgId4hv3U => text().nullable()();
  IntColumn get vT1UTUakaf0Hh5yMFl => integer().nullable()();
  TextColumn get qHXXyAKSuljRSZLM => text().nullable()();
  IntColumn get ecu2KxdVs6r2c4EH => integer().nullable()();

  TextColumn get xqKqRbRs3j => text().nullable()();
  TextColumn get ksg4lu2i => text().nullable()();
  IntColumn get jmWoO2d => integer().nullable()();
  IntColumn get v5WPhpUDZ => integer().nullable()();

  TextColumn get cR1KYb73 => text().nullable()();

  TextColumn get yTMaqAfWa => text().nullable()();

  TextColumn get sUuRWLq2 => text().nullable()();

  BoolColumn get iq7FcXyZInWs => boolean().withDefault(const Constant(false))();
  DateTimeColumn get mxSPDo81 => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {gk};
}

class UBvcxBeUEmMtGiRJj {
  final String lm;
  final String eYZp9TFDs;
  final String cOvFXl0;
  final String wJudXEA;
  final DateTime yFXYhCOJ;

  UBvcxBeUEmMtGiRJj({
    required this.lm,
    required this.eYZp9TFDs,
    required this.cOvFXl0,
    required this.wJudXEA,
    required this.yFXYhCOJ,
  });
}

class LKUO7gQ6CD {
  final AppDatabase tz;
  final SyncService iSLajur;
  final NotificacionRepository vqn2Ij6l7vO3Tqq1;

  LKUO7gQ6CD({
    required this.tz,
    required this.iSLajur,
    required this.vqn2Ij6l7vO3Tqq1,
  });

  Future<void> bNa(LanStatus lanStatus) async {
    if (lanStatus != LanStatus.connected) return;

    final pendientes =
        await (tz.select(tz.syncQueueTable)
              ..where((q) => q.procesado.equals(false))
              ..orderBy([(q) => OrderingTerm.asc(q.createdAt)]))
            .get();

    for (final item in pendientes) {
      try {
        print(
          '[SYNC] Procesando ${item.entidad}:${item.accion} id=${item.entidadId}',
        );
        if (item.entidad == 'asistencia' && item.accion == 'create') {
          await iSLajur.syncAsistencia(int.parse(item.entidadId));
        }

        if (item.entidad == 'glpi_ticket' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncGlpiTicket(item.payload!);
        }

        if (item.entidad == 'reporte' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncReporte(item.payload!);
        }

        if (item.entidad == 'reporte_comentario' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncReporteComentario(item.payload!);
        }

        if (item.entidad == 'reporte_evidencia' &&
            item.accion == 'upload' &&
            item.payload != null) {
          await iSLajur.syncReporteEvidencia(item.payload!);
        }

        if (item.entidad == 'tarea' &&
            item.accion == 'create' &&
            item.payload != null) {
          final remote = await iSLajur.syncTarea(item.payload!);
          final remoteId = remote?['id']?.toString();
          if (remoteId != null && remoteId.isNotEmpty) {
            final updated =
                await (tz.update(tz.tareasTable)
                      ..where((t) => t.id.equals(item.entidadId)))
                    .write(TareasTableCompanion(remoteId: Value(remoteId)));

            if (updated == 0) {
              print(
                '[SYNC] WARN tarea:create no existe local id=${item.entidadId} para guardar remoteId=$remoteId',
              );
            }
          }
        }

        if (item.entidad == 'tarea' &&
            item.accion == 'update_estado' &&
            item.payload != null) {
          await iSLajur.syncTareaEstado(item.payload!);
        }

        if (item.entidad == 'tarea_comentario' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncTareaComentario(item.payload!);
        }

        if (item.entidad == 'tarea_adjunto' &&
            item.accion == 'upload' &&
            item.payload != null) {
          await iSLajur.syncTareaAdjunto(item.payload!);
        }

        if (item.entidad == 'combustible_registro' &&
            item.accion == 'create' &&
            item.payload != null) {
          await _zwFInAGM7m2fiphWfM5(item);
        }

        if (item.entidad == 'reporte_estado' && item.payload != null) {
          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.reporte.name,
            titulo: 'Reporte resuelto',
            mensaje: 'Tu reporte fue marcado como resuelto',
            referenciaId: item.entidadId,
          );
        }

        if (item.entidad == 'notificacion' && item.payload != null) {
          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.sistema.name,
            titulo: item.payload!['titulo'] as String,
            mensaje: item.payload!['mensaje'] as String,
            referenciaId: item.entidadId,
          );
        }

        if (item.entidad == 'ia_resultado' && item.payload != null) {
          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.sistema.name,
            titulo: 'Clasificación automática',
            mensaje: 'IA asignó prioridad y responsables',
            referenciaId: item.entidadId,
          );
        }

        await (tz.update(tz.syncQueueTable)..where((q) => q.id.equals(item.id)))
            .write(const SyncQueueTableCompanion(procesado: Value(true)));

        print('[SYNC] OK ${item.entidad}:${item.accion} id=${item.entidadId}');
      } catch (e) {
        print(
          '[SYNC] ERROR ${item.entidad}:${item.accion} id=${item.entidadId} -> $e',
        );
        if (item.entidad == 'glpi_ticket') {
          continue;
        }

        break;
      }
    }
  }

  Future<void> cbXIKoh8LV2R2Xesjr() async {
    final pendientes =
        await (tz.select(tz.syncQueueTable)
              ..where((q) {
                return q.procesado.equals(false) &
                    q.entidad.equals('combustible_registro');
              })
              ..orderBy([(q) => OrderingTerm.asc(q.createdAt)]))
            .get();

    for (final item in pendientes) {
      try {
        print('[SYNC] Procesando combustible:create id=${item.entidadId}');

        if (item.payload != null) {
          await _zwFInAGM7m2fiphWfM5(item);
        }

        await (tz.update(tz.syncQueueTable)..where((q) => q.id.equals(item.id)))
            .write(const SyncQueueTableCompanion(procesado: Value(true)));

        print('[SYNC] OK combustible:create id=${item.entidadId}');
      } catch (e) {
        print('[SYNC] ERROR combustible:create id=${item.entidadId} -> $e');
        continue;
      }
    }
  }

  Future<void> _zwFInAGM7m2fiphWfM5(SyncQueueTableData item) async {
    try {
      final res = await iSLajur.syncCombustibleRegistro(item.payload!);

      String jTNgXJS5W(dynamic data) {
        if (data == null) return '';
        final s = data is String ? data : data.toString();
        return s.length > 1200 ? '${s.substring(0, 1200)}…' : s;
      }

      final infoParts = <String>[
        'OK',
        if (res?.statusCode != null) 'status:${res!.statusCode}',
        if ((res?.data) != null) jTNgXJS5W(res!.data),
      ];
      final info = infoParts.where((p) => p.trim().isNotEmpty).join(' | ');

      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          sincronizado: const Value(true),
          syncError: const Value.absent(),
          syncInfo: Value(info.isEmpty ? 'OK' : info),
        ),
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final dataStr = data == null
          ? ''
          : (data is String ? data : data.toString());
      final trimmed = dataStr.length > 800
          ? '${dataStr.substring(0, 800)}…'
          : dataStr;
      final uri = e.requestOptions.uri.toString();
      final underlying = e.error?.toString() ?? '';

      final message = <String>[
        'dio:${e.type}',
        if (uri.isNotEmpty) 'url:$uri',
        if (status != null) 'status:$status',
        if ((e.message ?? '').isNotEmpty) e.message!,
        if (underlying.isNotEmpty) underlying,
        if (trimmed.isNotEmpty) trimmed,
      ].join(' | ');

      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          syncError: Value(message),
          syncInfo: const Value.absent(),
        ),
      );

      rethrow;
    } catch (e) {
      final msg = e.toString();
      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          syncError: Value(
            msg.length > 800 ? '${msg.substring(0, 800)}…' : msg,
          ),
          syncInfo: const Value.absent(),
        ),
      );
      rethrow;
    }
  }
}

class MvYhndxd {
  final int om;
  final String lg9qmj;
  final int kAYYIsDV;
  final String? rMO;

  const MvYhndxd({
    required this.om,
    required this.lg9qmj,
    required this.kAYYIsDV,
    this.rMO,
  });

  factory MvYhndxd.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? json['jefatura_id'] ?? json['jefaturaId'];
    final gerencia =
        json['gerencia'] ?? json['gerencia_id'] ?? json['gerenciaId'];

    return MvYhndxd(
      om: int.tryParse(id?.toString() ?? '') ?? 0,
      lg9qmj: (json['nombre_jefatura'] ?? json['nombre'] ?? '').toString(),
      kAYYIsDV: int.tryParse(gerencia?.toString() ?? '') ?? 0,
      rMO: (json['img'] ?? json['imagen'] ?? '').toString().trim().isEmpty
          ? null
          : (json['img'] ?? json['imagen']).toString(),
    );
  }
}

class KqBOLs41 {
  final String gw;

  final String u3aymK;
  final String sFiI;
  final String ucAcyxha;
  final List<String> fH7uu;

  const KqBOLs41({
    required this.gw,
    required this.u3aymK,
    required this.sFiI,
    this.ucAcyxha = '',
    required this.fH7uu,
  });
}

enum Ja6KZpv6M7 {
  d70OR6T,
  hlMhMCZif1CbG,
  rWrnh809fWrwm00,
  cufTVp5,
}

class VgJlYXlcR {
  final Ja6KZpv6M7 axjCVg;
  final KqBOLs41? n4Xw;

  const VgJlYXlcR({
    required this.axjCVg,
    this.n4Xw,
  });

  factory VgJlYXlcR.i5Gzg0e() => const VgJlYXlcR(axjCVg: Ja6KZpv6M7.d70OR6T);

  factory VgJlYXlcR.i6EtUTyVpISly(KqBOLs41 user) =>
      VgJlYXlcR(axjCVg: Ja6KZpv6M7.hlMhMCZif1CbG, n4Xw: user);

  factory VgJlYXlcR.zZoZETFaKv1JC1h() =>
      const VgJlYXlcR(axjCVg: Ja6KZpv6M7.rWrnh809fWrwm00);

  factory VgJlYXlcR.blocked() => const VgJlYXlcR(axjCVg: Ja6KZpv6M7.cufTVp5);
}

class UXZhZuqvfXKMJT {
  final int eaGMkWkhxTntl;
  final List<String> o93iz7h9nTdbRo7s;

  const UXZhZuqvfXKMJT({
    required this.eaGMkWkhxTntl,
    required this.o93iz7h9nTdbRo7s,
  });
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider no inicializado');
});

final generatedPdfRepositoryProvider = Provider<V2f48toe1jh85XfKaDD13v>((ref) {
  return V2f48toe1jh85XfKaDD13v(ref.read(sharedPreferencesProvider));
});

final generatedPdfsProvider = FutureProvider<List<Q3ORRT7xmyLi>>((ref) async {
  return ref.read(generatedPdfRepositoryProvider).irrmmV0();
});

class JUtMtZAhU8S2N01nW0NOb extends AsistenciaTable
    with TableInfo<JUtMtZAhU8S2N01nW0NOb, K7g68SL3ZcwxYHO0o9J> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _m093a;
  JUtMtZAhU8S2N01nW0NOb(this.attachedDatabase, [this._m093a]);
  static const VerificationMeta _avE8n3 = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _zBXQOmgmFkojs = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _my4AOrVkSDOBj = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _y1oSoUer = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    check: () => CustomExpression<bool>("tipo IN ('entrada', 'salida')"),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sWrluaatB2 = const VerificationMeta('metodo');
  @override
  late final GeneratedColumn<String> metodo = GeneratedColumn<String>(
    'metodo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  static const VerificationMeta _r6u2uVu7JE1JLV73 = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _p6tN0Lt1D19j = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    fechaHora,
    tipo,
    metodo,
    sincronizado,
    creadoEn,
  ];
  @override
  String get aliasedName => _m093a ?? actualTableName;
  @override
  String get actualTableName => mCfae;
  static const String mCfae = 'asistencia_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<K7g68SL3ZcwxYHO0o9J> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_avE8n3, id.isAcceptableOrUnknown(data['id']!, _avE8n3));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _zBXQOmgmFkojs,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _zBXQOmgmFkojs),
      );
    } else if (isInserting) {
      context.missing(_zBXQOmgmFkojs);
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _my4AOrVkSDOBj,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _my4AOrVkSDOBj),
      );
    } else if (isInserting) {
      context.missing(_my4AOrVkSDOBj);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _y1oSoUer,
        tipo.isAcceptableOrUnknown(data['tipo']!, _y1oSoUer),
      );
    } else if (isInserting) {
      context.missing(_y1oSoUer);
    }
    if (data.containsKey('metodo')) {
      context.handle(
        _sWrluaatB2,
        metodo.isAcceptableOrUnknown(data['metodo']!, _sWrluaatB2),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _r6u2uVu7JE1JLV73,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _r6u2uVu7JE1JLV73,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _p6tN0Lt1D19j,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _p6tN0Lt1D19j),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  K7g68SL3ZcwxYHO0o9J map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return K7g68SL3ZcwxYHO0o9J(
      oB: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nmb3ybNSI: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      nfT5TUbRp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
      gFdG: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      zSuqNP: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metodo'],
      )!,
      bHyFLr1ImGWV: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      gxS2VMwG: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  JUtMtZAhU8S2N01nW0NOb createAlias(String alias) {
    return JUtMtZAhU8S2N01nW0NOb(attachedDatabase, alias);
  }
}

class K7g68SL3ZcwxYHO0o9J extends DataClass
    implements Insertable<K7g68SL3ZcwxYHO0o9J> {
  final int oB;
  final String nmb3ybNSI;
  final DateTime nfT5TUbRp;
  final String gFdG;
  final String zSuqNP;
  final bool bHyFLr1ImGWV;
  final DateTime gxS2VMwG;
  const K7g68SL3ZcwxYHO0o9J({
    required this.oB,
    required this.nmb3ybNSI,
    required this.nfT5TUbRp,
    required this.gFdG,
    required this.zSuqNP,
    required this.bHyFLr1ImGWV,
    required this.gxS2VMwG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(oB);
    map['usuario_id'] = Variable<String>(nmb3ybNSI);
    map['fecha_hora'] = Variable<DateTime>(nfT5TUbRp);
    map['tipo'] = Variable<String>(gFdG);
    map['metodo'] = Variable<String>(zSuqNP);
    map['sincronizado'] = Variable<bool>(bHyFLr1ImGWV);
    map['creado_en'] = Variable<DateTime>(gxS2VMwG);
    return map;
  }

  I4D75iPWJH0cc2eGwEo90OsZ bbVwdtMONGP(bool nullToAbsent) {
    return I4D75iPWJH0cc2eGwEo90OsZ(
      oG: Value(oB),
      j5hswdgrL: Value(nmb3ybNSI),
      tZ5Jbb5Kk: Value(nfT5TUbRp),
      obO0: Value(gFdG),
      sjelo5: Value(zSuqNP),
      qI8LLZmrR7bZ: Value(bHyFLr1ImGWV),
      b2OwXecC: Value(gxS2VMwG),
    );
  }

  factory K7g68SL3ZcwxYHO0o9J.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return K7g68SL3ZcwxYHO0o9J(
      oB: serializer.fromJson<int>(json['id']),
      nmb3ybNSI: serializer.fromJson<String>(json['usuarioId']),
      nfT5TUbRp: serializer.fromJson<DateTime>(json['fechaHora']),
      gFdG: serializer.fromJson<String>(json['tipo']),
      zSuqNP: serializer.fromJson<String>(json['metodo']),
      bHyFLr1ImGWV: serializer.fromJson<bool>(json['sincronizado']),
      gxS2VMwG: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(oB),
      'usuarioId': serializer.toJson<String>(nmb3ybNSI),
      'fechaHora': serializer.toJson<DateTime>(nfT5TUbRp),
      'tipo': serializer.toJson<String>(gFdG),
      'metodo': serializer.toJson<String>(zSuqNP),
      'sincronizado': serializer.toJson<bool>(bHyFLr1ImGWV),
      'creadoEn': serializer.toJson<DateTime>(gxS2VMwG),
    };
  }

  K7g68SL3ZcwxYHO0o9J r5ALyhCf({
    int? id,
    String? usuarioId,
    DateTime? fechaHora,
    String? tipo,
    String? metodo,
    bool? sincronizado,
    DateTime? creadoEn,
  }) => K7g68SL3ZcwxYHO0o9J(
    oB: id ?? this.oB,
    nmb3ybNSI: usuarioId ?? this.nmb3ybNSI,
    nfT5TUbRp: fechaHora ?? this.nfT5TUbRp,
    gFdG: tipo ?? this.gFdG,
    zSuqNP: metodo ?? this.zSuqNP,
    bHyFLr1ImGWV: sincronizado ?? this.bHyFLr1ImGWV,
    gxS2VMwG: creadoEn ?? this.gxS2VMwG,
  );
  K7g68SL3ZcwxYHO0o9J vzY0VBuOmdnzs0O1N(I4D75iPWJH0cc2eGwEo90OsZ data) {
    return K7g68SL3ZcwxYHO0o9J(
      oB: data.oG.present ? data.oG.value : this.oB,
      nmb3ybNSI: data.j5hswdgrL.present ? data.j5hswdgrL.value : this.nmb3ybNSI,
      nfT5TUbRp: data.tZ5Jbb5Kk.present ? data.tZ5Jbb5Kk.value : this.nfT5TUbRp,
      gFdG: data.obO0.present ? data.obO0.value : this.gFdG,
      zSuqNP: data.sjelo5.present ? data.sjelo5.value : this.zSuqNP,
      bHyFLr1ImGWV: data.qI8LLZmrR7bZ.present
          ? data.qI8LLZmrR7bZ.value
          : this.bHyFLr1ImGWV,
      gxS2VMwG: data.b2OwXecC.present ? data.b2OwXecC.value : this.gxS2VMwG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AsistenciaTableData(')
          ..write('id: $oB, ')
          ..write('usuarioId: $nmb3ybNSI, ')
          ..write('fechaHora: $nfT5TUbRp, ')
          ..write('tipo: $gFdG, ')
          ..write('metodo: $zSuqNP, ')
          ..write('sincronizado: $bHyFLr1ImGWV, ')
          ..write('creadoEn: $gxS2VMwG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    oB,
    nmb3ybNSI,
    nfT5TUbRp,
    gFdG,
    zSuqNP,
    bHyFLr1ImGWV,
    gxS2VMwG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is K7g68SL3ZcwxYHO0o9J &&
          other.oB == this.oB &&
          other.nmb3ybNSI == this.nmb3ybNSI &&
          other.nfT5TUbRp == this.nfT5TUbRp &&
          other.gFdG == this.gFdG &&
          other.zSuqNP == this.zSuqNP &&
          other.bHyFLr1ImGWV == this.bHyFLr1ImGWV &&
          other.gxS2VMwG == this.gxS2VMwG);
}

class I4D75iPWJH0cc2eGwEo90OsZ extends UpdateCompanion<K7g68SL3ZcwxYHO0o9J> {
  final Value<int> oG;
  final Value<String> j5hswdgrL;
  final Value<DateTime> tZ5Jbb5Kk;
  final Value<String> obO0;
  final Value<String> sjelo5;
  final Value<bool> qI8LLZmrR7bZ;
  final Value<DateTime> b2OwXecC;
  const I4D75iPWJH0cc2eGwEo90OsZ({
    this.oG = const Value.absent(),
    this.j5hswdgrL = const Value.absent(),
    this.tZ5Jbb5Kk = const Value.absent(),
    this.obO0 = const Value.absent(),
    this.sjelo5 = const Value.absent(),
    this.qI8LLZmrR7bZ = const Value.absent(),
    this.b2OwXecC = const Value.absent(),
  });
  I4D75iPWJH0cc2eGwEo90OsZ.gJkcVJ({
    this.oG = const Value.absent(),
    required String usuarioId,
    required DateTime fechaHora,
    required String tipo,
    this.sjelo5 = const Value.absent(),
    this.qI8LLZmrR7bZ = const Value.absent(),
    this.b2OwXecC = const Value.absent(),
  }) : j5hswdgrL = Value(usuarioId),
       tZ5Jbb5Kk = Value(fechaHora),
       obO0 = Value(tipo);
  static Insertable<K7g68SL3ZcwxYHO0o9J> dJVQUn({
    Expression<int>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? fechaHora,
    Expression<String>? tipo,
    Expression<String>? metodo,
    Expression<bool>? sincronizado,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (fechaHora != null) 'fecha_hora': fechaHora,
      if (tipo != null) 'tipo': tipo,
      if (metodo != null) 'metodo': metodo,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  I4D75iPWJH0cc2eGwEo90OsZ hUpy3cxf({
    Value<int>? id,
    Value<String>? usuarioId,
    Value<DateTime>? fechaHora,
    Value<String>? tipo,
    Value<String>? metodo,
    Value<bool>? sincronizado,
    Value<DateTime>? creadoEn,
  }) {
    return I4D75iPWJH0cc2eGwEo90OsZ(
      oG: id ?? this.oG,
      j5hswdgrL: usuarioId ?? this.j5hswdgrL,
      tZ5Jbb5Kk: fechaHora ?? this.tZ5Jbb5Kk,
      obO0: tipo ?? this.obO0,
      sjelo5: metodo ?? this.sjelo5,
      qI8LLZmrR7bZ: sincronizado ?? this.qI8LLZmrR7bZ,
      b2OwXecC: creadoEn ?? this.b2OwXecC,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (oG.present) {
      map['id'] = Variable<int>(oG.value);
    }
    if (j5hswdgrL.present) {
      map['usuario_id'] = Variable<String>(j5hswdgrL.value);
    }
    if (tZ5Jbb5Kk.present) {
      map['fecha_hora'] = Variable<DateTime>(tZ5Jbb5Kk.value);
    }
    if (obO0.present) {
      map['tipo'] = Variable<String>(obO0.value);
    }
    if (sjelo5.present) {
      map['metodo'] = Variable<String>(sjelo5.value);
    }
    if (qI8LLZmrR7bZ.present) {
      map['sincronizado'] = Variable<bool>(qI8LLZmrR7bZ.value);
    }
    if (b2OwXecC.present) {
      map['creado_en'] = Variable<DateTime>(b2OwXecC.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AsistenciaTableCompanion(')
          ..write('id: $oG, ')
          ..write('usuarioId: $j5hswdgrL, ')
          ..write('fechaHora: $tZ5Jbb5Kk, ')
          ..write('tipo: $obO0, ')
          ..write('metodo: $sjelo5, ')
          ..write('sincronizado: $qI8LLZmrR7bZ, ')
          ..write('creadoEn: $b2OwXecC')
          ..write(')'))
        .toString();
  }
}

class XE5bck28Z2cvTleRiVdRxj76YhW5AXu extends CombustibleRegistrosTable
    with
        TableInfo<
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _pB5W4;
  XE5bck28Z2cvTleRiVdRxj76YhW5AXu(this.attachedDatabase, [this._pB5W4]);
  static const VerificationMeta _lDpzZA = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qWxuUQKkUoEZQ = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _afeUNWxy = const VerificationMeta('modo');
  @override
  late final GeneratedColumn<String> modo = GeneratedColumn<String>(
    'modo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qMm0cbznYy = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mozm6Wl59cG = const VerificationMeta(
    'destino',
  );
  @override
  late final GeneratedColumn<String> destino = GeneratedColumn<String>(
    'destino',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scV2ub1igbVMNj = const VerificationMeta(
    'horaInicio',
  );
  @override
  late final GeneratedColumn<String> horaInicio = GeneratedColumn<String>(
    'hora_inicio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n6S4fCBmseHEr = const VerificationMeta(
    'horaFinal',
  );
  @override
  late final GeneratedColumn<String> horaFinal = GeneratedColumn<String>(
    'hora_final',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dfyP4rudt0ZhFWBr4W5vQq =
      const VerificationMeta('combustibleInicial');
  @override
  late final GeneratedColumn<String> combustibleInicial =
      GeneratedColumn<String>(
        'combustible_inicial',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _tz4me5PPcsU6FwYLWIJy7u =
      const VerificationMeta('kilometrajeInicial');
  @override
  late final GeneratedColumn<int> kilometrajeInicial = GeneratedColumn<int>(
    'kilometraje_inicial',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rriC9PNPOQ3BDsDL7F49 = const VerificationMeta(
    'combustibleFinal',
  );
  @override
  late final GeneratedColumn<String> combustibleFinal = GeneratedColumn<String>(
    'combustible_final',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bgZNUyGXbuS95si9q2WS = const VerificationMeta(
    'kilometrajeFinal',
  );
  @override
  late final GeneratedColumn<int> kilometrajeFinal = GeneratedColumn<int>(
    'kilometraje_final',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bBYuMp51Rk0ooD = const VerificationMeta(
    'fechaCarga',
  );
  @override
  late final GeneratedColumn<String> fechaCarga = GeneratedColumn<String>(
    'fecha_carga',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n6pQory4ZxWP = const VerificationMeta(
    'operador',
  );
  @override
  late final GeneratedColumn<String> operador = GeneratedColumn<String>(
    'operador',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rPKfJyfdpSP = const VerificationMeta(
    'kmAntes',
  );
  @override
  late final GeneratedColumn<int> kmAntes = GeneratedColumn<int>(
    'km_antes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _arcQVsmtGfH5k = const VerificationMeta(
    'kmDespues',
  );
  @override
  late final GeneratedColumn<int> kmDespues = GeneratedColumn<int>(
    'km_despues',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fK6VNlpdOSVR = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _arJzeXp9Hkin1 = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aEn67yle7sy1 = const VerificationMeta(
    'syncInfo',
  );
  @override
  late final GeneratedColumn<String> syncInfo = GeneratedColumn<String>(
    'sync_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pTbL26hnjmzFcSUZ = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _jU7eY7n3g8hb = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    modo,
    nombre,
    destino,
    horaInicio,
    horaFinal,
    combustibleInicial,
    kilometrajeInicial,
    combustibleFinal,
    kilometrajeFinal,
    fechaCarga,
    operador,
    kmAntes,
    kmDespues,
    metadata,
    syncError,
    syncInfo,
    sincronizado,
    creadoEn,
  ];
  @override
  String get aliasedName => _pB5W4 ?? actualTableName;
  @override
  String get actualTableName => mkmAY;
  static const String mkmAY = 'combustible_registros_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_lDpzZA, id.isAcceptableOrUnknown(data['id']!, _lDpzZA));
    } else if (isInserting) {
      context.missing(_lDpzZA);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _qWxuUQKkUoEZQ,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _qWxuUQKkUoEZQ),
      );
    } else if (isInserting) {
      context.missing(_qWxuUQKkUoEZQ);
    }
    if (data.containsKey('modo')) {
      context.handle(
        _afeUNWxy,
        modo.isAcceptableOrUnknown(data['modo']!, _afeUNWxy),
      );
    } else if (isInserting) {
      context.missing(_afeUNWxy);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _qMm0cbznYy,
        nombre.isAcceptableOrUnknown(data['nombre']!, _qMm0cbznYy),
      );
    }
    if (data.containsKey('destino')) {
      context.handle(
        _mozm6Wl59cG,
        destino.isAcceptableOrUnknown(data['destino']!, _mozm6Wl59cG),
      );
    }
    if (data.containsKey('hora_inicio')) {
      context.handle(
        _scV2ub1igbVMNj,
        horaInicio.isAcceptableOrUnknown(data['hora_inicio']!, _scV2ub1igbVMNj),
      );
    }
    if (data.containsKey('hora_final')) {
      context.handle(
        _n6S4fCBmseHEr,
        horaFinal.isAcceptableOrUnknown(data['hora_final']!, _n6S4fCBmseHEr),
      );
    }
    if (data.containsKey('combustible_inicial')) {
      context.handle(
        _dfyP4rudt0ZhFWBr4W5vQq,
        combustibleInicial.isAcceptableOrUnknown(
          data['combustible_inicial']!,
          _dfyP4rudt0ZhFWBr4W5vQq,
        ),
      );
    }
    if (data.containsKey('kilometraje_inicial')) {
      context.handle(
        _tz4me5PPcsU6FwYLWIJy7u,
        kilometrajeInicial.isAcceptableOrUnknown(
          data['kilometraje_inicial']!,
          _tz4me5PPcsU6FwYLWIJy7u,
        ),
      );
    }
    if (data.containsKey('combustible_final')) {
      context.handle(
        _rriC9PNPOQ3BDsDL7F49,
        combustibleFinal.isAcceptableOrUnknown(
          data['combustible_final']!,
          _rriC9PNPOQ3BDsDL7F49,
        ),
      );
    }
    if (data.containsKey('kilometraje_final')) {
      context.handle(
        _bgZNUyGXbuS95si9q2WS,
        kilometrajeFinal.isAcceptableOrUnknown(
          data['kilometraje_final']!,
          _bgZNUyGXbuS95si9q2WS,
        ),
      );
    }
    if (data.containsKey('fecha_carga')) {
      context.handle(
        _bBYuMp51Rk0ooD,
        fechaCarga.isAcceptableOrUnknown(data['fecha_carga']!, _bBYuMp51Rk0ooD),
      );
    }
    if (data.containsKey('operador')) {
      context.handle(
        _n6pQory4ZxWP,
        operador.isAcceptableOrUnknown(data['operador']!, _n6pQory4ZxWP),
      );
    }
    if (data.containsKey('km_antes')) {
      context.handle(
        _rPKfJyfdpSP,
        kmAntes.isAcceptableOrUnknown(data['km_antes']!, _rPKfJyfdpSP),
      );
    }
    if (data.containsKey('km_despues')) {
      context.handle(
        _arcQVsmtGfH5k,
        kmDespues.isAcceptableOrUnknown(data['km_despues']!, _arcQVsmtGfH5k),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _fK6VNlpdOSVR,
        metadata.isAcceptableOrUnknown(data['metadata']!, _fK6VNlpdOSVR),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _arJzeXp9Hkin1,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _arJzeXp9Hkin1),
      );
    }
    if (data.containsKey('sync_info')) {
      context.handle(
        _aEn67yle7sy1,
        syncInfo.isAcceptableOrUnknown(data['sync_info']!, _aEn67yle7sy1),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _pTbL26hnjmzFcSUZ,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _pTbL26hnjmzFcSUZ,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _jU7eY7n3g8hb,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _jU7eY7n3g8hb),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tu1jStwkwzpbJHfkGU7g09MJhUwdD map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dHkTLhou3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      mE20: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modo'],
      )!,
      zHSeei: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      u0d8zC8: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destino'],
      ),
      xrqanryIfY: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_inicio'],
      ),
      pfPYTLcZW: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_final'],
      ),
      vW6U1ZKngveCqaekKE: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}combustible_inicial'],
      ),
      jjhtiKfKbbLk4UJJSa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kilometraje_inicial'],
      ),
      lBsuQ6Pm36uQs6yF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}combustible_final'],
      ),
      jI2sYBxqgDhVihhg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kilometraje_final'],
      ),
      m11T7w8q0a: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_carga'],
      ),
      bOCjZ6ap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operador'],
      ),
      pwO9NB4: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}km_antes'],
      ),
      rMiidWbov: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}km_despues'],
      ),
      eYZ1MeCE: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      znAuBOBCl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      vw0B8mCJ: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_info'],
      ),
      uOeqAJlQTogm: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      vSmPHSr3: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  XE5bck28Z2cvTleRiVdRxj76YhW5AXu createAlias(String alias) {
    return XE5bck28Z2cvTleRiVdRxj76YhW5AXu(attachedDatabase, alias);
  }
}

class Tu1jStwkwzpbJHfkGU7g09MJhUwdD extends DataClass
    implements Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> {
  final String qv;
  final String dHkTLhou3;

  final String mE20;
  final String? zHSeei;
  final String? u0d8zC8;
  final String? xrqanryIfY;
  final String? pfPYTLcZW;
  final String? vW6U1ZKngveCqaekKE;
  final int? jjhtiKfKbbLk4UJJSa;
  final String? lBsuQ6Pm36uQs6yF;
  final int? jI2sYBxqgDhVihhg;
  final String? m11T7w8q0a;
  final String? bOCjZ6ap;
  final int? pwO9NB4;
  final int? rMiidWbov;

  final String? eYZ1MeCE;

  final String? znAuBOBCl;

  final String? vw0B8mCJ;
  final bool uOeqAJlQTogm;
  final DateTime vSmPHSr3;
  const Tu1jStwkwzpbJHfkGU7g09MJhUwdD({
    required this.qv,
    required this.dHkTLhou3,
    required this.mE20,
    this.zHSeei,
    this.u0d8zC8,
    this.xrqanryIfY,
    this.pfPYTLcZW,
    this.vW6U1ZKngveCqaekKE,
    this.jjhtiKfKbbLk4UJJSa,
    this.lBsuQ6Pm36uQs6yF,
    this.jI2sYBxqgDhVihhg,
    this.m11T7w8q0a,
    this.bOCjZ6ap,
    this.pwO9NB4,
    this.rMiidWbov,
    this.eYZ1MeCE,
    this.znAuBOBCl,
    this.vw0B8mCJ,
    required this.uOeqAJlQTogm,
    required this.vSmPHSr3,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(qv);
    map['usuario_id'] = Variable<String>(dHkTLhou3);
    map['modo'] = Variable<String>(mE20);
    if (!nullToAbsent || zHSeei != null) {
      map['nombre'] = Variable<String>(zHSeei);
    }
    if (!nullToAbsent || u0d8zC8 != null) {
      map['destino'] = Variable<String>(u0d8zC8);
    }
    if (!nullToAbsent || xrqanryIfY != null) {
      map['hora_inicio'] = Variable<String>(xrqanryIfY);
    }
    if (!nullToAbsent || pfPYTLcZW != null) {
      map['hora_final'] = Variable<String>(pfPYTLcZW);
    }
    if (!nullToAbsent || vW6U1ZKngveCqaekKE != null) {
      map['combustible_inicial'] = Variable<String>(vW6U1ZKngveCqaekKE);
    }
    if (!nullToAbsent || jjhtiKfKbbLk4UJJSa != null) {
      map['kilometraje_inicial'] = Variable<int>(jjhtiKfKbbLk4UJJSa);
    }
    if (!nullToAbsent || lBsuQ6Pm36uQs6yF != null) {
      map['combustible_final'] = Variable<String>(lBsuQ6Pm36uQs6yF);
    }
    if (!nullToAbsent || jI2sYBxqgDhVihhg != null) {
      map['kilometraje_final'] = Variable<int>(jI2sYBxqgDhVihhg);
    }
    if (!nullToAbsent || m11T7w8q0a != null) {
      map['fecha_carga'] = Variable<String>(m11T7w8q0a);
    }
    if (!nullToAbsent || bOCjZ6ap != null) {
      map['operador'] = Variable<String>(bOCjZ6ap);
    }
    if (!nullToAbsent || pwO9NB4 != null) {
      map['km_antes'] = Variable<int>(pwO9NB4);
    }
    if (!nullToAbsent || rMiidWbov != null) {
      map['km_despues'] = Variable<int>(rMiidWbov);
    }
    if (!nullToAbsent || eYZ1MeCE != null) {
      map['metadata'] = Variable<String>(eYZ1MeCE);
    }
    if (!nullToAbsent || znAuBOBCl != null) {
      map['sync_error'] = Variable<String>(znAuBOBCl);
    }
    if (!nullToAbsent || vw0B8mCJ != null) {
      map['sync_info'] = Variable<String>(vw0B8mCJ);
    }
    map['sincronizado'] = Variable<bool>(uOeqAJlQTogm);
    map['creado_en'] = Variable<DateTime>(vSmPHSr3);
    return map;
  }

  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB ionUPB0GzuW(bool nullToAbsent) {
    return U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
      kG: Value(qv),
      zP9InJmSB: Value(dHkTLhou3),
      piVk: Value(mE20),
      i5QUQk: zHSeei == null && nullToAbsent
          ? const Value.absent()
          : Value(zHSeei),
      u5GveBn: u0d8zC8 == null && nullToAbsent
          ? const Value.absent()
          : Value(u0d8zC8),
      xAMz01YkIt: xrqanryIfY == null && nullToAbsent
          ? const Value.absent()
          : Value(xrqanryIfY),
      ewIdFnxeO: pfPYTLcZW == null && nullToAbsent
          ? const Value.absent()
          : Value(pfPYTLcZW),
      bLRN1zQYqxM1WWlXjr: vW6U1ZKngveCqaekKE == null && nullToAbsent
          ? const Value.absent()
          : Value(vW6U1ZKngveCqaekKE),
      aYKSs386BUhF2mkPnG: jjhtiKfKbbLk4UJJSa == null && nullToAbsent
          ? const Value.absent()
          : Value(jjhtiKfKbbLk4UJJSa),
      ybJGZWDVbEKc4n5m: lBsuQ6Pm36uQs6yF == null && nullToAbsent
          ? const Value.absent()
          : Value(lBsuQ6Pm36uQs6yF),
      h0jpAs6ZpPJPw8NI: jI2sYBxqgDhVihhg == null && nullToAbsent
          ? const Value.absent()
          : Value(jI2sYBxqgDhVihhg),
      aqcX18IRuB: m11T7w8q0a == null && nullToAbsent
          ? const Value.absent()
          : Value(m11T7w8q0a),
      ekcREChe: bOCjZ6ap == null && nullToAbsent
          ? const Value.absent()
          : Value(bOCjZ6ap),
      dXt6KMU: pwO9NB4 == null && nullToAbsent
          ? const Value.absent()
          : Value(pwO9NB4),
      ngpZB55Sc: rMiidWbov == null && nullToAbsent
          ? const Value.absent()
          : Value(rMiidWbov),
      j4QNm5oy: eYZ1MeCE == null && nullToAbsent
          ? const Value.absent()
          : Value(eYZ1MeCE),
      yR3qhIbzL: znAuBOBCl == null && nullToAbsent
          ? const Value.absent()
          : Value(znAuBOBCl),
      uX8ZvZgj: vw0B8mCJ == null && nullToAbsent
          ? const Value.absent()
          : Value(vw0B8mCJ),
      dJCVP37dMYlm: Value(uOeqAJlQTogm),
      lYeqPFYS: Value(vSmPHSr3),
    );
  }

  factory Tu1jStwkwzpbJHfkGU7g09MJhUwdD.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: serializer.fromJson<String>(json['id']),
      dHkTLhou3: serializer.fromJson<String>(json['usuarioId']),
      mE20: serializer.fromJson<String>(json['modo']),
      zHSeei: serializer.fromJson<String?>(json['nombre']),
      u0d8zC8: serializer.fromJson<String?>(json['destino']),
      xrqanryIfY: serializer.fromJson<String?>(json['horaInicio']),
      pfPYTLcZW: serializer.fromJson<String?>(json['horaFinal']),
      vW6U1ZKngveCqaekKE: serializer.fromJson<String?>(
        json['combustibleInicial'],
      ),
      jjhtiKfKbbLk4UJJSa: serializer.fromJson<int?>(json['kilometrajeInicial']),
      lBsuQ6Pm36uQs6yF: serializer.fromJson<String?>(json['combustibleFinal']),
      jI2sYBxqgDhVihhg: serializer.fromJson<int?>(json['kilometrajeFinal']),
      m11T7w8q0a: serializer.fromJson<String?>(json['fechaCarga']),
      bOCjZ6ap: serializer.fromJson<String?>(json['operador']),
      pwO9NB4: serializer.fromJson<int?>(json['kmAntes']),
      rMiidWbov: serializer.fromJson<int?>(json['kmDespues']),
      eYZ1MeCE: serializer.fromJson<String?>(json['metadata']),
      znAuBOBCl: serializer.fromJson<String?>(json['syncError']),
      vw0B8mCJ: serializer.fromJson<String?>(json['syncInfo']),
      uOeqAJlQTogm: serializer.fromJson<bool>(json['sincronizado']),
      vSmPHSr3: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(qv),
      'usuarioId': serializer.toJson<String>(dHkTLhou3),
      'modo': serializer.toJson<String>(mE20),
      'nombre': serializer.toJson<String?>(zHSeei),
      'destino': serializer.toJson<String?>(u0d8zC8),
      'horaInicio': serializer.toJson<String?>(xrqanryIfY),
      'horaFinal': serializer.toJson<String?>(pfPYTLcZW),
      'combustibleInicial': serializer.toJson<String?>(vW6U1ZKngveCqaekKE),
      'kilometrajeInicial': serializer.toJson<int?>(jjhtiKfKbbLk4UJJSa),
      'combustibleFinal': serializer.toJson<String?>(lBsuQ6Pm36uQs6yF),
      'kilometrajeFinal': serializer.toJson<int?>(jI2sYBxqgDhVihhg),
      'fechaCarga': serializer.toJson<String?>(m11T7w8q0a),
      'operador': serializer.toJson<String?>(bOCjZ6ap),
      'kmAntes': serializer.toJson<int?>(pwO9NB4),
      'kmDespues': serializer.toJson<int?>(rMiidWbov),
      'metadata': serializer.toJson<String?>(eYZ1MeCE),
      'syncError': serializer.toJson<String?>(znAuBOBCl),
      'syncInfo': serializer.toJson<String?>(vw0B8mCJ),
      'sincronizado': serializer.toJson<bool>(uOeqAJlQTogm),
      'creadoEn': serializer.toJson<DateTime>(vSmPHSr3),
    };
  }

  Tu1jStwkwzpbJHfkGU7g09MJhUwdD hT2xYrby({
    String? id,
    String? usuarioId,
    String? modo,
    Value<String?> nombre = const Value.absent(),
    Value<String?> destino = const Value.absent(),
    Value<String?> horaInicio = const Value.absent(),
    Value<String?> horaFinal = const Value.absent(),
    Value<String?> combustibleInicial = const Value.absent(),
    Value<int?> kilometrajeInicial = const Value.absent(),
    Value<String?> combustibleFinal = const Value.absent(),
    Value<int?> kilometrajeFinal = const Value.absent(),
    Value<String?> fechaCarga = const Value.absent(),
    Value<String?> operador = const Value.absent(),
    Value<int?> kmAntes = const Value.absent(),
    Value<int?> kmDespues = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
    Value<String?> syncError = const Value.absent(),
    Value<String?> syncInfo = const Value.absent(),
    bool? sincronizado,
    DateTime? creadoEn,
  }) => Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
    qv: id ?? this.qv,
    dHkTLhou3: usuarioId ?? this.dHkTLhou3,
    mE20: modo ?? this.mE20,
    zHSeei: nombre.present ? nombre.value : this.zHSeei,
    u0d8zC8: destino.present ? destino.value : this.u0d8zC8,
    xrqanryIfY: horaInicio.present ? horaInicio.value : this.xrqanryIfY,
    pfPYTLcZW: horaFinal.present ? horaFinal.value : this.pfPYTLcZW,
    vW6U1ZKngveCqaekKE: combustibleInicial.present
        ? combustibleInicial.value
        : this.vW6U1ZKngveCqaekKE,
    jjhtiKfKbbLk4UJJSa: kilometrajeInicial.present
        ? kilometrajeInicial.value
        : this.jjhtiKfKbbLk4UJJSa,
    lBsuQ6Pm36uQs6yF: combustibleFinal.present
        ? combustibleFinal.value
        : this.lBsuQ6Pm36uQs6yF,
    jI2sYBxqgDhVihhg: kilometrajeFinal.present
        ? kilometrajeFinal.value
        : this.jI2sYBxqgDhVihhg,
    m11T7w8q0a: fechaCarga.present ? fechaCarga.value : this.m11T7w8q0a,
    bOCjZ6ap: operador.present ? operador.value : this.bOCjZ6ap,
    pwO9NB4: kmAntes.present ? kmAntes.value : this.pwO9NB4,
    rMiidWbov: kmDespues.present ? kmDespues.value : this.rMiidWbov,
    eYZ1MeCE: metadata.present ? metadata.value : this.eYZ1MeCE,
    znAuBOBCl: syncError.present ? syncError.value : this.znAuBOBCl,
    vw0B8mCJ: syncInfo.present ? syncInfo.value : this.vw0B8mCJ,
    uOeqAJlQTogm: sincronizado ?? this.uOeqAJlQTogm,
    vSmPHSr3: creadoEn ?? this.vSmPHSr3,
  );
  Tu1jStwkwzpbJHfkGU7g09MJhUwdD wCVsvOimo21t9uSWE(
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB data,
  ) {
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: data.kG.present ? data.kG.value : this.qv,
      dHkTLhou3: data.zP9InJmSB.present ? data.zP9InJmSB.value : this.dHkTLhou3,
      mE20: data.piVk.present ? data.piVk.value : this.mE20,
      zHSeei: data.i5QUQk.present ? data.i5QUQk.value : this.zHSeei,
      u0d8zC8: data.u5GveBn.present ? data.u5GveBn.value : this.u0d8zC8,
      xrqanryIfY: data.xAMz01YkIt.present
          ? data.xAMz01YkIt.value
          : this.xrqanryIfY,
      pfPYTLcZW: data.ewIdFnxeO.present ? data.ewIdFnxeO.value : this.pfPYTLcZW,
      vW6U1ZKngveCqaekKE: data.bLRN1zQYqxM1WWlXjr.present
          ? data.bLRN1zQYqxM1WWlXjr.value
          : this.vW6U1ZKngveCqaekKE,
      jjhtiKfKbbLk4UJJSa: data.aYKSs386BUhF2mkPnG.present
          ? data.aYKSs386BUhF2mkPnG.value
          : this.jjhtiKfKbbLk4UJJSa,
      lBsuQ6Pm36uQs6yF: data.ybJGZWDVbEKc4n5m.present
          ? data.ybJGZWDVbEKc4n5m.value
          : this.lBsuQ6Pm36uQs6yF,
      jI2sYBxqgDhVihhg: data.h0jpAs6ZpPJPw8NI.present
          ? data.h0jpAs6ZpPJPw8NI.value
          : this.jI2sYBxqgDhVihhg,
      m11T7w8q0a: data.aqcX18IRuB.present
          ? data.aqcX18IRuB.value
          : this.m11T7w8q0a,
      bOCjZ6ap: data.ekcREChe.present ? data.ekcREChe.value : this.bOCjZ6ap,
      pwO9NB4: data.dXt6KMU.present ? data.dXt6KMU.value : this.pwO9NB4,
      rMiidWbov: data.ngpZB55Sc.present ? data.ngpZB55Sc.value : this.rMiidWbov,
      eYZ1MeCE: data.j4QNm5oy.present ? data.j4QNm5oy.value : this.eYZ1MeCE,
      znAuBOBCl: data.yR3qhIbzL.present ? data.yR3qhIbzL.value : this.znAuBOBCl,
      vw0B8mCJ: data.uX8ZvZgj.present ? data.uX8ZvZgj.value : this.vw0B8mCJ,
      uOeqAJlQTogm: data.dJCVP37dMYlm.present
          ? data.dJCVP37dMYlm.value
          : this.uOeqAJlQTogm,
      vSmPHSr3: data.lYeqPFYS.present ? data.lYeqPFYS.value : this.vSmPHSr3,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CombustibleRegistrosTableData(')
          ..write('id: $qv, ')
          ..write('usuarioId: $dHkTLhou3, ')
          ..write('modo: $mE20, ')
          ..write('nombre: $zHSeei, ')
          ..write('destino: $u0d8zC8, ')
          ..write('horaInicio: $xrqanryIfY, ')
          ..write('horaFinal: $pfPYTLcZW, ')
          ..write('combustibleInicial: $vW6U1ZKngveCqaekKE, ')
          ..write('kilometrajeInicial: $jjhtiKfKbbLk4UJJSa, ')
          ..write('combustibleFinal: $lBsuQ6Pm36uQs6yF, ')
          ..write('kilometrajeFinal: $jI2sYBxqgDhVihhg, ')
          ..write('fechaCarga: $m11T7w8q0a, ')
          ..write('operador: $bOCjZ6ap, ')
          ..write('kmAntes: $pwO9NB4, ')
          ..write('kmDespues: $rMiidWbov, ')
          ..write('metadata: $eYZ1MeCE, ')
          ..write('syncError: $znAuBOBCl, ')
          ..write('syncInfo: $vw0B8mCJ, ')
          ..write('sincronizado: $uOeqAJlQTogm, ')
          ..write('creadoEn: $vSmPHSr3')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    qv,
    dHkTLhou3,
    mE20,
    zHSeei,
    u0d8zC8,
    xrqanryIfY,
    pfPYTLcZW,
    vW6U1ZKngveCqaekKE,
    jjhtiKfKbbLk4UJJSa,
    lBsuQ6Pm36uQs6yF,
    jI2sYBxqgDhVihhg,
    m11T7w8q0a,
    bOCjZ6ap,
    pwO9NB4,
    rMiidWbov,
    eYZ1MeCE,
    znAuBOBCl,
    vw0B8mCJ,
    uOeqAJlQTogm,
    vSmPHSr3,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tu1jStwkwzpbJHfkGU7g09MJhUwdD &&
          other.qv == this.qv &&
          other.dHkTLhou3 == this.dHkTLhou3 &&
          other.mE20 == this.mE20 &&
          other.zHSeei == this.zHSeei &&
          other.u0d8zC8 == this.u0d8zC8 &&
          other.xrqanryIfY == this.xrqanryIfY &&
          other.pfPYTLcZW == this.pfPYTLcZW &&
          other.vW6U1ZKngveCqaekKE == this.vW6U1ZKngveCqaekKE &&
          other.jjhtiKfKbbLk4UJJSa == this.jjhtiKfKbbLk4UJJSa &&
          other.lBsuQ6Pm36uQs6yF == this.lBsuQ6Pm36uQs6yF &&
          other.jI2sYBxqgDhVihhg == this.jI2sYBxqgDhVihhg &&
          other.m11T7w8q0a == this.m11T7w8q0a &&
          other.bOCjZ6ap == this.bOCjZ6ap &&
          other.pwO9NB4 == this.pwO9NB4 &&
          other.rMiidWbov == this.rMiidWbov &&
          other.eYZ1MeCE == this.eYZ1MeCE &&
          other.znAuBOBCl == this.znAuBOBCl &&
          other.vw0B8mCJ == this.vw0B8mCJ &&
          other.uOeqAJlQTogm == this.uOeqAJlQTogm &&
          other.vSmPHSr3 == this.vSmPHSr3);
}

class U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB
    extends UpdateCompanion<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> {
  final Value<String> kG;
  final Value<String> zP9InJmSB;
  final Value<String> piVk;
  final Value<String?> i5QUQk;
  final Value<String?> u5GveBn;
  final Value<String?> xAMz01YkIt;
  final Value<String?> ewIdFnxeO;
  final Value<String?> bLRN1zQYqxM1WWlXjr;
  final Value<int?> aYKSs386BUhF2mkPnG;
  final Value<String?> ybJGZWDVbEKc4n5m;
  final Value<int?> h0jpAs6ZpPJPw8NI;
  final Value<String?> aqcX18IRuB;
  final Value<String?> ekcREChe;
  final Value<int?> dXt6KMU;
  final Value<int?> ngpZB55Sc;
  final Value<String?> j4QNm5oy;
  final Value<String?> yR3qhIbzL;
  final Value<String?> uX8ZvZgj;
  final Value<bool> dJCVP37dMYlm;
  final Value<DateTime> lYeqPFYS;
  final Value<int> tHjkb;
  const U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB({
    this.kG = const Value.absent(),
    this.zP9InJmSB = const Value.absent(),
    this.piVk = const Value.absent(),
    this.i5QUQk = const Value.absent(),
    this.u5GveBn = const Value.absent(),
    this.xAMz01YkIt = const Value.absent(),
    this.ewIdFnxeO = const Value.absent(),
    this.bLRN1zQYqxM1WWlXjr = const Value.absent(),
    this.aYKSs386BUhF2mkPnG = const Value.absent(),
    this.ybJGZWDVbEKc4n5m = const Value.absent(),
    this.h0jpAs6ZpPJPw8NI = const Value.absent(),
    this.aqcX18IRuB = const Value.absent(),
    this.ekcREChe = const Value.absent(),
    this.dXt6KMU = const Value.absent(),
    this.ngpZB55Sc = const Value.absent(),
    this.j4QNm5oy = const Value.absent(),
    this.yR3qhIbzL = const Value.absent(),
    this.uX8ZvZgj = const Value.absent(),
    this.dJCVP37dMYlm = const Value.absent(),
    this.lYeqPFYS = const Value.absent(),
    this.tHjkb = const Value.absent(),
  });
  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB.insert({
    required String id,
    required String usuarioId,
    required String modo,
    this.i5QUQk = const Value.absent(),
    this.u5GveBn = const Value.absent(),
    this.xAMz01YkIt = const Value.absent(),
    this.ewIdFnxeO = const Value.absent(),
    this.bLRN1zQYqxM1WWlXjr = const Value.absent(),
    this.aYKSs386BUhF2mkPnG = const Value.absent(),
    this.ybJGZWDVbEKc4n5m = const Value.absent(),
    this.h0jpAs6ZpPJPw8NI = const Value.absent(),
    this.aqcX18IRuB = const Value.absent(),
    this.ekcREChe = const Value.absent(),
    this.dXt6KMU = const Value.absent(),
    this.ngpZB55Sc = const Value.absent(),
    this.j4QNm5oy = const Value.absent(),
    this.yR3qhIbzL = const Value.absent(),
    this.uX8ZvZgj = const Value.absent(),
    this.dJCVP37dMYlm = const Value.absent(),
    this.lYeqPFYS = const Value.absent(),
    this.tHjkb = const Value.absent(),
  }) : kG = Value(id),
       zP9InJmSB = Value(usuarioId),
       piVk = Value(modo);
  static Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> v0AqHV({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<String>? modo,
    Expression<String>? nombre,
    Expression<String>? destino,
    Expression<String>? horaInicio,
    Expression<String>? horaFinal,
    Expression<String>? combustibleInicial,
    Expression<int>? kilometrajeInicial,
    Expression<String>? combustibleFinal,
    Expression<int>? kilometrajeFinal,
    Expression<String>? fechaCarga,
    Expression<String>? operador,
    Expression<int>? kmAntes,
    Expression<int>? kmDespues,
    Expression<String>? metadata,
    Expression<String>? syncError,
    Expression<String>? syncInfo,
    Expression<bool>? sincronizado,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (modo != null) 'modo': modo,
      if (nombre != null) 'nombre': nombre,
      if (destino != null) 'destino': destino,
      if (horaInicio != null) 'hora_inicio': horaInicio,
      if (horaFinal != null) 'hora_final': horaFinal,
      if (combustibleInicial != null) 'combustible_inicial': combustibleInicial,
      if (kilometrajeInicial != null) 'kilometraje_inicial': kilometrajeInicial,
      if (combustibleFinal != null) 'combustible_final': combustibleFinal,
      if (kilometrajeFinal != null) 'kilometraje_final': kilometrajeFinal,
      if (fechaCarga != null) 'fecha_carga': fechaCarga,
      if (operador != null) 'operador': operador,
      if (kmAntes != null) 'km_antes': kmAntes,
      if (kmDespues != null) 'km_despues': kmDespues,
      if (metadata != null) 'metadata': metadata,
      if (syncError != null) 'sync_error': syncError,
      if (syncInfo != null) 'sync_info': syncInfo,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB qqisE6Cx({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<String>? modo,
    Value<String?>? nombre,
    Value<String?>? destino,
    Value<String?>? horaInicio,
    Value<String?>? horaFinal,
    Value<String?>? combustibleInicial,
    Value<int?>? kilometrajeInicial,
    Value<String?>? combustibleFinal,
    Value<int?>? kilometrajeFinal,
    Value<String?>? fechaCarga,
    Value<String?>? operador,
    Value<int?>? kmAntes,
    Value<int?>? kmDespues,
    Value<String?>? metadata,
    Value<String?>? syncError,
    Value<String?>? syncInfo,
    Value<bool>? sincronizado,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
      kG: id ?? this.kG,
      zP9InJmSB: usuarioId ?? this.zP9InJmSB,
      piVk: modo ?? this.piVk,
      i5QUQk: nombre ?? this.i5QUQk,
      u5GveBn: destino ?? this.u5GveBn,
      xAMz01YkIt: horaInicio ?? this.xAMz01YkIt,
      ewIdFnxeO: horaFinal ?? this.ewIdFnxeO,
      bLRN1zQYqxM1WWlXjr: combustibleInicial ?? this.bLRN1zQYqxM1WWlXjr,
      aYKSs386BUhF2mkPnG: kilometrajeInicial ?? this.aYKSs386BUhF2mkPnG,
      ybJGZWDVbEKc4n5m: combustibleFinal ?? this.ybJGZWDVbEKc4n5m,
      h0jpAs6ZpPJPw8NI: kilometrajeFinal ?? this.h0jpAs6ZpPJPw8NI,
      aqcX18IRuB: fechaCarga ?? this.aqcX18IRuB,
      ekcREChe: operador ?? this.ekcREChe,
      dXt6KMU: kmAntes ?? this.dXt6KMU,
      ngpZB55Sc: kmDespues ?? this.ngpZB55Sc,
      j4QNm5oy: metadata ?? this.j4QNm5oy,
      yR3qhIbzL: syncError ?? this.yR3qhIbzL,
      uX8ZvZgj: syncInfo ?? this.uX8ZvZgj,
      dJCVP37dMYlm: sincronizado ?? this.dJCVP37dMYlm,
      lYeqPFYS: creadoEn ?? this.lYeqPFYS,
      tHjkb: rowid ?? this.tHjkb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (kG.present) {
      map['id'] = Variable<String>(kG.value);
    }
    if (zP9InJmSB.present) {
      map['usuario_id'] = Variable<String>(zP9InJmSB.value);
    }
    if (piVk.present) {
      map['modo'] = Variable<String>(piVk.value);
    }
    if (i5QUQk.present) {
      map['nombre'] = Variable<String>(i5QUQk.value);
    }
    if (u5GveBn.present) {
      map['destino'] = Variable<String>(u5GveBn.value);
    }
    if (xAMz01YkIt.present) {
      map['hora_inicio'] = Variable<String>(xAMz01YkIt.value);
    }
    if (ewIdFnxeO.present) {
      map['hora_final'] = Variable<String>(ewIdFnxeO.value);
    }
    if (bLRN1zQYqxM1WWlXjr.present) {
      map['combustible_inicial'] = Variable<String>(bLRN1zQYqxM1WWlXjr.value);
    }
    if (aYKSs386BUhF2mkPnG.present) {
      map['kilometraje_inicial'] = Variable<int>(aYKSs386BUhF2mkPnG.value);
    }
    if (ybJGZWDVbEKc4n5m.present) {
      map['combustible_final'] = Variable<String>(ybJGZWDVbEKc4n5m.value);
    }
    if (h0jpAs6ZpPJPw8NI.present) {
      map['kilometraje_final'] = Variable<int>(h0jpAs6ZpPJPw8NI.value);
    }
    if (aqcX18IRuB.present) {
      map['fecha_carga'] = Variable<String>(aqcX18IRuB.value);
    }
    if (ekcREChe.present) {
      map['operador'] = Variable<String>(ekcREChe.value);
    }
    if (dXt6KMU.present) {
      map['km_antes'] = Variable<int>(dXt6KMU.value);
    }
    if (ngpZB55Sc.present) {
      map['km_despues'] = Variable<int>(ngpZB55Sc.value);
    }
    if (j4QNm5oy.present) {
      map['metadata'] = Variable<String>(j4QNm5oy.value);
    }
    if (yR3qhIbzL.present) {
      map['sync_error'] = Variable<String>(yR3qhIbzL.value);
    }
    if (uX8ZvZgj.present) {
      map['sync_info'] = Variable<String>(uX8ZvZgj.value);
    }
    if (dJCVP37dMYlm.present) {
      map['sincronizado'] = Variable<bool>(dJCVP37dMYlm.value);
    }
    if (lYeqPFYS.present) {
      map['creado_en'] = Variable<DateTime>(lYeqPFYS.value);
    }
    if (tHjkb.present) {
      map['rowid'] = Variable<int>(tHjkb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CombustibleRegistrosTableCompanion(')
          ..write('id: $kG, ')
          ..write('usuarioId: $zP9InJmSB, ')
          ..write('modo: $piVk, ')
          ..write('nombre: $i5QUQk, ')
          ..write('destino: $u5GveBn, ')
          ..write('horaInicio: $xAMz01YkIt, ')
          ..write('horaFinal: $ewIdFnxeO, ')
          ..write('combustibleInicial: $bLRN1zQYqxM1WWlXjr, ')
          ..write('kilometrajeInicial: $aYKSs386BUhF2mkPnG, ')
          ..write('combustibleFinal: $ybJGZWDVbEKc4n5m, ')
          ..write('kilometrajeFinal: $h0jpAs6ZpPJPw8NI, ')
          ..write('fechaCarga: $aqcX18IRuB, ')
          ..write('operador: $ekcREChe, ')
          ..write('kmAntes: $dXt6KMU, ')
          ..write('kmDespues: $ngpZB55Sc, ')
          ..write('metadata: $j4QNm5oy, ')
          ..write('syncError: $yR3qhIbzL, ')
          ..write('syncInfo: $uX8ZvZgj, ')
          ..write('sincronizado: $dJCVP37dMYlm, ')
          ..write('creadoEn: $lYeqPFYS, ')
          ..write('rowid: $tHjkb')
          ..write(')'))
        .toString();
  }
}

class Gn9jkqIImNg4fnxYGw6rFKUi extends NotificationsTable
    with TableInfo<Gn9jkqIImNg4fnxYGw6rFKUi, DPidT9wqpsXGu3Kq8QK4mS> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _pCVLn;
  Gn9jkqIImNg4fnxYGw6rFKUi(this.attachedDatabase, [this._pCVLn]);
  static const VerificationMeta _aptkfF = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ws1zF7BG5f = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gqY6lnGk7kb = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fekBaXMO = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('info'),
  );
  static const VerificationMeta _lT3RTEZUb = const VerificationMeta('leida');
  @override
  late final GeneratedColumn<bool> leida = GeneratedColumn<bool>(
    'leida',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("leida" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _vJ9J8HCz3I = const VerificationMeta('origen');
  @override
  late final GeneratedColumn<String> origen = GeneratedColumn<String>(
    'origen',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tmEuO0Smb = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titulo,
    mensaje,
    tipo,
    leida,
    origen,
    fecha,
  ];
  @override
  String get aliasedName => _pCVLn ?? actualTableName;
  @override
  String get actualTableName => l6Xah;
  static const String l6Xah = 'notifications_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DPidT9wqpsXGu3Kq8QK4mS> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_aptkfF, id.isAcceptableOrUnknown(data['id']!, _aptkfF));
    } else if (isInserting) {
      context.missing(_aptkfF);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _ws1zF7BG5f,
        titulo.isAcceptableOrUnknown(data['titulo']!, _ws1zF7BG5f),
      );
    } else if (isInserting) {
      context.missing(_ws1zF7BG5f);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _gqY6lnGk7kb,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _gqY6lnGk7kb),
      );
    } else if (isInserting) {
      context.missing(_gqY6lnGk7kb);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _fekBaXMO,
        tipo.isAcceptableOrUnknown(data['tipo']!, _fekBaXMO),
      );
    }
    if (data.containsKey('leida')) {
      context.handle(
        _lT3RTEZUb,
        leida.isAcceptableOrUnknown(data['leida']!, _lT3RTEZUb),
      );
    }
    if (data.containsKey('origen')) {
      context.handle(
        _vJ9J8HCz3I,
        origen.isAcceptableOrUnknown(data['origen']!, _vJ9J8HCz3I),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _tmEuO0Smb,
        fecha.isAcceptableOrUnknown(data['fecha']!, _tmEuO0Smb),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DPidT9wqpsXGu3Kq8QK4mS map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sIKxds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      nKcObHB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      m3UR: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      wR1et: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}leida'],
      )!,
      zUnAP2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origen'],
      ),
      iHrN4: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  Gn9jkqIImNg4fnxYGw6rFKUi createAlias(String alias) {
    return Gn9jkqIImNg4fnxYGw6rFKUi(attachedDatabase, alias);
  }
}

class DPidT9wqpsXGu3Kq8QK4mS extends DataClass
    implements Insertable<DPidT9wqpsXGu3Kq8QK4mS> {
  final String gG;
  final String sIKxds;
  final String nKcObHB;
  final String m3UR;
  final bool wR1et;
  final String? zUnAP2;
  final DateTime iHrN4;
  const DPidT9wqpsXGu3Kq8QK4mS({
    required this.gG,
    required this.sIKxds,
    required this.nKcObHB,
    required this.m3UR,
    required this.wR1et,
    this.zUnAP2,
    required this.iHrN4,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(gG);
    map['titulo'] = Variable<String>(sIKxds);
    map['mensaje'] = Variable<String>(nKcObHB);
    map['tipo'] = Variable<String>(m3UR);
    map['leida'] = Variable<bool>(wR1et);
    if (!nullToAbsent || zUnAP2 != null) {
      map['origen'] = Variable<String>(zUnAP2);
    }
    map['fecha'] = Variable<DateTime>(iHrN4);
    return map;
  }

  SWa7JoZtay7PsWkFUBhxewW9jpO a2G3oLEQ3cI(bool nullToAbsent) {
    return SWa7JoZtay7PsWkFUBhxewW9jpO(
      aN: Value(gG),
      ljk5Nd: Value(sIKxds),
      mnrOxtx: Value(nKcObHB),
      jdRb: Value(m3UR),
      zZbwB: Value(wR1et),
      b5yrQ9: zUnAP2 == null && nullToAbsent
          ? const Value.absent()
          : Value(zUnAP2),
      moLEU: Value(iHrN4),
    );
  }

  factory DPidT9wqpsXGu3Kq8QK4mS.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: serializer.fromJson<String>(json['id']),
      sIKxds: serializer.fromJson<String>(json['titulo']),
      nKcObHB: serializer.fromJson<String>(json['mensaje']),
      m3UR: serializer.fromJson<String>(json['tipo']),
      wR1et: serializer.fromJson<bool>(json['leida']),
      zUnAP2: serializer.fromJson<String?>(json['origen']),
      iHrN4: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(gG),
      'titulo': serializer.toJson<String>(sIKxds),
      'mensaje': serializer.toJson<String>(nKcObHB),
      'tipo': serializer.toJson<String>(m3UR),
      'leida': serializer.toJson<bool>(wR1et),
      'origen': serializer.toJson<String?>(zUnAP2),
      'fecha': serializer.toJson<DateTime>(iHrN4),
    };
  }

  DPidT9wqpsXGu3Kq8QK4mS laXQWkNU({
    String? id,
    String? titulo,
    String? mensaje,
    String? tipo,
    bool? leida,
    Value<String?> origen = const Value.absent(),
    DateTime? fecha,
  }) => DPidT9wqpsXGu3Kq8QK4mS(
    gG: id ?? this.gG,
    sIKxds: titulo ?? this.sIKxds,
    nKcObHB: mensaje ?? this.nKcObHB,
    m3UR: tipo ?? this.m3UR,
    wR1et: leida ?? this.wR1et,
    zUnAP2: origen.present ? origen.value : this.zUnAP2,
    iHrN4: fecha ?? this.iHrN4,
  );
  DPidT9wqpsXGu3Kq8QK4mS v9mp6RwBmwQwO2Bbp(SWa7JoZtay7PsWkFUBhxewW9jpO data) {
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: data.aN.present ? data.aN.value : this.gG,
      sIKxds: data.ljk5Nd.present ? data.ljk5Nd.value : this.sIKxds,
      nKcObHB: data.mnrOxtx.present ? data.mnrOxtx.value : this.nKcObHB,
      m3UR: data.jdRb.present ? data.jdRb.value : this.m3UR,
      wR1et: data.zZbwB.present ? data.zZbwB.value : this.wR1et,
      zUnAP2: data.b5yrQ9.present ? data.b5yrQ9.value : this.zUnAP2,
      iHrN4: data.moLEU.present ? data.moLEU.value : this.iHrN4,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableData(')
          ..write('id: $gG, ')
          ..write('titulo: $sIKxds, ')
          ..write('mensaje: $nKcObHB, ')
          ..write('tipo: $m3UR, ')
          ..write('leida: $wR1et, ')
          ..write('origen: $zUnAP2, ')
          ..write('fecha: $iHrN4')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(gG, sIKxds, nKcObHB, m3UR, wR1et, zUnAP2, iHrN4);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DPidT9wqpsXGu3Kq8QK4mS &&
          other.gG == this.gG &&
          other.sIKxds == this.sIKxds &&
          other.nKcObHB == this.nKcObHB &&
          other.m3UR == this.m3UR &&
          other.wR1et == this.wR1et &&
          other.zUnAP2 == this.zUnAP2 &&
          other.iHrN4 == this.iHrN4);
}

class SWa7JoZtay7PsWkFUBhxewW9jpO
    extends UpdateCompanion<DPidT9wqpsXGu3Kq8QK4mS> {
  final Value<String> aN;
  final Value<String> ljk5Nd;
  final Value<String> mnrOxtx;
  final Value<String> jdRb;
  final Value<bool> zZbwB;
  final Value<String?> b5yrQ9;
  final Value<DateTime> moLEU;
  final Value<int> b82qb;
  const SWa7JoZtay7PsWkFUBhxewW9jpO({
    this.aN = const Value.absent(),
    this.ljk5Nd = const Value.absent(),
    this.mnrOxtx = const Value.absent(),
    this.jdRb = const Value.absent(),
    this.zZbwB = const Value.absent(),
    this.b5yrQ9 = const Value.absent(),
    this.moLEU = const Value.absent(),
    this.b82qb = const Value.absent(),
  });
  SWa7JoZtay7PsWkFUBhxewW9jpO.insert({
    required String id,
    required String titulo,
    required String mensaje,
    this.jdRb = const Value.absent(),
    this.zZbwB = const Value.absent(),
    this.b5yrQ9 = const Value.absent(),
    this.moLEU = const Value.absent(),
    this.b82qb = const Value.absent(),
  }) : aN = Value(id),
       ljk5Nd = Value(titulo),
       mnrOxtx = Value(mensaje);
  static Insertable<DPidT9wqpsXGu3Kq8QK4mS> dXN3z1({
    Expression<String>? id,
    Expression<String>? titulo,
    Expression<String>? mensaje,
    Expression<String>? tipo,
    Expression<bool>? leida,
    Expression<String>? origen,
    Expression<DateTime>? fecha,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (mensaje != null) 'mensaje': mensaje,
      if (tipo != null) 'tipo': tipo,
      if (leida != null) 'leida': leida,
      if (origen != null) 'origen': origen,
      if (fecha != null) 'fecha': fecha,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SWa7JoZtay7PsWkFUBhxewW9jpO dnTB2RGJ({
    Value<String>? id,
    Value<String>? titulo,
    Value<String>? mensaje,
    Value<String>? tipo,
    Value<bool>? leida,
    Value<String?>? origen,
    Value<DateTime>? fecha,
    Value<int>? rowid,
  }) {
    return SWa7JoZtay7PsWkFUBhxewW9jpO(
      aN: id ?? this.aN,
      ljk5Nd: titulo ?? this.ljk5Nd,
      mnrOxtx: mensaje ?? this.mnrOxtx,
      jdRb: tipo ?? this.jdRb,
      zZbwB: leida ?? this.zZbwB,
      b5yrQ9: origen ?? this.b5yrQ9,
      moLEU: fecha ?? this.moLEU,
      b82qb: rowid ?? this.b82qb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (aN.present) {
      map['id'] = Variable<String>(aN.value);
    }
    if (ljk5Nd.present) {
      map['titulo'] = Variable<String>(ljk5Nd.value);
    }
    if (mnrOxtx.present) {
      map['mensaje'] = Variable<String>(mnrOxtx.value);
    }
    if (jdRb.present) {
      map['tipo'] = Variable<String>(jdRb.value);
    }
    if (zZbwB.present) {
      map['leida'] = Variable<bool>(zZbwB.value);
    }
    if (b5yrQ9.present) {
      map['origen'] = Variable<String>(b5yrQ9.value);
    }
    if (moLEU.present) {
      map['fecha'] = Variable<DateTime>(moLEU.value);
    }
    if (b82qb.present) {
      map['rowid'] = Variable<int>(b82qb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableCompanion(')
          ..write('id: $aN, ')
          ..write('titulo: $ljk5Nd, ')
          ..write('mensaje: $mnrOxtx, ')
          ..write('tipo: $jdRb, ')
          ..write('leida: $zZbwB, ')
          ..write('origen: $b5yrQ9, ')
          ..write('fecha: $moLEU, ')
          ..write('rowid: $b82qb')
          ..write(')'))
        .toString();
  }
}

class VoEzDvET6spVkF39b0bk extends SyncQueueTable
    with TableInfo<VoEzDvET6spVkF39b0bk, NArNwNTM7Tr2ljhuMP> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _zCE9Q;
  VoEzDvET6spVkF39b0bk(this.attachedDatabase, [this._zCE9Q]);
  static const VerificationMeta _d6ZA2t = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _e1g9fESk5eW = const VerificationMeta(
    'entidad',
  );
  @override
  late final GeneratedColumn<String> entidad = GeneratedColumn<String>(
    'entidad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yDqWTTdXKOBsq = const VerificationMeta(
    'entidadId',
  );
  @override
  late final GeneratedColumn<String> entidadId = GeneratedColumn<String>(
    'entidad_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nIm3rnKh4U = const VerificationMeta('accion');
  @override
  late final GeneratedColumn<String> accion = GeneratedColumn<String>(
    'accion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  payload =
      GeneratedColumn<String>(
        'payload',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL,
      );
  static const VerificationMeta _rCkPfXRZiwWfw = const VerificationMeta(
    'procesado',
  );
  @override
  late final GeneratedColumn<bool> procesado = GeneratedColumn<bool>(
    'procesado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("procesado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _kumkmjUJcGu4u = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entidad,
    entidadId,
    accion,
    payload,
    procesado,
    createdAt,
  ];
  @override
  String get aliasedName => _zCE9Q ?? actualTableName;
  @override
  String get actualTableName => jTd8f;
  static const String jTd8f = 'sync_queue_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NArNwNTM7Tr2ljhuMP> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_d6ZA2t, id.isAcceptableOrUnknown(data['id']!, _d6ZA2t));
    }
    if (data.containsKey('entidad')) {
      context.handle(
        _e1g9fESk5eW,
        entidad.isAcceptableOrUnknown(data['entidad']!, _e1g9fESk5eW),
      );
    } else if (isInserting) {
      context.missing(_e1g9fESk5eW);
    }
    if (data.containsKey('entidad_id')) {
      context.handle(
        _yDqWTTdXKOBsq,
        entidadId.isAcceptableOrUnknown(data['entidad_id']!, _yDqWTTdXKOBsq),
      );
    } else if (isInserting) {
      context.missing(_yDqWTTdXKOBsq);
    }
    if (data.containsKey('accion')) {
      context.handle(
        _nIm3rnKh4U,
        accion.isAcceptableOrUnknown(data['accion']!, _nIm3rnKh4U),
      );
    } else if (isInserting) {
      context.missing(_nIm3rnKh4U);
    }
    if (data.containsKey('procesado')) {
      context.handle(
        _rCkPfXRZiwWfw,
        procesado.isAcceptableOrUnknown(data['procesado']!, _rCkPfXRZiwWfw),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _kumkmjUJcGu4u,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _kumkmjUJcGu4u),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NArNwNTM7Tr2ljhuMP map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NArNwNTM7Tr2ljhuMP(
      bO: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tz8xnmY: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad'],
      )!,
      sBrJaPsHz: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad_id'],
      )!,
      wqtiZm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accion'],
      )!,
      fhLBlQE: VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payload'],
        ),
      ),
      n4ZZ1iSBa: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}procesado'],
      )!,
      fLab5Jn2T: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  VoEzDvET6spVkF39b0bk createAlias(String alias) {
    return VoEzDvET6spVkF39b0bk(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> lYAYL5bPC2LsMC29l =
      const SyncPayloadTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> eURylWApZIsZAh8ESL =
      NullAwareTypeConverter.wrap(lYAYL5bPC2LsMC29l);
}

class NArNwNTM7Tr2ljhuMP extends DataClass
    implements Insertable<NArNwNTM7Tr2ljhuMP> {
  final int bO;
  final String tz8xnmY;
  final String sBrJaPsHz;
  final String wqtiZm;
  final Map<String, dynamic>? fhLBlQE;
  final bool n4ZZ1iSBa;
  final DateTime fLab5Jn2T;
  const NArNwNTM7Tr2ljhuMP({
    required this.bO,
    required this.tz8xnmY,
    required this.sBrJaPsHz,
    required this.wqtiZm,
    this.fhLBlQE,
    required this.n4ZZ1iSBa,
    required this.fLab5Jn2T,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(bO);
    map['entidad'] = Variable<String>(tz8xnmY);
    map['entidad_id'] = Variable<String>(sBrJaPsHz);
    map['accion'] = Variable<String>(wqtiZm);
    if (!nullToAbsent || fhLBlQE != null) {
      map['payload'] = Variable<String>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.toSql(fhLBlQE),
      );
    }
    map['procesado'] = Variable<bool>(n4ZZ1iSBa);
    map['created_at'] = Variable<DateTime>(fLab5Jn2T);
    return map;
  }

  SrEEFVxhxqZAGYVOYcaDbjs hSRSwT3rws3(bool nullToAbsent) {
    return SrEEFVxhxqZAGYVOYcaDbjs(
      dy: Value(bO),
      jz6JiPB: Value(tz8xnmY),
      g8u3OR9sY: Value(sBrJaPsHz),
      v7ws6e: Value(wqtiZm),
      j9qrlAp: fhLBlQE == null && nullToAbsent
          ? const Value.absent()
          : Value(fhLBlQE),
      sKt6xl9c1: Value(n4ZZ1iSBa),
      toSavqXbg: Value(fLab5Jn2T),
    );
  }

  factory NArNwNTM7Tr2ljhuMP.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NArNwNTM7Tr2ljhuMP(
      bO: serializer.fromJson<int>(json['id']),
      tz8xnmY: serializer.fromJson<String>(json['entidad']),
      sBrJaPsHz: serializer.fromJson<String>(json['entidadId']),
      wqtiZm: serializer.fromJson<String>(json['accion']),
      fhLBlQE: serializer.fromJson<Map<String, dynamic>?>(json['payload']),
      n4ZZ1iSBa: serializer.fromJson<bool>(json['procesado']),
      fLab5Jn2T: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(bO),
      'entidad': serializer.toJson<String>(tz8xnmY),
      'entidadId': serializer.toJson<String>(sBrJaPsHz),
      'accion': serializer.toJson<String>(wqtiZm),
      'payload': serializer.toJson<Map<String, dynamic>?>(fhLBlQE),
      'procesado': serializer.toJson<bool>(n4ZZ1iSBa),
      'createdAt': serializer.toJson<DateTime>(fLab5Jn2T),
    };
  }

  NArNwNTM7Tr2ljhuMP uUrEnkCh({
    int? id,
    String? entidad,
    String? entidadId,
    String? accion,
    Value<Map<String, dynamic>?> payload = const Value.absent(),
    bool? procesado,
    DateTime? createdAt,
  }) => NArNwNTM7Tr2ljhuMP(
    bO: id ?? this.bO,
    tz8xnmY: entidad ?? this.tz8xnmY,
    sBrJaPsHz: entidadId ?? this.sBrJaPsHz,
    wqtiZm: accion ?? this.wqtiZm,
    fhLBlQE: payload.present ? payload.value : this.fhLBlQE,
    n4ZZ1iSBa: procesado ?? this.n4ZZ1iSBa,
    fLab5Jn2T: createdAt ?? this.fLab5Jn2T,
  );
  NArNwNTM7Tr2ljhuMP a8J4QaEWyyDsyY1rT(SrEEFVxhxqZAGYVOYcaDbjs data) {
    return NArNwNTM7Tr2ljhuMP(
      bO: data.dy.present ? data.dy.value : this.bO,
      tz8xnmY: data.jz6JiPB.present ? data.jz6JiPB.value : this.tz8xnmY,
      sBrJaPsHz: data.g8u3OR9sY.present ? data.g8u3OR9sY.value : this.sBrJaPsHz,
      wqtiZm: data.v7ws6e.present ? data.v7ws6e.value : this.wqtiZm,
      fhLBlQE: data.j9qrlAp.present ? data.j9qrlAp.value : this.fhLBlQE,
      n4ZZ1iSBa: data.sKt6xl9c1.present ? data.sKt6xl9c1.value : this.n4ZZ1iSBa,
      fLab5Jn2T: data.toSavqXbg.present ? data.toSavqXbg.value : this.fLab5Jn2T,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $bO, ')
          ..write('entidad: $tz8xnmY, ')
          ..write('entidadId: $sBrJaPsHz, ')
          ..write('accion: $wqtiZm, ')
          ..write('payload: $fhLBlQE, ')
          ..write('procesado: $n4ZZ1iSBa, ')
          ..write('createdAt: $fLab5Jn2T')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    bO,
    tz8xnmY,
    sBrJaPsHz,
    wqtiZm,
    fhLBlQE,
    n4ZZ1iSBa,
    fLab5Jn2T,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NArNwNTM7Tr2ljhuMP &&
          other.bO == this.bO &&
          other.tz8xnmY == this.tz8xnmY &&
          other.sBrJaPsHz == this.sBrJaPsHz &&
          other.wqtiZm == this.wqtiZm &&
          other.fhLBlQE == this.fhLBlQE &&
          other.n4ZZ1iSBa == this.n4ZZ1iSBa &&
          other.fLab5Jn2T == this.fLab5Jn2T);
}

class SrEEFVxhxqZAGYVOYcaDbjs extends UpdateCompanion<NArNwNTM7Tr2ljhuMP> {
  final Value<int> dy;
  final Value<String> jz6JiPB;
  final Value<String> g8u3OR9sY;
  final Value<String> v7ws6e;
  final Value<Map<String, dynamic>?> j9qrlAp;
  final Value<bool> sKt6xl9c1;
  final Value<DateTime> toSavqXbg;
  const SrEEFVxhxqZAGYVOYcaDbjs({
    this.dy = const Value.absent(),
    this.jz6JiPB = const Value.absent(),
    this.g8u3OR9sY = const Value.absent(),
    this.v7ws6e = const Value.absent(),
    this.j9qrlAp = const Value.absent(),
    this.sKt6xl9c1 = const Value.absent(),
    this.toSavqXbg = const Value.absent(),
  });
  SrEEFVxhxqZAGYVOYcaDbjs.insert({
    this.dy = const Value.absent(),
    required String entidad,
    required String entidadId,
    required String accion,
    this.j9qrlAp = const Value.absent(),
    this.sKt6xl9c1 = const Value.absent(),
    this.toSavqXbg = const Value.absent(),
  }) : jz6JiPB = Value(entidad),
       g8u3OR9sY = Value(entidadId),
       v7ws6e = Value(accion);
  static Insertable<NArNwNTM7Tr2ljhuMP> loSb9M({
    Expression<int>? id,
    Expression<String>? entidad,
    Expression<String>? entidadId,
    Expression<String>? accion,
    Expression<String>? payload,
    Expression<bool>? procesado,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entidad != null) 'entidad': entidad,
      if (entidadId != null) 'entidad_id': entidadId,
      if (accion != null) 'accion': accion,
      if (payload != null) 'payload': payload,
      if (procesado != null) 'procesado': procesado,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SrEEFVxhxqZAGYVOYcaDbjs ksMp58W5({
    Value<int>? id,
    Value<String>? entidad,
    Value<String>? entidadId,
    Value<String>? accion,
    Value<Map<String, dynamic>?>? payload,
    Value<bool>? procesado,
    Value<DateTime>? createdAt,
  }) {
    return SrEEFVxhxqZAGYVOYcaDbjs(
      dy: id ?? this.dy,
      jz6JiPB: entidad ?? this.jz6JiPB,
      g8u3OR9sY: entidadId ?? this.g8u3OR9sY,
      v7ws6e: accion ?? this.v7ws6e,
      j9qrlAp: payload ?? this.j9qrlAp,
      sKt6xl9c1: procesado ?? this.sKt6xl9c1,
      toSavqXbg: createdAt ?? this.toSavqXbg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dy.present) {
      map['id'] = Variable<int>(dy.value);
    }
    if (jz6JiPB.present) {
      map['entidad'] = Variable<String>(jz6JiPB.value);
    }
    if (g8u3OR9sY.present) {
      map['entidad_id'] = Variable<String>(g8u3OR9sY.value);
    }
    if (v7ws6e.present) {
      map['accion'] = Variable<String>(v7ws6e.value);
    }
    if (j9qrlAp.present) {
      map['payload'] = Variable<String>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.toSql(j9qrlAp.value),
      );
    }
    if (sKt6xl9c1.present) {
      map['procesado'] = Variable<bool>(sKt6xl9c1.value);
    }
    if (toSavqXbg.present) {
      map['created_at'] = Variable<DateTime>(toSavqXbg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $dy, ')
          ..write('entidad: $jz6JiPB, ')
          ..write('entidadId: $g8u3OR9sY, ')
          ..write('accion: $v7ws6e, ')
          ..write('payload: $j9qrlAp, ')
          ..write('procesado: $sKt6xl9c1, ')
          ..write('createdAt: $toSavqXbg')
          ..write(')'))
        .toString();
  }
}

class J62cINCwmlQnn32ri extends TareasTable
    with TableInfo<J62cINCwmlQnn32ri, AZne3qKStPEIrwr> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _tcFrj;
  J62cINCwmlQnn32ri(this.attachedDatabase, [this._tcFrj]);
  static const VerificationMeta _cecR2F = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ckaejDeOnWHp = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isYgXuHRNZA = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aOt3nIKdxOHJO = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _y2ffWiiKFl = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yihYAYfAROOg94d = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _xGqxoB0eNf8sw = const VerificationMeta(
    'creadoPor',
  );
  @override
  late final GeneratedColumn<String> creadoPor = GeneratedColumn<String>(
    'creado_por',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iBLiyu2tx9Ri5 = const VerificationMeta(
    'asignadoA',
  );
  @override
  late final GeneratedColumn<String> asignadoA = GeneratedColumn<String>(
    'asignado_a',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wv0oupcpIq = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    groupId,
    reporteId,
    titulo,
    descripcion,
    creadoPor,
    asignadoA,
    estado,
  ];
  @override
  String get aliasedName => _tcFrj ?? actualTableName;
  @override
  String get actualTableName => jeEjV;
  static const String jeEjV = 'tareas_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AZne3qKStPEIrwr> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_cecR2F, id.isAcceptableOrUnknown(data['id']!, _cecR2F));
    } else if (isInserting) {
      context.missing(_cecR2F);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _ckaejDeOnWHp,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _ckaejDeOnWHp),
      );
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _isYgXuHRNZA,
        groupId.isAcceptableOrUnknown(data['group_id']!, _isYgXuHRNZA),
      );
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _aOt3nIKdxOHJO,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _aOt3nIKdxOHJO),
      );
    } else if (isInserting) {
      context.missing(_aOt3nIKdxOHJO);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _y2ffWiiKFl,
        titulo.isAcceptableOrUnknown(data['titulo']!, _y2ffWiiKFl),
      );
    } else if (isInserting) {
      context.missing(_y2ffWiiKFl);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _yihYAYfAROOg94d,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _yihYAYfAROOg94d,
        ),
      );
    }
    if (data.containsKey('creado_por')) {
      context.handle(
        _xGqxoB0eNf8sw,
        creadoPor.isAcceptableOrUnknown(data['creado_por']!, _xGqxoB0eNf8sw),
      );
    }
    if (data.containsKey('asignado_a')) {
      context.handle(
        _iBLiyu2tx9Ri5,
        asignadoA.isAcceptableOrUnknown(data['asignado_a']!, _iBLiyu2tx9Ri5),
      );
    } else if (isInserting) {
      context.missing(_iBLiyu2tx9Ri5);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _wv0oupcpIq,
        estado.isAcceptableOrUnknown(data['estado']!, _wv0oupcpIq),
      );
    } else if (isInserting) {
      context.missing(_wv0oupcpIq);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AZne3qKStPEIrwr map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AZne3qKStPEIrwr(
      im: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      wQJqvR0H: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      qyTmQyB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_id'],
      ),
      ohkkpa8rU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      r1SV6u: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      kHlx20PX2SB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      mM2gIX7V3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creado_por'],
      ),
      gh1t7zpkL: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asignado_a'],
      )!,
      dEEBGs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
    );
  }

  @override
  J62cINCwmlQnn32ri createAlias(String alias) {
    return J62cINCwmlQnn32ri(attachedDatabase, alias);
  }
}

class AZne3qKStPEIrwr extends DataClass implements Insertable<AZne3qKStPEIrwr> {
  final String im;
  final String? wQJqvR0H;
  final String? qyTmQyB;
  final String ohkkpa8rU;
  final String r1SV6u;
  final String kHlx20PX2SB;
  final String? mM2gIX7V3;
  final String gh1t7zpkL;
  final String dEEBGs;
  const AZne3qKStPEIrwr({
    required this.im,
    this.wQJqvR0H,
    this.qyTmQyB,
    required this.ohkkpa8rU,
    required this.r1SV6u,
    required this.kHlx20PX2SB,
    this.mM2gIX7V3,
    required this.gh1t7zpkL,
    required this.dEEBGs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(im);
    if (!nullToAbsent || wQJqvR0H != null) {
      map['remote_id'] = Variable<String>(wQJqvR0H);
    }
    if (!nullToAbsent || qyTmQyB != null) {
      map['group_id'] = Variable<String>(qyTmQyB);
    }
    map['reporte_id'] = Variable<String>(ohkkpa8rU);
    map['titulo'] = Variable<String>(r1SV6u);
    map['descripcion'] = Variable<String>(kHlx20PX2SB);
    if (!nullToAbsent || mM2gIX7V3 != null) {
      map['creado_por'] = Variable<String>(mM2gIX7V3);
    }
    map['asignado_a'] = Variable<String>(gh1t7zpkL);
    map['estado'] = Variable<String>(dEEBGs);
    return map;
  }

  OwsvOrFusdhz7tOUKhJP dPw5LgxeCv8(bool nullToAbsent) {
    return OwsvOrFusdhz7tOUKhJP(
      vN: Value(im),
      rN7JO0qb: wQJqvR0H == null && nullToAbsent
          ? const Value.absent()
          : Value(wQJqvR0H),
      kiENrzh: qyTmQyB == null && nullToAbsent
          ? const Value.absent()
          : Value(qyTmQyB),
      aeirywxyG: Value(ohkkpa8rU),
      ynDuUW: Value(r1SV6u),
      lOp8NQT26oW: Value(kHlx20PX2SB),
      x542jWBgN: mM2gIX7V3 == null && nullToAbsent
          ? const Value.absent()
          : Value(mM2gIX7V3),
      z9uTXhbFC: Value(gh1t7zpkL),
      tJjuIr: Value(dEEBGs),
    );
  }

  factory AZne3qKStPEIrwr.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AZne3qKStPEIrwr(
      im: serializer.fromJson<String>(json['id']),
      wQJqvR0H: serializer.fromJson<String?>(json['remoteId']),
      qyTmQyB: serializer.fromJson<String?>(json['groupId']),
      ohkkpa8rU: serializer.fromJson<String>(json['reporteId']),
      r1SV6u: serializer.fromJson<String>(json['titulo']),
      kHlx20PX2SB: serializer.fromJson<String>(json['descripcion']),
      mM2gIX7V3: serializer.fromJson<String?>(json['creadoPor']),
      gh1t7zpkL: serializer.fromJson<String>(json['asignadoA']),
      dEEBGs: serializer.fromJson<String>(json['estado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(im),
      'remoteId': serializer.toJson<String?>(wQJqvR0H),
      'groupId': serializer.toJson<String?>(qyTmQyB),
      'reporteId': serializer.toJson<String>(ohkkpa8rU),
      'titulo': serializer.toJson<String>(r1SV6u),
      'descripcion': serializer.toJson<String>(kHlx20PX2SB),
      'creadoPor': serializer.toJson<String?>(mM2gIX7V3),
      'asignadoA': serializer.toJson<String>(gh1t7zpkL),
      'estado': serializer.toJson<String>(dEEBGs),
    };
  }

  AZne3qKStPEIrwr fSGHVcWg({
    String? id,
    Value<String?> remoteId = const Value.absent(),
    Value<String?> groupId = const Value.absent(),
    String? reporteId,
    String? titulo,
    String? descripcion,
    Value<String?> creadoPor = const Value.absent(),
    String? asignadoA,
    String? estado,
  }) => AZne3qKStPEIrwr(
    im: id ?? this.im,
    wQJqvR0H: remoteId.present ? remoteId.value : this.wQJqvR0H,
    qyTmQyB: groupId.present ? groupId.value : this.qyTmQyB,
    ohkkpa8rU: reporteId ?? this.ohkkpa8rU,
    r1SV6u: titulo ?? this.r1SV6u,
    kHlx20PX2SB: descripcion ?? this.kHlx20PX2SB,
    mM2gIX7V3: creadoPor.present ? creadoPor.value : this.mM2gIX7V3,
    gh1t7zpkL: asignadoA ?? this.gh1t7zpkL,
    dEEBGs: estado ?? this.dEEBGs,
  );
  AZne3qKStPEIrwr oWGk7gdkrwHSgsshU(OwsvOrFusdhz7tOUKhJP data) {
    return AZne3qKStPEIrwr(
      im: data.vN.present ? data.vN.value : this.im,
      wQJqvR0H: data.rN7JO0qb.present ? data.rN7JO0qb.value : this.wQJqvR0H,
      qyTmQyB: data.kiENrzh.present ? data.kiENrzh.value : this.qyTmQyB,
      ohkkpa8rU: data.aeirywxyG.present ? data.aeirywxyG.value : this.ohkkpa8rU,
      r1SV6u: data.ynDuUW.present ? data.ynDuUW.value : this.r1SV6u,
      kHlx20PX2SB: data.lOp8NQT26oW.present
          ? data.lOp8NQT26oW.value
          : this.kHlx20PX2SB,
      mM2gIX7V3: data.x542jWBgN.present ? data.x542jWBgN.value : this.mM2gIX7V3,
      gh1t7zpkL: data.z9uTXhbFC.present ? data.z9uTXhbFC.value : this.gh1t7zpkL,
      dEEBGs: data.tJjuIr.present ? data.tJjuIr.value : this.dEEBGs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareasTableData(')
          ..write('id: $im, ')
          ..write('remoteId: $wQJqvR0H, ')
          ..write('groupId: $qyTmQyB, ')
          ..write('reporteId: $ohkkpa8rU, ')
          ..write('titulo: $r1SV6u, ')
          ..write('descripcion: $kHlx20PX2SB, ')
          ..write('creadoPor: $mM2gIX7V3, ')
          ..write('asignadoA: $gh1t7zpkL, ')
          ..write('estado: $dEEBGs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    im,
    wQJqvR0H,
    qyTmQyB,
    ohkkpa8rU,
    r1SV6u,
    kHlx20PX2SB,
    mM2gIX7V3,
    gh1t7zpkL,
    dEEBGs,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AZne3qKStPEIrwr &&
          other.im == this.im &&
          other.wQJqvR0H == this.wQJqvR0H &&
          other.qyTmQyB == this.qyTmQyB &&
          other.ohkkpa8rU == this.ohkkpa8rU &&
          other.r1SV6u == this.r1SV6u &&
          other.kHlx20PX2SB == this.kHlx20PX2SB &&
          other.mM2gIX7V3 == this.mM2gIX7V3 &&
          other.gh1t7zpkL == this.gh1t7zpkL &&
          other.dEEBGs == this.dEEBGs);
}

class OwsvOrFusdhz7tOUKhJP extends UpdateCompanion<AZne3qKStPEIrwr> {
  final Value<String> vN;
  final Value<String?> rN7JO0qb;
  final Value<String?> kiENrzh;
  final Value<String> aeirywxyG;
  final Value<String> ynDuUW;
  final Value<String> lOp8NQT26oW;
  final Value<String?> x542jWBgN;
  final Value<String> z9uTXhbFC;
  final Value<String> tJjuIr;
  final Value<int> rLjxm;
  const OwsvOrFusdhz7tOUKhJP({
    this.vN = const Value.absent(),
    this.rN7JO0qb = const Value.absent(),
    this.kiENrzh = const Value.absent(),
    this.aeirywxyG = const Value.absent(),
    this.ynDuUW = const Value.absent(),
    this.lOp8NQT26oW = const Value.absent(),
    this.x542jWBgN = const Value.absent(),
    this.z9uTXhbFC = const Value.absent(),
    this.tJjuIr = const Value.absent(),
    this.rLjxm = const Value.absent(),
  });
  OwsvOrFusdhz7tOUKhJP.insert({
    required String id,
    this.rN7JO0qb = const Value.absent(),
    this.kiENrzh = const Value.absent(),
    required String reporteId,
    required String titulo,
    this.lOp8NQT26oW = const Value.absent(),
    this.x542jWBgN = const Value.absent(),
    required String asignadoA,
    required String estado,
    this.rLjxm = const Value.absent(),
  }) : vN = Value(id),
       aeirywxyG = Value(reporteId),
       ynDuUW = Value(titulo),
       z9uTXhbFC = Value(asignadoA),
       tJjuIr = Value(estado);
  static Insertable<AZne3qKStPEIrwr> eZm6o2({
    Expression<String>? id,
    Expression<String>? remoteId,
    Expression<String>? groupId,
    Expression<String>? reporteId,
    Expression<String>? titulo,
    Expression<String>? descripcion,
    Expression<String>? creadoPor,
    Expression<String>? asignadoA,
    Expression<String>? estado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (groupId != null) 'group_id': groupId,
      if (reporteId != null) 'reporte_id': reporteId,
      if (titulo != null) 'titulo': titulo,
      if (descripcion != null) 'descripcion': descripcion,
      if (creadoPor != null) 'creado_por': creadoPor,
      if (asignadoA != null) 'asignado_a': asignadoA,
      if (estado != null) 'estado': estado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OwsvOrFusdhz7tOUKhJP cpDRm0A2({
    Value<String>? id,
    Value<String?>? remoteId,
    Value<String?>? groupId,
    Value<String>? reporteId,
    Value<String>? titulo,
    Value<String>? descripcion,
    Value<String?>? creadoPor,
    Value<String>? asignadoA,
    Value<String>? estado,
    Value<int>? rowid,
  }) {
    return OwsvOrFusdhz7tOUKhJP(
      vN: id ?? this.vN,
      rN7JO0qb: remoteId ?? this.rN7JO0qb,
      kiENrzh: groupId ?? this.kiENrzh,
      aeirywxyG: reporteId ?? this.aeirywxyG,
      ynDuUW: titulo ?? this.ynDuUW,
      lOp8NQT26oW: descripcion ?? this.lOp8NQT26oW,
      x542jWBgN: creadoPor ?? this.x542jWBgN,
      z9uTXhbFC: asignadoA ?? this.z9uTXhbFC,
      tJjuIr: estado ?? this.tJjuIr,
      rLjxm: rowid ?? this.rLjxm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vN.present) {
      map['id'] = Variable<String>(vN.value);
    }
    if (rN7JO0qb.present) {
      map['remote_id'] = Variable<String>(rN7JO0qb.value);
    }
    if (kiENrzh.present) {
      map['group_id'] = Variable<String>(kiENrzh.value);
    }
    if (aeirywxyG.present) {
      map['reporte_id'] = Variable<String>(aeirywxyG.value);
    }
    if (ynDuUW.present) {
      map['titulo'] = Variable<String>(ynDuUW.value);
    }
    if (lOp8NQT26oW.present) {
      map['descripcion'] = Variable<String>(lOp8NQT26oW.value);
    }
    if (x542jWBgN.present) {
      map['creado_por'] = Variable<String>(x542jWBgN.value);
    }
    if (z9uTXhbFC.present) {
      map['asignado_a'] = Variable<String>(z9uTXhbFC.value);
    }
    if (tJjuIr.present) {
      map['estado'] = Variable<String>(tJjuIr.value);
    }
    if (rLjxm.present) {
      map['rowid'] = Variable<int>(rLjxm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareasTableCompanion(')
          ..write('id: $vN, ')
          ..write('remoteId: $rN7JO0qb, ')
          ..write('groupId: $kiENrzh, ')
          ..write('reporteId: $aeirywxyG, ')
          ..write('titulo: $ynDuUW, ')
          ..write('descripcion: $lOp8NQT26oW, ')
          ..write('creadoPor: $x542jWBgN, ')
          ..write('asignadoA: $z9uTXhbFC, ')
          ..write('estado: $tJjuIr, ')
          ..write('rowid: $rLjxm')
          ..write(')'))
        .toString();
  }
}

class H3NxUrmIatWHjGU32octXOFRSTp extends TareaComentariosTable
    with TableInfo<H3NxUrmIatWHjGU32octXOFRSTp, PfsdSEuE2JF8CtLF5W1e1XWcI> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _aKMym;
  H3NxUrmIatWHjGU32octXOFRSTp(this.attachedDatabase, [this._aKMym]);
  static const VerificationMeta _jycuHC = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tiaL2aVD8F1 = const VerificationMeta(
    'tareaId',
  );
  @override
  late final GeneratedColumn<String> tareaId = GeneratedColumn<String>(
    'tarea_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yOLyEH5Dwfm = const VerificationMeta(
    'autorId',
  );
  @override
  late final GeneratedColumn<String> autorId = GeneratedColumn<String>(
    'autor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _htPGUOwk9zf = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aJXdNUe6oIex = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tareaId,
    autorId,
    mensaje,
    creadoEn,
  ];
  @override
  String get aliasedName => _aKMym ?? actualTableName;
  @override
  String get actualTableName => dCyty;
  static const String dCyty = 'tarea_comentarios_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_jycuHC, id.isAcceptableOrUnknown(data['id']!, _jycuHC));
    } else if (isInserting) {
      context.missing(_jycuHC);
    }
    if (data.containsKey('tarea_id')) {
      context.handle(
        _tiaL2aVD8F1,
        tareaId.isAcceptableOrUnknown(data['tarea_id']!, _tiaL2aVD8F1),
      );
    } else if (isInserting) {
      context.missing(_tiaL2aVD8F1);
    }
    if (data.containsKey('autor_id')) {
      context.handle(
        _yOLyEH5Dwfm,
        autorId.isAcceptableOrUnknown(data['autor_id']!, _yOLyEH5Dwfm),
      );
    } else if (isInserting) {
      context.missing(_yOLyEH5Dwfm);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _htPGUOwk9zf,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _htPGUOwk9zf),
      );
    } else if (isInserting) {
      context.missing(_htPGUOwk9zf);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _aJXdNUe6oIex,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _aJXdNUe6oIex),
      );
    } else if (isInserting) {
      context.missing(_aJXdNUe6oIex);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PfsdSEuE2JF8CtLF5W1e1XWcI map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      iqe8oGs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarea_id'],
      )!,
      wlGHboV: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}autor_id'],
      )!,
      dCBTth4: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      vE15dpcm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  H3NxUrmIatWHjGU32octXOFRSTp createAlias(String alias) {
    return H3NxUrmIatWHjGU32octXOFRSTp(attachedDatabase, alias);
  }
}

class PfsdSEuE2JF8CtLF5W1e1XWcI extends DataClass
    implements Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> {
  final String gU;
  final String iqe8oGs;
  final String wlGHboV;
  final String dCBTth4;
  final DateTime vE15dpcm;
  const PfsdSEuE2JF8CtLF5W1e1XWcI({
    required this.gU,
    required this.iqe8oGs,
    required this.wlGHboV,
    required this.dCBTth4,
    required this.vE15dpcm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(gU);
    map['tarea_id'] = Variable<String>(iqe8oGs);
    map['autor_id'] = Variable<String>(wlGHboV);
    map['mensaje'] = Variable<String>(dCBTth4);
    map['creado_en'] = Variable<DateTime>(vE15dpcm);
    return map;
  }

  G4ZLuhxuHaVA2A7emAJSd9pokMajYj de3gw2mdvxe(bool nullToAbsent) {
    return G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
      dc: Value(gU),
      zQBZZlP: Value(iqe8oGs),
      t9Zc8W4: Value(wlGHboV),
      eYwLAmk: Value(dCBTth4),
      h5ANAMwE: Value(vE15dpcm),
    );
  }

  factory PfsdSEuE2JF8CtLF5W1e1XWcI.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: serializer.fromJson<String>(json['id']),
      iqe8oGs: serializer.fromJson<String>(json['tareaId']),
      wlGHboV: serializer.fromJson<String>(json['autorId']),
      dCBTth4: serializer.fromJson<String>(json['mensaje']),
      vE15dpcm: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(gU),
      'tareaId': serializer.toJson<String>(iqe8oGs),
      'autorId': serializer.toJson<String>(wlGHboV),
      'mensaje': serializer.toJson<String>(dCBTth4),
      'creadoEn': serializer.toJson<DateTime>(vE15dpcm),
    };
  }

  PfsdSEuE2JF8CtLF5W1e1XWcI fPDltanl({
    String? id,
    String? tareaId,
    String? autorId,
    String? mensaje,
    DateTime? creadoEn,
  }) => PfsdSEuE2JF8CtLF5W1e1XWcI(
    gU: id ?? this.gU,
    iqe8oGs: tareaId ?? this.iqe8oGs,
    wlGHboV: autorId ?? this.wlGHboV,
    dCBTth4: mensaje ?? this.dCBTth4,
    vE15dpcm: creadoEn ?? this.vE15dpcm,
  );
  PfsdSEuE2JF8CtLF5W1e1XWcI s0Qcpuy8SZExx5P4f(
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj data,
  ) {
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: data.dc.present ? data.dc.value : this.gU,
      iqe8oGs: data.zQBZZlP.present ? data.zQBZZlP.value : this.iqe8oGs,
      wlGHboV: data.t9Zc8W4.present ? data.t9Zc8W4.value : this.wlGHboV,
      dCBTth4: data.eYwLAmk.present ? data.eYwLAmk.value : this.dCBTth4,
      vE15dpcm: data.h5ANAMwE.present ? data.h5ANAMwE.value : this.vE15dpcm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareaComentariosTableData(')
          ..write('id: $gU, ')
          ..write('tareaId: $iqe8oGs, ')
          ..write('autorId: $wlGHboV, ')
          ..write('mensaje: $dCBTth4, ')
          ..write('creadoEn: $vE15dpcm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(gU, iqe8oGs, wlGHboV, dCBTth4, vE15dpcm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PfsdSEuE2JF8CtLF5W1e1XWcI &&
          other.gU == this.gU &&
          other.iqe8oGs == this.iqe8oGs &&
          other.wlGHboV == this.wlGHboV &&
          other.dCBTth4 == this.dCBTth4 &&
          other.vE15dpcm == this.vE15dpcm);
}

class G4ZLuhxuHaVA2A7emAJSd9pokMajYj
    extends UpdateCompanion<PfsdSEuE2JF8CtLF5W1e1XWcI> {
  final Value<String> dc;
  final Value<String> zQBZZlP;
  final Value<String> t9Zc8W4;
  final Value<String> eYwLAmk;
  final Value<DateTime> h5ANAMwE;
  final Value<int> ea0zu;
  const G4ZLuhxuHaVA2A7emAJSd9pokMajYj({
    this.dc = const Value.absent(),
    this.zQBZZlP = const Value.absent(),
    this.t9Zc8W4 = const Value.absent(),
    this.eYwLAmk = const Value.absent(),
    this.h5ANAMwE = const Value.absent(),
    this.ea0zu = const Value.absent(),
  });
  G4ZLuhxuHaVA2A7emAJSd9pokMajYj.insert({
    required String id,
    required String tareaId,
    required String autorId,
    required String mensaje,
    required DateTime creadoEn,
    this.ea0zu = const Value.absent(),
  }) : dc = Value(id),
       zQBZZlP = Value(tareaId),
       t9Zc8W4 = Value(autorId),
       eYwLAmk = Value(mensaje),
       h5ANAMwE = Value(creadoEn);
  static Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> o16sYt({
    Expression<String>? id,
    Expression<String>? tareaId,
    Expression<String>? autorId,
    Expression<String>? mensaje,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tareaId != null) 'tarea_id': tareaId,
      if (autorId != null) 'autor_id': autorId,
      if (mensaje != null) 'mensaje': mensaje,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  G4ZLuhxuHaVA2A7emAJSd9pokMajYj tfKxBinG({
    Value<String>? id,
    Value<String>? tareaId,
    Value<String>? autorId,
    Value<String>? mensaje,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
      dc: id ?? this.dc,
      zQBZZlP: tareaId ?? this.zQBZZlP,
      t9Zc8W4: autorId ?? this.t9Zc8W4,
      eYwLAmk: mensaje ?? this.eYwLAmk,
      h5ANAMwE: creadoEn ?? this.h5ANAMwE,
      ea0zu: rowid ?? this.ea0zu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dc.present) {
      map['id'] = Variable<String>(dc.value);
    }
    if (zQBZZlP.present) {
      map['tarea_id'] = Variable<String>(zQBZZlP.value);
    }
    if (t9Zc8W4.present) {
      map['autor_id'] = Variable<String>(t9Zc8W4.value);
    }
    if (eYwLAmk.present) {
      map['mensaje'] = Variable<String>(eYwLAmk.value);
    }
    if (h5ANAMwE.present) {
      map['creado_en'] = Variable<DateTime>(h5ANAMwE.value);
    }
    if (ea0zu.present) {
      map['rowid'] = Variable<int>(ea0zu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareaComentariosTableCompanion(')
          ..write('id: $dc, ')
          ..write('tareaId: $zQBZZlP, ')
          ..write('autorId: $t9Zc8W4, ')
          ..write('mensaje: $eYwLAmk, ')
          ..write('creadoEn: $h5ANAMwE, ')
          ..write('rowid: $ea0zu')
          ..write(')'))
        .toString();
  }
}

class TdpibLkvaSVlNdhYP94EMgY2 extends TareaAdjuntosTable
    with TableInfo<TdpibLkvaSVlNdhYP94EMgY2, Rot0adVvP5dwb2j4cDof6l> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _o97Ke;
  TdpibLkvaSVlNdhYP94EMgY2(this.attachedDatabase, [this._o97Ke]);
  static const VerificationMeta _c3055u = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pRU1EpZpYoa = const VerificationMeta(
    'tareaId',
  );
  @override
  late final GeneratedColumn<String> tareaId = GeneratedColumn<String>(
    'tarea_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shqpUYya = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _a75KbzHbHl = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iwAmSl4mpE8yp = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pMllJzkq99e2 = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _djXh5VLT6EK42 = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ivDT8bczsoti = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tareaId,
    tipo,
    nombre,
    localPath,
    mimeType,
    remoteUrl,
    creadoEn,
  ];
  @override
  String get aliasedName => _o97Ke ?? actualTableName;
  @override
  String get actualTableName => uMnBG;
  static const String uMnBG = 'tarea_adjuntos_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rot0adVvP5dwb2j4cDof6l> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_c3055u, id.isAcceptableOrUnknown(data['id']!, _c3055u));
    } else if (isInserting) {
      context.missing(_c3055u);
    }
    if (data.containsKey('tarea_id')) {
      context.handle(
        _pRU1EpZpYoa,
        tareaId.isAcceptableOrUnknown(data['tarea_id']!, _pRU1EpZpYoa),
      );
    } else if (isInserting) {
      context.missing(_pRU1EpZpYoa);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _shqpUYya,
        tipo.isAcceptableOrUnknown(data['tipo']!, _shqpUYya),
      );
    } else if (isInserting) {
      context.missing(_shqpUYya);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _a75KbzHbHl,
        nombre.isAcceptableOrUnknown(data['nombre']!, _a75KbzHbHl),
      );
    } else if (isInserting) {
      context.missing(_a75KbzHbHl);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _iwAmSl4mpE8yp,
        localPath.isAcceptableOrUnknown(data['local_path']!, _iwAmSl4mpE8yp),
      );
    } else if (isInserting) {
      context.missing(_iwAmSl4mpE8yp);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _pMllJzkq99e2,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _pMllJzkq99e2),
      );
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _djXh5VLT6EK42,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _djXh5VLT6EK42),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _ivDT8bczsoti,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _ivDT8bczsoti),
      );
    } else if (isInserting) {
      context.missing(_ivDT8bczsoti);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rot0adVvP5dwb2j4cDof6l map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rot0adVvP5dwb2j4cDof6l(
      bD: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      uHHdHYU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarea_id'],
      )!,
      bJjB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      bU7gaa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      uCI0oZ05u: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      nu37jWl2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      nYb2TcCaM: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      lvogrTK5: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  TdpibLkvaSVlNdhYP94EMgY2 createAlias(String alias) {
    return TdpibLkvaSVlNdhYP94EMgY2(attachedDatabase, alias);
  }
}

class Rot0adVvP5dwb2j4cDof6l extends DataClass
    implements Insertable<Rot0adVvP5dwb2j4cDof6l> {
  final String bD;
  final String uHHdHYU;

  final String bJjB;
  final String bU7gaa;
  final String uCI0oZ05u;
  final String? nu37jWl2;
  final String? nYb2TcCaM;
  final DateTime lvogrTK5;
  const Rot0adVvP5dwb2j4cDof6l({
    required this.bD,
    required this.uHHdHYU,
    required this.bJjB,
    required this.bU7gaa,
    required this.uCI0oZ05u,
    this.nu37jWl2,
    this.nYb2TcCaM,
    required this.lvogrTK5,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(bD);
    map['tarea_id'] = Variable<String>(uHHdHYU);
    map['tipo'] = Variable<String>(bJjB);
    map['nombre'] = Variable<String>(bU7gaa);
    map['local_path'] = Variable<String>(uCI0oZ05u);
    if (!nullToAbsent || nu37jWl2 != null) {
      map['mime_type'] = Variable<String>(nu37jWl2);
    }
    if (!nullToAbsent || nYb2TcCaM != null) {
      map['remote_url'] = Variable<String>(nYb2TcCaM);
    }
    map['creado_en'] = Variable<DateTime>(lvogrTK5);
    return map;
  }

  QlrnTCYlJIu0qdevCWFMOwRPuhb m5jvWT98nJX(bool nullToAbsent) {
    return QlrnTCYlJIu0qdevCWFMOwRPuhb(
      cC: Value(bD),
      x35Hv88: Value(uHHdHYU),
      hXAX: Value(bJjB),
      cSDgEc: Value(bU7gaa),
      tOyOIzLZx: Value(uCI0oZ05u),
      wvT2cjKQ: nu37jWl2 == null && nullToAbsent
          ? const Value.absent()
          : Value(nu37jWl2),
      r4cZYBdDG: nYb2TcCaM == null && nullToAbsent
          ? const Value.absent()
          : Value(nYb2TcCaM),
      kq5gx0Ow: Value(lvogrTK5),
    );
  }

  factory Rot0adVvP5dwb2j4cDof6l.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rot0adVvP5dwb2j4cDof6l(
      bD: serializer.fromJson<String>(json['id']),
      uHHdHYU: serializer.fromJson<String>(json['tareaId']),
      bJjB: serializer.fromJson<String>(json['tipo']),
      bU7gaa: serializer.fromJson<String>(json['nombre']),
      uCI0oZ05u: serializer.fromJson<String>(json['localPath']),
      nu37jWl2: serializer.fromJson<String?>(json['mimeType']),
      nYb2TcCaM: serializer.fromJson<String?>(json['remoteUrl']),
      lvogrTK5: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(bD),
      'tareaId': serializer.toJson<String>(uHHdHYU),
      'tipo': serializer.toJson<String>(bJjB),
      'nombre': serializer.toJson<String>(bU7gaa),
      'localPath': serializer.toJson<String>(uCI0oZ05u),
      'mimeType': serializer.toJson<String?>(nu37jWl2),
      'remoteUrl': serializer.toJson<String?>(nYb2TcCaM),
      'creadoEn': serializer.toJson<DateTime>(lvogrTK5),
    };
  }

  Rot0adVvP5dwb2j4cDof6l pqs0Nqb1({
    String? id,
    String? tareaId,
    String? tipo,
    String? nombre,
    String? localPath,
    Value<String?> mimeType = const Value.absent(),
    Value<String?> remoteUrl = const Value.absent(),
    DateTime? creadoEn,
  }) => Rot0adVvP5dwb2j4cDof6l(
    bD: id ?? this.bD,
    uHHdHYU: tareaId ?? this.uHHdHYU,
    bJjB: tipo ?? this.bJjB,
    bU7gaa: nombre ?? this.bU7gaa,
    uCI0oZ05u: localPath ?? this.uCI0oZ05u,
    nu37jWl2: mimeType.present ? mimeType.value : this.nu37jWl2,
    nYb2TcCaM: remoteUrl.present ? remoteUrl.value : this.nYb2TcCaM,
    lvogrTK5: creadoEn ?? this.lvogrTK5,
  );
  Rot0adVvP5dwb2j4cDof6l hmh3JmK8La3xvtHTX(QlrnTCYlJIu0qdevCWFMOwRPuhb data) {
    return Rot0adVvP5dwb2j4cDof6l(
      bD: data.cC.present ? data.cC.value : this.bD,
      uHHdHYU: data.x35Hv88.present ? data.x35Hv88.value : this.uHHdHYU,
      bJjB: data.hXAX.present ? data.hXAX.value : this.bJjB,
      bU7gaa: data.cSDgEc.present ? data.cSDgEc.value : this.bU7gaa,
      uCI0oZ05u: data.tOyOIzLZx.present ? data.tOyOIzLZx.value : this.uCI0oZ05u,
      nu37jWl2: data.wvT2cjKQ.present ? data.wvT2cjKQ.value : this.nu37jWl2,
      nYb2TcCaM: data.r4cZYBdDG.present ? data.r4cZYBdDG.value : this.nYb2TcCaM,
      lvogrTK5: data.kq5gx0Ow.present ? data.kq5gx0Ow.value : this.lvogrTK5,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareaAdjuntosTableData(')
          ..write('id: $bD, ')
          ..write('tareaId: $uHHdHYU, ')
          ..write('tipo: $bJjB, ')
          ..write('nombre: $bU7gaa, ')
          ..write('localPath: $uCI0oZ05u, ')
          ..write('mimeType: $nu37jWl2, ')
          ..write('remoteUrl: $nYb2TcCaM, ')
          ..write('creadoEn: $lvogrTK5')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    bD,
    uHHdHYU,
    bJjB,
    bU7gaa,
    uCI0oZ05u,
    nu37jWl2,
    nYb2TcCaM,
    lvogrTK5,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rot0adVvP5dwb2j4cDof6l &&
          other.bD == this.bD &&
          other.uHHdHYU == this.uHHdHYU &&
          other.bJjB == this.bJjB &&
          other.bU7gaa == this.bU7gaa &&
          other.uCI0oZ05u == this.uCI0oZ05u &&
          other.nu37jWl2 == this.nu37jWl2 &&
          other.nYb2TcCaM == this.nYb2TcCaM &&
          other.lvogrTK5 == this.lvogrTK5);
}

class QlrnTCYlJIu0qdevCWFMOwRPuhb
    extends UpdateCompanion<Rot0adVvP5dwb2j4cDof6l> {
  final Value<String> cC;
  final Value<String> x35Hv88;
  final Value<String> hXAX;
  final Value<String> cSDgEc;
  final Value<String> tOyOIzLZx;
  final Value<String?> wvT2cjKQ;
  final Value<String?> r4cZYBdDG;
  final Value<DateTime> kq5gx0Ow;
  final Value<int> tlaHb;
  const QlrnTCYlJIu0qdevCWFMOwRPuhb({
    this.cC = const Value.absent(),
    this.x35Hv88 = const Value.absent(),
    this.hXAX = const Value.absent(),
    this.cSDgEc = const Value.absent(),
    this.tOyOIzLZx = const Value.absent(),
    this.wvT2cjKQ = const Value.absent(),
    this.r4cZYBdDG = const Value.absent(),
    this.kq5gx0Ow = const Value.absent(),
    this.tlaHb = const Value.absent(),
  });
  QlrnTCYlJIu0qdevCWFMOwRPuhb.insert({
    required String id,
    required String tareaId,
    required String tipo,
    required String nombre,
    required String localPath,
    this.wvT2cjKQ = const Value.absent(),
    this.r4cZYBdDG = const Value.absent(),
    required DateTime creadoEn,
    this.tlaHb = const Value.absent(),
  }) : cC = Value(id),
       x35Hv88 = Value(tareaId),
       hXAX = Value(tipo),
       cSDgEc = Value(nombre),
       tOyOIzLZx = Value(localPath),
       kq5gx0Ow = Value(creadoEn);
  static Insertable<Rot0adVvP5dwb2j4cDof6l> ufP57S({
    Expression<String>? id,
    Expression<String>? tareaId,
    Expression<String>? tipo,
    Expression<String>? nombre,
    Expression<String>? localPath,
    Expression<String>? mimeType,
    Expression<String>? remoteUrl,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tareaId != null) 'tarea_id': tareaId,
      if (tipo != null) 'tipo': tipo,
      if (nombre != null) 'nombre': nombre,
      if (localPath != null) 'local_path': localPath,
      if (mimeType != null) 'mime_type': mimeType,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QlrnTCYlJIu0qdevCWFMOwRPuhb hRdgikGO({
    Value<String>? id,
    Value<String>? tareaId,
    Value<String>? tipo,
    Value<String>? nombre,
    Value<String>? localPath,
    Value<String?>? mimeType,
    Value<String?>? remoteUrl,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return QlrnTCYlJIu0qdevCWFMOwRPuhb(
      cC: id ?? this.cC,
      x35Hv88: tareaId ?? this.x35Hv88,
      hXAX: tipo ?? this.hXAX,
      cSDgEc: nombre ?? this.cSDgEc,
      tOyOIzLZx: localPath ?? this.tOyOIzLZx,
      wvT2cjKQ: mimeType ?? this.wvT2cjKQ,
      r4cZYBdDG: remoteUrl ?? this.r4cZYBdDG,
      kq5gx0Ow: creadoEn ?? this.kq5gx0Ow,
      tlaHb: rowid ?? this.tlaHb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cC.present) {
      map['id'] = Variable<String>(cC.value);
    }
    if (x35Hv88.present) {
      map['tarea_id'] = Variable<String>(x35Hv88.value);
    }
    if (hXAX.present) {
      map['tipo'] = Variable<String>(hXAX.value);
    }
    if (cSDgEc.present) {
      map['nombre'] = Variable<String>(cSDgEc.value);
    }
    if (tOyOIzLZx.present) {
      map['local_path'] = Variable<String>(tOyOIzLZx.value);
    }
    if (wvT2cjKQ.present) {
      map['mime_type'] = Variable<String>(wvT2cjKQ.value);
    }
    if (r4cZYBdDG.present) {
      map['remote_url'] = Variable<String>(r4cZYBdDG.value);
    }
    if (kq5gx0Ow.present) {
      map['creado_en'] = Variable<DateTime>(kq5gx0Ow.value);
    }
    if (tlaHb.present) {
      map['rowid'] = Variable<int>(tlaHb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareaAdjuntosTableCompanion(')
          ..write('id: $cC, ')
          ..write('tareaId: $x35Hv88, ')
          ..write('tipo: $hXAX, ')
          ..write('nombre: $cSDgEc, ')
          ..write('localPath: $tOyOIzLZx, ')
          ..write('mimeType: $wvT2cjKQ, ')
          ..write('remoteUrl: $r4cZYBdDG, ')
          ..write('creadoEn: $kq5gx0Ow, ')
          ..write('rowid: $tlaHb')
          ..write(')'))
        .toString();
  }
}

class OZOvvqDyixK8vCrBMu7 extends ReportesTable
    with TableInfo<OZOvvqDyixK8vCrBMu7, S3xRBVOlVfAQliETU> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _tC3ha;
  OZOvvqDyixK8vCrBMu7(this.attachedDatabase, [this._tC3ha]);
  static const VerificationMeta _i3fUtv = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uaTpnqfZWu = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lQmbOu4rDfVMUum = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yVcXRLTiguLK1 = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wA12umMY = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mJO3rsTH2z = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<String> activo = GeneratedColumn<String>(
    'activo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vyCcNW8gAY4kY = const VerificationMeta(
    'ubicacion',
  );
  @override
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
    'ubicacion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sqoocUoIqcEfJ = const VerificationMeta(
    'creadoPor',
  );
  @override
  late final GeneratedColumn<String> creadoPor = GeneratedColumn<String>(
    'creado_por',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iiTDkg5DGX0i = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wdffLvd0vt = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _d7vceXBnC41xc8XI = const VerificationMeta(
    'glpiTicketId',
  );
  @override
  late final GeneratedColumn<String> glpiTicketId = GeneratedColumn<String>(
    'glpi_ticket_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ntN9VMMrghjv = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titulo,
    descripcion,
    categoria,
    area,
    activo,
    ubicacion,
    creadoPor,
    creadoEn,
    estado,
    glpiTicketId,
    metadata,
  ];
  @override
  String get aliasedName => _tC3ha ?? actualTableName;
  @override
  String get actualTableName => mIrLS;
  static const String mIrLS = 'reportes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<S3xRBVOlVfAQliETU> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_i3fUtv, id.isAcceptableOrUnknown(data['id']!, _i3fUtv));
    } else if (isInserting) {
      context.missing(_i3fUtv);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _uaTpnqfZWu,
        titulo.isAcceptableOrUnknown(data['titulo']!, _uaTpnqfZWu),
      );
    } else if (isInserting) {
      context.missing(_uaTpnqfZWu);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _lQmbOu4rDfVMUum,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _lQmbOu4rDfVMUum,
        ),
      );
    } else if (isInserting) {
      context.missing(_lQmbOu4rDfVMUum);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _yVcXRLTiguLK1,
        categoria.isAcceptableOrUnknown(data['categoria']!, _yVcXRLTiguLK1),
      );
    } else if (isInserting) {
      context.missing(_yVcXRLTiguLK1);
    }
    if (data.containsKey('area')) {
      context.handle(
        _wA12umMY,
        area.isAcceptableOrUnknown(data['area']!, _wA12umMY),
      );
    } else if (isInserting) {
      context.missing(_wA12umMY);
    }
    if (data.containsKey('activo')) {
      context.handle(
        _mJO3rsTH2z,
        activo.isAcceptableOrUnknown(data['activo']!, _mJO3rsTH2z),
      );
    }
    if (data.containsKey('ubicacion')) {
      context.handle(
        _vyCcNW8gAY4kY,
        ubicacion.isAcceptableOrUnknown(data['ubicacion']!, _vyCcNW8gAY4kY),
      );
    }
    if (data.containsKey('creado_por')) {
      context.handle(
        _sqoocUoIqcEfJ,
        creadoPor.isAcceptableOrUnknown(data['creado_por']!, _sqoocUoIqcEfJ),
      );
    } else if (isInserting) {
      context.missing(_sqoocUoIqcEfJ);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _iiTDkg5DGX0i,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _iiTDkg5DGX0i),
      );
    } else if (isInserting) {
      context.missing(_iiTDkg5DGX0i);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _wdffLvd0vt,
        estado.isAcceptableOrUnknown(data['estado']!, _wdffLvd0vt),
      );
    } else if (isInserting) {
      context.missing(_wdffLvd0vt);
    }
    if (data.containsKey('glpi_ticket_id')) {
      context.handle(
        _d7vceXBnC41xc8XI,
        glpiTicketId.isAcceptableOrUnknown(
          data['glpi_ticket_id']!,
          _d7vceXBnC41xc8XI,
        ),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _ntN9VMMrghjv,
        metadata.isAcceptableOrUnknown(data['metadata']!, _ntN9VMMrghjv),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  S3xRBVOlVfAQliETU map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return S3xRBVOlVfAQliETU(
      nx: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      eSQzqp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      plaYFlFJCxg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      stjU9X1b0: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      veGo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
      pqL3rx: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activo'],
      ),
      fxELBjh8A: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ubicacion'],
      ),
      kXOJWalAe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creado_por'],
      )!,
      xgkgTziM: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
      nTzX77: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      sQVQvBq0KXnz: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}glpi_ticket_id'],
      ),
      j7eK0cVO: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
    );
  }

  @override
  OZOvvqDyixK8vCrBMu7 createAlias(String alias) {
    return OZOvvqDyixK8vCrBMu7(attachedDatabase, alias);
  }
}

class S3xRBVOlVfAQliETU extends DataClass
    implements Insertable<S3xRBVOlVfAQliETU> {
  final String nx;
  final String eSQzqp;
  final String plaYFlFJCxg;
  final String stjU9X1b0;
  final String veGo;
  final String? pqL3rx;
  final String? fxELBjh8A;
  final String kXOJWalAe;
  final DateTime xgkgTziM;
  final String nTzX77;
  final String? sQVQvBq0KXnz;
  final String? j7eK0cVO;
  const S3xRBVOlVfAQliETU({
    required this.nx,
    required this.eSQzqp,
    required this.plaYFlFJCxg,
    required this.stjU9X1b0,
    required this.veGo,
    this.pqL3rx,
    this.fxELBjh8A,
    required this.kXOJWalAe,
    required this.xgkgTziM,
    required this.nTzX77,
    this.sQVQvBq0KXnz,
    this.j7eK0cVO,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(nx);
    map['titulo'] = Variable<String>(eSQzqp);
    map['descripcion'] = Variable<String>(plaYFlFJCxg);
    map['categoria'] = Variable<String>(stjU9X1b0);
    map['area'] = Variable<String>(veGo);
    if (!nullToAbsent || pqL3rx != null) {
      map['activo'] = Variable<String>(pqL3rx);
    }
    if (!nullToAbsent || fxELBjh8A != null) {
      map['ubicacion'] = Variable<String>(fxELBjh8A);
    }
    map['creado_por'] = Variable<String>(kXOJWalAe);
    map['creado_en'] = Variable<DateTime>(xgkgTziM);
    map['estado'] = Variable<String>(nTzX77);
    if (!nullToAbsent || sQVQvBq0KXnz != null) {
      map['glpi_ticket_id'] = Variable<String>(sQVQvBq0KXnz);
    }
    if (!nullToAbsent || j7eK0cVO != null) {
      map['metadata'] = Variable<String>(j7eK0cVO);
    }
    return map;
  }

  HX2XOaxsqSn5sDql3bDAkn iycvKcFTEuX(bool nullToAbsent) {
    return HX2XOaxsqSn5sDql3bDAkn(
      wv: Value(nx),
      fwUC6v: Value(eSQzqp),
      yQ3xXO7Rua8: Value(plaYFlFJCxg),
      bsWB13P0F: Value(stjU9X1b0),
      pAUt: Value(veGo),
      hqptn4: pqL3rx == null && nullToAbsent
          ? const Value.absent()
          : Value(pqL3rx),
      v4bMkOtju: fxELBjh8A == null && nullToAbsent
          ? const Value.absent()
          : Value(fxELBjh8A),
      r8Zq7Nq7S: Value(kXOJWalAe),
      kIW1poxd: Value(xgkgTziM),
      cgnYnB: Value(nTzX77),
      d6UYuTd488y5: sQVQvBq0KXnz == null && nullToAbsent
          ? const Value.absent()
          : Value(sQVQvBq0KXnz),
      leyqxQiP: j7eK0cVO == null && nullToAbsent
          ? const Value.absent()
          : Value(j7eK0cVO),
    );
  }

  factory S3xRBVOlVfAQliETU.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return S3xRBVOlVfAQliETU(
      nx: serializer.fromJson<String>(json['id']),
      eSQzqp: serializer.fromJson<String>(json['titulo']),
      plaYFlFJCxg: serializer.fromJson<String>(json['descripcion']),
      stjU9X1b0: serializer.fromJson<String>(json['categoria']),
      veGo: serializer.fromJson<String>(json['area']),
      pqL3rx: serializer.fromJson<String?>(json['activo']),
      fxELBjh8A: serializer.fromJson<String?>(json['ubicacion']),
      kXOJWalAe: serializer.fromJson<String>(json['creadoPor']),
      xgkgTziM: serializer.fromJson<DateTime>(json['creadoEn']),
      nTzX77: serializer.fromJson<String>(json['estado']),
      sQVQvBq0KXnz: serializer.fromJson<String?>(json['glpiTicketId']),
      j7eK0cVO: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(nx),
      'titulo': serializer.toJson<String>(eSQzqp),
      'descripcion': serializer.toJson<String>(plaYFlFJCxg),
      'categoria': serializer.toJson<String>(stjU9X1b0),
      'area': serializer.toJson<String>(veGo),
      'activo': serializer.toJson<String?>(pqL3rx),
      'ubicacion': serializer.toJson<String?>(fxELBjh8A),
      'creadoPor': serializer.toJson<String>(kXOJWalAe),
      'creadoEn': serializer.toJson<DateTime>(xgkgTziM),
      'estado': serializer.toJson<String>(nTzX77),
      'glpiTicketId': serializer.toJson<String?>(sQVQvBq0KXnz),
      'metadata': serializer.toJson<String?>(j7eK0cVO),
    };
  }

  S3xRBVOlVfAQliETU f9XyNqfv({
    String? id,
    String? titulo,
    String? descripcion,
    String? categoria,
    String? area,
    Value<String?> activo = const Value.absent(),
    Value<String?> ubicacion = const Value.absent(),
    String? creadoPor,
    DateTime? creadoEn,
    String? estado,
    Value<String?> glpiTicketId = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
  }) => S3xRBVOlVfAQliETU(
    nx: id ?? this.nx,
    eSQzqp: titulo ?? this.eSQzqp,
    plaYFlFJCxg: descripcion ?? this.plaYFlFJCxg,
    stjU9X1b0: categoria ?? this.stjU9X1b0,
    veGo: area ?? this.veGo,
    pqL3rx: activo.present ? activo.value : this.pqL3rx,
    fxELBjh8A: ubicacion.present ? ubicacion.value : this.fxELBjh8A,
    kXOJWalAe: creadoPor ?? this.kXOJWalAe,
    xgkgTziM: creadoEn ?? this.xgkgTziM,
    nTzX77: estado ?? this.nTzX77,
    sQVQvBq0KXnz: glpiTicketId.present ? glpiTicketId.value : this.sQVQvBq0KXnz,
    j7eK0cVO: metadata.present ? metadata.value : this.j7eK0cVO,
  );
  S3xRBVOlVfAQliETU ffj8LSco7uFRh5a2y(HX2XOaxsqSn5sDql3bDAkn data) {
    return S3xRBVOlVfAQliETU(
      nx: data.wv.present ? data.wv.value : this.nx,
      eSQzqp: data.fwUC6v.present ? data.fwUC6v.value : this.eSQzqp,
      plaYFlFJCxg: data.yQ3xXO7Rua8.present
          ? data.yQ3xXO7Rua8.value
          : this.plaYFlFJCxg,
      stjU9X1b0: data.bsWB13P0F.present ? data.bsWB13P0F.value : this.stjU9X1b0,
      veGo: data.pAUt.present ? data.pAUt.value : this.veGo,
      pqL3rx: data.hqptn4.present ? data.hqptn4.value : this.pqL3rx,
      fxELBjh8A: data.v4bMkOtju.present ? data.v4bMkOtju.value : this.fxELBjh8A,
      kXOJWalAe: data.r8Zq7Nq7S.present ? data.r8Zq7Nq7S.value : this.kXOJWalAe,
      xgkgTziM: data.kIW1poxd.present ? data.kIW1poxd.value : this.xgkgTziM,
      nTzX77: data.cgnYnB.present ? data.cgnYnB.value : this.nTzX77,
      sQVQvBq0KXnz: data.d6UYuTd488y5.present
          ? data.d6UYuTd488y5.value
          : this.sQVQvBq0KXnz,
      j7eK0cVO: data.leyqxQiP.present ? data.leyqxQiP.value : this.j7eK0cVO,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportesTableData(')
          ..write('id: $nx, ')
          ..write('titulo: $eSQzqp, ')
          ..write('descripcion: $plaYFlFJCxg, ')
          ..write('categoria: $stjU9X1b0, ')
          ..write('area: $veGo, ')
          ..write('activo: $pqL3rx, ')
          ..write('ubicacion: $fxELBjh8A, ')
          ..write('creadoPor: $kXOJWalAe, ')
          ..write('creadoEn: $xgkgTziM, ')
          ..write('estado: $nTzX77, ')
          ..write('glpiTicketId: $sQVQvBq0KXnz, ')
          ..write('metadata: $j7eK0cVO')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    nx,
    eSQzqp,
    plaYFlFJCxg,
    stjU9X1b0,
    veGo,
    pqL3rx,
    fxELBjh8A,
    kXOJWalAe,
    xgkgTziM,
    nTzX77,
    sQVQvBq0KXnz,
    j7eK0cVO,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is S3xRBVOlVfAQliETU &&
          other.nx == this.nx &&
          other.eSQzqp == this.eSQzqp &&
          other.plaYFlFJCxg == this.plaYFlFJCxg &&
          other.stjU9X1b0 == this.stjU9X1b0 &&
          other.veGo == this.veGo &&
          other.pqL3rx == this.pqL3rx &&
          other.fxELBjh8A == this.fxELBjh8A &&
          other.kXOJWalAe == this.kXOJWalAe &&
          other.xgkgTziM == this.xgkgTziM &&
          other.nTzX77 == this.nTzX77 &&
          other.sQVQvBq0KXnz == this.sQVQvBq0KXnz &&
          other.j7eK0cVO == this.j7eK0cVO);
}

class HX2XOaxsqSn5sDql3bDAkn extends UpdateCompanion<S3xRBVOlVfAQliETU> {
  final Value<String> wv;
  final Value<String> fwUC6v;
  final Value<String> yQ3xXO7Rua8;
  final Value<String> bsWB13P0F;
  final Value<String> pAUt;
  final Value<String?> hqptn4;
  final Value<String?> v4bMkOtju;
  final Value<String> r8Zq7Nq7S;
  final Value<DateTime> kIW1poxd;
  final Value<String> cgnYnB;
  final Value<String?> d6UYuTd488y5;
  final Value<String?> leyqxQiP;
  final Value<int> cGghm;
  const HX2XOaxsqSn5sDql3bDAkn({
    this.wv = const Value.absent(),
    this.fwUC6v = const Value.absent(),
    this.yQ3xXO7Rua8 = const Value.absent(),
    this.bsWB13P0F = const Value.absent(),
    this.pAUt = const Value.absent(),
    this.hqptn4 = const Value.absent(),
    this.v4bMkOtju = const Value.absent(),
    this.r8Zq7Nq7S = const Value.absent(),
    this.kIW1poxd = const Value.absent(),
    this.cgnYnB = const Value.absent(),
    this.d6UYuTd488y5 = const Value.absent(),
    this.leyqxQiP = const Value.absent(),
    this.cGghm = const Value.absent(),
  });
  HX2XOaxsqSn5sDql3bDAkn.insert({
    required String id,
    required String titulo,
    required String descripcion,
    required String categoria,
    required String area,
    this.hqptn4 = const Value.absent(),
    this.v4bMkOtju = const Value.absent(),
    required String creadoPor,
    required DateTime creadoEn,
    required String estado,
    this.d6UYuTd488y5 = const Value.absent(),
    this.leyqxQiP = const Value.absent(),
    this.cGghm = const Value.absent(),
  }) : wv = Value(id),
       fwUC6v = Value(titulo),
       yQ3xXO7Rua8 = Value(descripcion),
       bsWB13P0F = Value(categoria),
       pAUt = Value(area),
       r8Zq7Nq7S = Value(creadoPor),
       kIW1poxd = Value(creadoEn),
       cgnYnB = Value(estado);
  static Insertable<S3xRBVOlVfAQliETU> hv0lId({
    Expression<String>? id,
    Expression<String>? titulo,
    Expression<String>? descripcion,
    Expression<String>? categoria,
    Expression<String>? area,
    Expression<String>? activo,
    Expression<String>? ubicacion,
    Expression<String>? creadoPor,
    Expression<DateTime>? creadoEn,
    Expression<String>? estado,
    Expression<String>? glpiTicketId,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (descripcion != null) 'descripcion': descripcion,
      if (categoria != null) 'categoria': categoria,
      if (area != null) 'area': area,
      if (activo != null) 'activo': activo,
      if (ubicacion != null) 'ubicacion': ubicacion,
      if (creadoPor != null) 'creado_por': creadoPor,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (estado != null) 'estado': estado,
      if (glpiTicketId != null) 'glpi_ticket_id': glpiTicketId,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HX2XOaxsqSn5sDql3bDAkn hXosAHt9({
    Value<String>? id,
    Value<String>? titulo,
    Value<String>? descripcion,
    Value<String>? categoria,
    Value<String>? area,
    Value<String?>? activo,
    Value<String?>? ubicacion,
    Value<String>? creadoPor,
    Value<DateTime>? creadoEn,
    Value<String>? estado,
    Value<String?>? glpiTicketId,
    Value<String?>? metadata,
    Value<int>? rowid,
  }) {
    return HX2XOaxsqSn5sDql3bDAkn(
      wv: id ?? this.wv,
      fwUC6v: titulo ?? this.fwUC6v,
      yQ3xXO7Rua8: descripcion ?? this.yQ3xXO7Rua8,
      bsWB13P0F: categoria ?? this.bsWB13P0F,
      pAUt: area ?? this.pAUt,
      hqptn4: activo ?? this.hqptn4,
      v4bMkOtju: ubicacion ?? this.v4bMkOtju,
      r8Zq7Nq7S: creadoPor ?? this.r8Zq7Nq7S,
      kIW1poxd: creadoEn ?? this.kIW1poxd,
      cgnYnB: estado ?? this.cgnYnB,
      d6UYuTd488y5: glpiTicketId ?? this.d6UYuTd488y5,
      leyqxQiP: metadata ?? this.leyqxQiP,
      cGghm: rowid ?? this.cGghm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wv.present) {
      map['id'] = Variable<String>(wv.value);
    }
    if (fwUC6v.present) {
      map['titulo'] = Variable<String>(fwUC6v.value);
    }
    if (yQ3xXO7Rua8.present) {
      map['descripcion'] = Variable<String>(yQ3xXO7Rua8.value);
    }
    if (bsWB13P0F.present) {
      map['categoria'] = Variable<String>(bsWB13P0F.value);
    }
    if (pAUt.present) {
      map['area'] = Variable<String>(pAUt.value);
    }
    if (hqptn4.present) {
      map['activo'] = Variable<String>(hqptn4.value);
    }
    if (v4bMkOtju.present) {
      map['ubicacion'] = Variable<String>(v4bMkOtju.value);
    }
    if (r8Zq7Nq7S.present) {
      map['creado_por'] = Variable<String>(r8Zq7Nq7S.value);
    }
    if (kIW1poxd.present) {
      map['creado_en'] = Variable<DateTime>(kIW1poxd.value);
    }
    if (cgnYnB.present) {
      map['estado'] = Variable<String>(cgnYnB.value);
    }
    if (d6UYuTd488y5.present) {
      map['glpi_ticket_id'] = Variable<String>(d6UYuTd488y5.value);
    }
    if (leyqxQiP.present) {
      map['metadata'] = Variable<String>(leyqxQiP.value);
    }
    if (cGghm.present) {
      map['rowid'] = Variable<int>(cGghm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportesTableCompanion(')
          ..write('id: $wv, ')
          ..write('titulo: $fwUC6v, ')
          ..write('descripcion: $yQ3xXO7Rua8, ')
          ..write('categoria: $bsWB13P0F, ')
          ..write('area: $pAUt, ')
          ..write('activo: $hqptn4, ')
          ..write('ubicacion: $v4bMkOtju, ')
          ..write('creadoPor: $r8Zq7Nq7S, ')
          ..write('creadoEn: $kIW1poxd, ')
          ..write('estado: $cgnYnB, ')
          ..write('glpiTicketId: $d6UYuTd488y5, ')
          ..write('metadata: $leyqxQiP, ')
          ..write('rowid: $cGghm')
          ..write(')'))
        .toString();
  }
}

class BoBcnkhdbLdMOgKtsin3TNgWX7CJA extends ReporteComentariosTable
    with TableInfo<BoBcnkhdbLdMOgKtsin3TNgWX7CJA, ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _qyaoV;
  BoBcnkhdbLdMOgKtsin3TNgWX7CJA(this.attachedDatabase, [this._qyaoV]);
  static const VerificationMeta _kolfjx = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lwj7tBMB5vdNl = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eFvu2Ftd5yy = const VerificationMeta(
    'autorId',
  );
  @override
  late final GeneratedColumn<String> autorId = GeneratedColumn<String>(
    'autor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zlQPsEuLUMr = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nWL2Kh4RggTO = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reporteId,
    autorId,
    mensaje,
    creadoEn,
  ];
  @override
  String get aliasedName => _qyaoV ?? actualTableName;
  @override
  String get actualTableName => b8oXv;
  static const String b8oXv = 'reporte_comentarios_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_kolfjx, id.isAcceptableOrUnknown(data['id']!, _kolfjx));
    } else if (isInserting) {
      context.missing(_kolfjx);
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _lwj7tBMB5vdNl,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _lwj7tBMB5vdNl),
      );
    } else if (isInserting) {
      context.missing(_lwj7tBMB5vdNl);
    }
    if (data.containsKey('autor_id')) {
      context.handle(
        _eFvu2Ftd5yy,
        autorId.isAcceptableOrUnknown(data['autor_id']!, _eFvu2Ftd5yy),
      );
    } else if (isInserting) {
      context.missing(_eFvu2Ftd5yy);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _zlQPsEuLUMr,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _zlQPsEuLUMr),
      );
    } else if (isInserting) {
      context.missing(_zlQPsEuLUMr);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _nWL2Kh4RggTO,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _nWL2Kh4RggTO),
      );
    } else if (isInserting) {
      context.missing(_nWL2Kh4RggTO);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ARpUcXEcU4toxru8LMyBl7DV8Cd map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      aSQn8lD1x: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      p7ebMBe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}autor_id'],
      )!,
      a3tNLNJ: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      lILfrcKI: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  BoBcnkhdbLdMOgKtsin3TNgWX7CJA createAlias(String alias) {
    return BoBcnkhdbLdMOgKtsin3TNgWX7CJA(attachedDatabase, alias);
  }
}

class ARpUcXEcU4toxru8LMyBl7DV8Cd extends DataClass
    implements Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  final String l1;
  final String aSQn8lD1x;
  final String p7ebMBe;
  final String a3tNLNJ;
  final DateTime lILfrcKI;
  const ARpUcXEcU4toxru8LMyBl7DV8Cd({
    required this.l1,
    required this.aSQn8lD1x,
    required this.p7ebMBe,
    required this.a3tNLNJ,
    required this.lILfrcKI,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(l1);
    map['reporte_id'] = Variable<String>(aSQn8lD1x);
    map['autor_id'] = Variable<String>(p7ebMBe);
    map['mensaje'] = Variable<String>(a3tNLNJ);
    map['creado_en'] = Variable<DateTime>(lILfrcKI);
    return map;
  }

  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB ciSD2AEfHP5(bool nullToAbsent) {
    return MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
      vH: Value(l1),
      fWiwTihJ5: Value(aSQn8lD1x),
      peeUJ61: Value(p7ebMBe),
      rgBeY5W: Value(a3tNLNJ),
      pWlpsCw4: Value(lILfrcKI),
    );
  }

  factory ARpUcXEcU4toxru8LMyBl7DV8Cd.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: serializer.fromJson<String>(json['id']),
      aSQn8lD1x: serializer.fromJson<String>(json['reporteId']),
      p7ebMBe: serializer.fromJson<String>(json['autorId']),
      a3tNLNJ: serializer.fromJson<String>(json['mensaje']),
      lILfrcKI: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(l1),
      'reporteId': serializer.toJson<String>(aSQn8lD1x),
      'autorId': serializer.toJson<String>(p7ebMBe),
      'mensaje': serializer.toJson<String>(a3tNLNJ),
      'creadoEn': serializer.toJson<DateTime>(lILfrcKI),
    };
  }

  ARpUcXEcU4toxru8LMyBl7DV8Cd bocs9vpG({
    String? id,
    String? reporteId,
    String? autorId,
    String? mensaje,
    DateTime? creadoEn,
  }) => ARpUcXEcU4toxru8LMyBl7DV8Cd(
    l1: id ?? this.l1,
    aSQn8lD1x: reporteId ?? this.aSQn8lD1x,
    p7ebMBe: autorId ?? this.p7ebMBe,
    a3tNLNJ: mensaje ?? this.a3tNLNJ,
    lILfrcKI: creadoEn ?? this.lILfrcKI,
  );
  ARpUcXEcU4toxru8LMyBl7DV8Cd sCilnkVXWwmaN9vkv(
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB data,
  ) {
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: data.vH.present ? data.vH.value : this.l1,
      aSQn8lD1x: data.fWiwTihJ5.present ? data.fWiwTihJ5.value : this.aSQn8lD1x,
      p7ebMBe: data.peeUJ61.present ? data.peeUJ61.value : this.p7ebMBe,
      a3tNLNJ: data.rgBeY5W.present ? data.rgBeY5W.value : this.a3tNLNJ,
      lILfrcKI: data.pWlpsCw4.present ? data.pWlpsCw4.value : this.lILfrcKI,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteComentariosTableData(')
          ..write('id: $l1, ')
          ..write('reporteId: $aSQn8lD1x, ')
          ..write('autorId: $p7ebMBe, ')
          ..write('mensaje: $a3tNLNJ, ')
          ..write('creadoEn: $lILfrcKI')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(l1, aSQn8lD1x, p7ebMBe, a3tNLNJ, lILfrcKI);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ARpUcXEcU4toxru8LMyBl7DV8Cd &&
          other.l1 == this.l1 &&
          other.aSQn8lD1x == this.aSQn8lD1x &&
          other.p7ebMBe == this.p7ebMBe &&
          other.a3tNLNJ == this.a3tNLNJ &&
          other.lILfrcKI == this.lILfrcKI);
}

class MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB
    extends UpdateCompanion<ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  final Value<String> vH;
  final Value<String> fWiwTihJ5;
  final Value<String> peeUJ61;
  final Value<String> rgBeY5W;
  final Value<DateTime> pWlpsCw4;
  final Value<int> rL8KS;
  const MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB({
    this.vH = const Value.absent(),
    this.fWiwTihJ5 = const Value.absent(),
    this.peeUJ61 = const Value.absent(),
    this.rgBeY5W = const Value.absent(),
    this.pWlpsCw4 = const Value.absent(),
    this.rL8KS = const Value.absent(),
  });
  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB.insert({
    required String id,
    required String reporteId,
    required String autorId,
    required String mensaje,
    required DateTime creadoEn,
    this.rL8KS = const Value.absent(),
  }) : vH = Value(id),
       fWiwTihJ5 = Value(reporteId),
       peeUJ61 = Value(autorId),
       rgBeY5W = Value(mensaje),
       pWlpsCw4 = Value(creadoEn);
  static Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> jigiVx({
    Expression<String>? id,
    Expression<String>? reporteId,
    Expression<String>? autorId,
    Expression<String>? mensaje,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reporteId != null) 'reporte_id': reporteId,
      if (autorId != null) 'autor_id': autorId,
      if (mensaje != null) 'mensaje': mensaje,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB gsnOSHml({
    Value<String>? id,
    Value<String>? reporteId,
    Value<String>? autorId,
    Value<String>? mensaje,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
      vH: id ?? this.vH,
      fWiwTihJ5: reporteId ?? this.fWiwTihJ5,
      peeUJ61: autorId ?? this.peeUJ61,
      rgBeY5W: mensaje ?? this.rgBeY5W,
      pWlpsCw4: creadoEn ?? this.pWlpsCw4,
      rL8KS: rowid ?? this.rL8KS,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vH.present) {
      map['id'] = Variable<String>(vH.value);
    }
    if (fWiwTihJ5.present) {
      map['reporte_id'] = Variable<String>(fWiwTihJ5.value);
    }
    if (peeUJ61.present) {
      map['autor_id'] = Variable<String>(peeUJ61.value);
    }
    if (rgBeY5W.present) {
      map['mensaje'] = Variable<String>(rgBeY5W.value);
    }
    if (pWlpsCw4.present) {
      map['creado_en'] = Variable<DateTime>(pWlpsCw4.value);
    }
    if (rL8KS.present) {
      map['rowid'] = Variable<int>(rL8KS.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteComentariosTableCompanion(')
          ..write('id: $vH, ')
          ..write('reporteId: $fWiwTihJ5, ')
          ..write('autorId: $peeUJ61, ')
          ..write('mensaje: $rgBeY5W, ')
          ..write('creadoEn: $pWlpsCw4, ')
          ..write('rowid: $rL8KS')
          ..write(')'))
        .toString();
  }
}

class YoNU9Kgod2bozlWwHlObWuuh62Da extends ReporteEvidenciasTable
    with TableInfo<YoNU9Kgod2bozlWwHlObWuuh62Da, MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _c51QX;
  YoNU9Kgod2bozlWwHlObWuuh62Da(this.attachedDatabase, [this._c51QX]);
  static const VerificationMeta _oe1aSw = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _l82Y3Ph7MlPH0 = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nC0DDLX3 = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dXQCt1Attq = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jp5BD1FpWN7DF = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hrU6DGiET8dJ7 = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lecsna93RuR3 = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reporteId,
    tipo,
    nombre,
    localPath,
    remoteUrl,
    creadoEn,
  ];
  @override
  String get aliasedName => _c51QX ?? actualTableName;
  @override
  String get actualTableName => h68Ow;
  static const String h68Ow = 'reporte_evidencias_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_oe1aSw, id.isAcceptableOrUnknown(data['id']!, _oe1aSw));
    } else if (isInserting) {
      context.missing(_oe1aSw);
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _l82Y3Ph7MlPH0,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _l82Y3Ph7MlPH0),
      );
    } else if (isInserting) {
      context.missing(_l82Y3Ph7MlPH0);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _nC0DDLX3,
        tipo.isAcceptableOrUnknown(data['tipo']!, _nC0DDLX3),
      );
    } else if (isInserting) {
      context.missing(_nC0DDLX3);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _dXQCt1Attq,
        nombre.isAcceptableOrUnknown(data['nombre']!, _dXQCt1Attq),
      );
    } else if (isInserting) {
      context.missing(_dXQCt1Attq);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _jp5BD1FpWN7DF,
        localPath.isAcceptableOrUnknown(data['local_path']!, _jp5BD1FpWN7DF),
      );
    } else if (isInserting) {
      context.missing(_jp5BD1FpWN7DF);
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _hrU6DGiET8dJ7,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _hrU6DGiET8dJ7),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _lecsna93RuR3,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _lecsna93RuR3),
      );
    } else if (isInserting) {
      context.missing(_lecsna93RuR3);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MqgZIJIZuGbeC3uaGFcCBQmY7J map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      k0zETwpTK: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      bTBb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      nPdQ1y: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      qIgsNXgNr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      aFAL0xL46: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      b2oRoMaV: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  YoNU9Kgod2bozlWwHlObWuuh62Da createAlias(String alias) {
    return YoNU9Kgod2bozlWwHlObWuuh62Da(attachedDatabase, alias);
  }
}

class MqgZIJIZuGbeC3uaGFcCBQmY7J extends DataClass
    implements Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  final String aU;
  final String k0zETwpTK;
  final String bTBb;
  final String nPdQ1y;
  final String qIgsNXgNr;
  final String? aFAL0xL46;
  final DateTime b2oRoMaV;
  const MqgZIJIZuGbeC3uaGFcCBQmY7J({
    required this.aU,
    required this.k0zETwpTK,
    required this.bTBb,
    required this.nPdQ1y,
    required this.qIgsNXgNr,
    this.aFAL0xL46,
    required this.b2oRoMaV,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(aU);
    map['reporte_id'] = Variable<String>(k0zETwpTK);
    map['tipo'] = Variable<String>(bTBb);
    map['nombre'] = Variable<String>(nPdQ1y);
    map['local_path'] = Variable<String>(qIgsNXgNr);
    if (!nullToAbsent || aFAL0xL46 != null) {
      map['remote_url'] = Variable<String>(aFAL0xL46);
    }
    map['creado_en'] = Variable<DateTime>(b2oRoMaV);
    return map;
  }

  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI qZVKxt6kTaQ(bool nullToAbsent) {
    return Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
      sU: Value(aU),
      bY6ZOF0uo: Value(k0zETwpTK),
      qS2I: Value(bTBb),
      p7B4JY: Value(nPdQ1y),
      cOvZFXOUU: Value(qIgsNXgNr),
      v8hFsLNip: aFAL0xL46 == null && nullToAbsent
          ? const Value.absent()
          : Value(aFAL0xL46),
      wFJWeFsv: Value(b2oRoMaV),
    );
  }

  factory MqgZIJIZuGbeC3uaGFcCBQmY7J.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: serializer.fromJson<String>(json['id']),
      k0zETwpTK: serializer.fromJson<String>(json['reporteId']),
      bTBb: serializer.fromJson<String>(json['tipo']),
      nPdQ1y: serializer.fromJson<String>(json['nombre']),
      qIgsNXgNr: serializer.fromJson<String>(json['localPath']),
      aFAL0xL46: serializer.fromJson<String?>(json['remoteUrl']),
      b2oRoMaV: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(aU),
      'reporteId': serializer.toJson<String>(k0zETwpTK),
      'tipo': serializer.toJson<String>(bTBb),
      'nombre': serializer.toJson<String>(nPdQ1y),
      'localPath': serializer.toJson<String>(qIgsNXgNr),
      'remoteUrl': serializer.toJson<String?>(aFAL0xL46),
      'creadoEn': serializer.toJson<DateTime>(b2oRoMaV),
    };
  }

  MqgZIJIZuGbeC3uaGFcCBQmY7J jFfRnvrD({
    String? id,
    String? reporteId,
    String? tipo,
    String? nombre,
    String? localPath,
    Value<String?> remoteUrl = const Value.absent(),
    DateTime? creadoEn,
  }) => MqgZIJIZuGbeC3uaGFcCBQmY7J(
    aU: id ?? this.aU,
    k0zETwpTK: reporteId ?? this.k0zETwpTK,
    bTBb: tipo ?? this.bTBb,
    nPdQ1y: nombre ?? this.nPdQ1y,
    qIgsNXgNr: localPath ?? this.qIgsNXgNr,
    aFAL0xL46: remoteUrl.present ? remoteUrl.value : this.aFAL0xL46,
    b2oRoMaV: creadoEn ?? this.b2oRoMaV,
  );
  MqgZIJIZuGbeC3uaGFcCBQmY7J vSJ7N1eMX0bMPmn5N(
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI data,
  ) {
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: data.sU.present ? data.sU.value : this.aU,
      k0zETwpTK: data.bY6ZOF0uo.present ? data.bY6ZOF0uo.value : this.k0zETwpTK,
      bTBb: data.qS2I.present ? data.qS2I.value : this.bTBb,
      nPdQ1y: data.p7B4JY.present ? data.p7B4JY.value : this.nPdQ1y,
      qIgsNXgNr: data.cOvZFXOUU.present ? data.cOvZFXOUU.value : this.qIgsNXgNr,
      aFAL0xL46: data.v8hFsLNip.present ? data.v8hFsLNip.value : this.aFAL0xL46,
      b2oRoMaV: data.wFJWeFsv.present ? data.wFJWeFsv.value : this.b2oRoMaV,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteEvidenciasTableData(')
          ..write('id: $aU, ')
          ..write('reporteId: $k0zETwpTK, ')
          ..write('tipo: $bTBb, ')
          ..write('nombre: $nPdQ1y, ')
          ..write('localPath: $qIgsNXgNr, ')
          ..write('remoteUrl: $aFAL0xL46, ')
          ..write('creadoEn: $b2oRoMaV')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(aU, k0zETwpTK, bTBb, nPdQ1y, qIgsNXgNr, aFAL0xL46, b2oRoMaV);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MqgZIJIZuGbeC3uaGFcCBQmY7J &&
          other.aU == this.aU &&
          other.k0zETwpTK == this.k0zETwpTK &&
          other.bTBb == this.bTBb &&
          other.nPdQ1y == this.nPdQ1y &&
          other.qIgsNXgNr == this.qIgsNXgNr &&
          other.aFAL0xL46 == this.aFAL0xL46 &&
          other.b2oRoMaV == this.b2oRoMaV);
}

class Klv2WHU2z0Dg16Wk503cIncsPIiGTGI
    extends UpdateCompanion<MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  final Value<String> sU;
  final Value<String> bY6ZOF0uo;
  final Value<String> qS2I;
  final Value<String> p7B4JY;
  final Value<String> cOvZFXOUU;
  final Value<String?> v8hFsLNip;
  final Value<DateTime> wFJWeFsv;
  final Value<int> nZy2D;
  const Klv2WHU2z0Dg16Wk503cIncsPIiGTGI({
    this.sU = const Value.absent(),
    this.bY6ZOF0uo = const Value.absent(),
    this.qS2I = const Value.absent(),
    this.p7B4JY = const Value.absent(),
    this.cOvZFXOUU = const Value.absent(),
    this.v8hFsLNip = const Value.absent(),
    this.wFJWeFsv = const Value.absent(),
    this.nZy2D = const Value.absent(),
  });
  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI.insert({
    required String id,
    required String reporteId,
    required String tipo,
    required String nombre,
    required String localPath,
    this.v8hFsLNip = const Value.absent(),
    required DateTime creadoEn,
    this.nZy2D = const Value.absent(),
  }) : sU = Value(id),
       bY6ZOF0uo = Value(reporteId),
       qS2I = Value(tipo),
       p7B4JY = Value(nombre),
       cOvZFXOUU = Value(localPath),
       wFJWeFsv = Value(creadoEn);
  static Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> jAUN3L({
    Expression<String>? id,
    Expression<String>? reporteId,
    Expression<String>? tipo,
    Expression<String>? nombre,
    Expression<String>? localPath,
    Expression<String>? remoteUrl,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reporteId != null) 'reporte_id': reporteId,
      if (tipo != null) 'tipo': tipo,
      if (nombre != null) 'nombre': nombre,
      if (localPath != null) 'local_path': localPath,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI nDTHTBUf({
    Value<String>? id,
    Value<String>? reporteId,
    Value<String>? tipo,
    Value<String>? nombre,
    Value<String>? localPath,
    Value<String?>? remoteUrl,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
      sU: id ?? this.sU,
      bY6ZOF0uo: reporteId ?? this.bY6ZOF0uo,
      qS2I: tipo ?? this.qS2I,
      p7B4JY: nombre ?? this.p7B4JY,
      cOvZFXOUU: localPath ?? this.cOvZFXOUU,
      v8hFsLNip: remoteUrl ?? this.v8hFsLNip,
      wFJWeFsv: creadoEn ?? this.wFJWeFsv,
      nZy2D: rowid ?? this.nZy2D,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sU.present) {
      map['id'] = Variable<String>(sU.value);
    }
    if (bY6ZOF0uo.present) {
      map['reporte_id'] = Variable<String>(bY6ZOF0uo.value);
    }
    if (qS2I.present) {
      map['tipo'] = Variable<String>(qS2I.value);
    }
    if (p7B4JY.present) {
      map['nombre'] = Variable<String>(p7B4JY.value);
    }
    if (cOvZFXOUU.present) {
      map['local_path'] = Variable<String>(cOvZFXOUU.value);
    }
    if (v8hFsLNip.present) {
      map['remote_url'] = Variable<String>(v8hFsLNip.value);
    }
    if (wFJWeFsv.present) {
      map['creado_en'] = Variable<DateTime>(wFJWeFsv.value);
    }
    if (nZy2D.present) {
      map['rowid'] = Variable<int>(nZy2D.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteEvidenciasTableCompanion(')
          ..write('id: $sU, ')
          ..write('reporteId: $bY6ZOF0uo, ')
          ..write('tipo: $qS2I, ')
          ..write('nombre: $p7B4JY, ')
          ..write('localPath: $cOvZFXOUU, ')
          ..write('remoteUrl: $v8hFsLNip, ')
          ..write('creadoEn: $wFJWeFsv, ')
          ..write('rowid: $nZy2D')
          ..write(')'))
        .toString();
  }
}

class SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp extends ReporteParticipantesTable
    with
        TableInfo<
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _lMOaw;
  SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(this.attachedDatabase, [this._lMOaw]);
  static const VerificationMeta _jI1EFwzpftEKd = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iCfCpzMfSw = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _q0uuehd = const VerificationMeta('rol');
  @override
  late final GeneratedColumn<String> rol = GeneratedColumn<String>(
    'rol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [reporteId, userId, rol];
  @override
  String get aliasedName => _lMOaw ?? actualTableName;
  @override
  String get actualTableName => xe8Z2;
  static const String xe8Z2 = 'reporte_participantes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reporte_id')) {
      context.handle(
        _jI1EFwzpftEKd,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _jI1EFwzpftEKd),
      );
    } else if (isInserting) {
      context.missing(_jI1EFwzpftEKd);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _iCfCpzMfSw,
        userId.isAcceptableOrUnknown(data['user_id']!, _iCfCpzMfSw),
      );
    } else if (isInserting) {
      context.missing(_iCfCpzMfSw);
    }
    if (data.containsKey('rol')) {
      context.handle(
        _q0uuehd,
        rol.isAcceptableOrUnknown(data['rol']!, _q0uuehd),
      );
    } else if (isInserting) {
      context.missing(_q0uuehd);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reporteId, userId};
  @override
  IKHFzRDpgFzjhWij3nsPu1GdzStvW map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      ziKzbT: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      xQP: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rol'],
      )!,
    );
  }

  @override
  SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp createAlias(String alias) {
    return SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(attachedDatabase, alias);
  }
}

class IKHFzRDpgFzjhWij3nsPu1GdzStvW extends DataClass
    implements Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> {
  final String qQkHzyZ0J;
  final String ziKzbT;
  final String xQP;
  const IKHFzRDpgFzjhWij3nsPu1GdzStvW({
    required this.qQkHzyZ0J,
    required this.ziKzbT,
    required this.xQP,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reporte_id'] = Variable<String>(qQkHzyZ0J);
    map['user_id'] = Variable<String>(ziKzbT);
    map['rol'] = Variable<String>(xQP);
    return map;
  }

  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU xQiGhXmj8u4(bool nullToAbsent) {
    return T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
      c7fchPBLA: Value(qQkHzyZ0J),
      bokW9m: Value(ziKzbT),
      mIv: Value(xQP),
    );
  }

  factory IKHFzRDpgFzjhWij3nsPu1GdzStvW.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: serializer.fromJson<String>(json['reporteId']),
      ziKzbT: serializer.fromJson<String>(json['userId']),
      xQP: serializer.fromJson<String>(json['rol']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reporteId': serializer.toJson<String>(qQkHzyZ0J),
      'userId': serializer.toJson<String>(ziKzbT),
      'rol': serializer.toJson<String>(xQP),
    };
  }

  IKHFzRDpgFzjhWij3nsPu1GdzStvW eVjGEnwq({
    String? reporteId,
    String? userId,
    String? rol,
  }) => IKHFzRDpgFzjhWij3nsPu1GdzStvW(
    qQkHzyZ0J: reporteId ?? this.qQkHzyZ0J,
    ziKzbT: userId ?? this.ziKzbT,
    xQP: rol ?? this.xQP,
  );
  IKHFzRDpgFzjhWij3nsPu1GdzStvW jyZlNzlaR6sdbCBgG(
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU data,
  ) {
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: data.c7fchPBLA.present ? data.c7fchPBLA.value : this.qQkHzyZ0J,
      ziKzbT: data.bokW9m.present ? data.bokW9m.value : this.ziKzbT,
      xQP: data.mIv.present ? data.mIv.value : this.xQP,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteParticipantesTableData(')
          ..write('reporteId: $qQkHzyZ0J, ')
          ..write('userId: $ziKzbT, ')
          ..write('rol: $xQP')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(qQkHzyZ0J, ziKzbT, xQP);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IKHFzRDpgFzjhWij3nsPu1GdzStvW &&
          other.qQkHzyZ0J == this.qQkHzyZ0J &&
          other.ziKzbT == this.ziKzbT &&
          other.xQP == this.xQP);
}

class T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU
    extends UpdateCompanion<IKHFzRDpgFzjhWij3nsPu1GdzStvW> {
  final Value<String> c7fchPBLA;
  final Value<String> bokW9m;
  final Value<String> mIv;
  final Value<int> eQbrO;
  const T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU({
    this.c7fchPBLA = const Value.absent(),
    this.bokW9m = const Value.absent(),
    this.mIv = const Value.absent(),
    this.eQbrO = const Value.absent(),
  });
  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU.insert({
    required String reporteId,
    required String userId,
    required String rol,
    this.eQbrO = const Value.absent(),
  }) : c7fchPBLA = Value(reporteId),
       bokW9m = Value(userId),
       mIv = Value(rol);
  static Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> bkDjCD({
    Expression<String>? reporteId,
    Expression<String>? userId,
    Expression<String>? rol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (reporteId != null) 'reporte_id': reporteId,
      if (userId != null) 'user_id': userId,
      if (rol != null) 'rol': rol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU njCajdkb({
    Value<String>? reporteId,
    Value<String>? userId,
    Value<String>? rol,
    Value<int>? rowid,
  }) {
    return T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
      c7fchPBLA: reporteId ?? this.c7fchPBLA,
      bokW9m: userId ?? this.bokW9m,
      mIv: rol ?? this.mIv,
      eQbrO: rowid ?? this.eQbrO,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (c7fchPBLA.present) {
      map['reporte_id'] = Variable<String>(c7fchPBLA.value);
    }
    if (bokW9m.present) {
      map['user_id'] = Variable<String>(bokW9m.value);
    }
    if (mIv.present) {
      map['rol'] = Variable<String>(mIv.value);
    }
    if (eQbrO.present) {
      map['rowid'] = Variable<int>(eQbrO.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteParticipantesTableCompanion(')
          ..write('reporteId: $c7fchPBLA, ')
          ..write('userId: $bokW9m, ')
          ..write('rol: $mIv, ')
          ..write('rowid: $eQbrO')
          ..write(')'))
        .toString();
  }
}

abstract class _Dd6MZrmiYCBX extends GeneratedDatabase {
  _Dd6MZrmiYCBX(QueryExecutor e) : super(e);
  VAZmCx0OIEHlhQoQlgP get wRD1rY6U => VAZmCx0OIEHlhQoQlgP(this);
  late final JUtMtZAhU8S2N01nW0NOb fl4K2o4z8EmVE6Q = JUtMtZAhU8S2N01nW0NOb(
    this,
  );
  late final XE5bck28Z2cvTleRiVdRxj76YhW5AXu oUFGqb3kTTei6pB1c72oFuUjt =
      XE5bck28Z2cvTleRiVdRxj76YhW5AXu(this);
  late final Gn9jkqIImNg4fnxYGw6rFKUi cunYqbc3Zd0Chxytm9 =
      Gn9jkqIImNg4fnxYGw6rFKUi(this);
  late final VoEzDvET6spVkF39b0bk p8RGehv9uW7gdv = VoEzDvET6spVkF39b0bk(this);
  late final J62cINCwmlQnn32ri khGDx8OWIxU = J62cINCwmlQnn32ri(this);
  late final H3NxUrmIatWHjGU32octXOFRSTp jU5VEJTz8C7WwoYYJfIlQ =
      H3NxUrmIatWHjGU32octXOFRSTp(this);
  late final TdpibLkvaSVlNdhYP94EMgY2 qaBIf6ei74qAD99wRU =
      TdpibLkvaSVlNdhYP94EMgY2(this);
  late final OZOvvqDyixK8vCrBMu7 tPzD7WczXfidC = OZOvvqDyixK8vCrBMu7(this);
  late final BoBcnkhdbLdMOgKtsin3TNgWX7CJA kBIHzP5TOGzWkh2wMx36lse =
      BoBcnkhdbLdMOgKtsin3TNgWX7CJA(this);
  late final YoNU9Kgod2bozlWwHlObWuuh62Da mE07WRLPfW2zDpFYLRNsjU =
      YoNU9Kgod2bozlWwHlObWuuh62Da(this);
  late final SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp xjLgqdIBlhdS5VmEqfZsjcQvX =
      SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    fl4K2o4z8EmVE6Q,
    oUFGqb3kTTei6pB1c72oFuUjt,
    cunYqbc3Zd0Chxytm9,
    p8RGehv9uW7gdv,
    khGDx8OWIxU,
    jU5VEJTz8C7WwoYYJfIlQ,
    qaBIf6ei74qAD99wRU,
    tPzD7WczXfidC,
    kBIHzP5TOGzWkh2wMx36lse,
    mE07WRLPfW2zDpFYLRNsjU,
    xjLgqdIBlhdS5VmEqfZsjcQvX,
  ];
}

typedef $$AsistenciaTableTableCreateCompanionBuilder =
    I4D75iPWJH0cc2eGwEo90OsZ Function({
      Value<int> id,
      required String usuarioId,
      required DateTime fechaHora,
      required String tipo,
      Value<String> metodo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
    });
typedef $$AsistenciaTableTableUpdateCompanionBuilder =
    I4D75iPWJH0cc2eGwEo90OsZ Function({
      Value<int> id,
      Value<String> usuarioId,
      Value<DateTime> fechaHora,
      Value<String> tipo,
      Value<String> metodo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
    });

class ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get oo => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpFlHJ2wI => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get bKVSKL0Jn => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cKGl => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iW0fGQ => $composableBuilder(
    column: $table.metodo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vvWZ9ZlmNXbb => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pRFwy3B4 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cT => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kzZJFGgEh => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get wOANDUKQR => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xhMD => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ugg9S0 => $composableBuilder(
    column: $table.metodo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ld1zD61ydQ8G => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dJI3CQgD => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pv =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hmlW8R4S7 =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get rVq9fc3gG =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  GeneratedColumn<String> get sFSw =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get qNx4cM =>
      $composableBuilder(column: $table.metodo, builder: (column) => column);

  GeneratedColumn<bool> get b8s12xVU2mdT => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get jLAGbYKM =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          JUtMtZAhU8S2N01nW0NOb,
          K7g68SL3ZcwxYHO0o9J,
          ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL,
          YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg,
          GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL,
          $$AsistenciaTableTableCreateCompanionBuilder,
          $$AsistenciaTableTableUpdateCompanionBuilder,
          (
            K7g68SL3ZcwxYHO0o9J,
            BaseReferences<
              _Dd6MZrmiYCBX,
              JUtMtZAhU8S2N01nW0NOb,
              K7g68SL3ZcwxYHO0o9J
            >,
          ),
          K7g68SL3ZcwxYHO0o9J,
          PrefetchHooks Function()
        > {
  USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L(
    _Dd6MZrmiYCBX db,
    JUtMtZAhU8S2N01nW0NOb table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL($db: db, $table: table),
          createOrderingComposer: () =>
              YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg($db: db, $table: table),
          createComputedFieldComposer: () =>
              GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> metodo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => I4D75iPWJH0cc2eGwEo90OsZ(
                oG: id,
                j5hswdgrL: usuarioId,
                tZ5Jbb5Kk: fechaHora,
                obO0: tipo,
                sjelo5: metodo,
                qI8LLZmrR7bZ: sincronizado,
                b2OwXecC: creadoEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String usuarioId,
                required DateTime fechaHora,
                required String tipo,
                Value<String> metodo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => I4D75iPWJH0cc2eGwEo90OsZ.gJkcVJ(
                oG: id,
                usuarioId: usuarioId,
                fechaHora: fechaHora,
                tipo: tipo,
                sjelo5: metodo,
                qI8LLZmrR7bZ: sincronizado,
                b2OwXecC: creadoEn,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AsistenciaTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      JUtMtZAhU8S2N01nW0NOb,
      K7g68SL3ZcwxYHO0o9J,
      ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL,
      YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg,
      GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL,
      $$AsistenciaTableTableCreateCompanionBuilder,
      $$AsistenciaTableTableUpdateCompanionBuilder,
      (
        K7g68SL3ZcwxYHO0o9J,
        BaseReferences<
          _Dd6MZrmiYCBX,
          JUtMtZAhU8S2N01nW0NOb,
          K7g68SL3ZcwxYHO0o9J
        >,
      ),
      K7g68SL3ZcwxYHO0o9J,
      PrefetchHooks Function()
    >;
typedef $$CombustibleRegistrosTableTableCreateCompanionBuilder =
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB Function({
      required String id,
      required String usuarioId,
      required String modo,
      Value<String?> nombre,
      Value<String?> destino,
      Value<String?> horaInicio,
      Value<String?> horaFinal,
      Value<String?> combustibleInicial,
      Value<int?> kilometrajeInicial,
      Value<String?> combustibleFinal,
      Value<int?> kilometrajeFinal,
      Value<String?> fechaCarga,
      Value<String?> operador,
      Value<int?> kmAntes,
      Value<int?> kmDespues,
      Value<String?> metadata,
      Value<String?> syncError,
      Value<String?> syncInfo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });
typedef $$CombustibleRegistrosTableTableUpdateCompanionBuilder =
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB Function({
      Value<String> id,
      Value<String> usuarioId,
      Value<String> modo,
      Value<String?> nombre,
      Value<String?> destino,
      Value<String?> horaInicio,
      Value<String?> horaFinal,
      Value<String?> combustibleInicial,
      Value<int?> kilometrajeInicial,
      Value<String?> combustibleFinal,
      Value<int?> kilometrajeFinal,
      Value<String?> fechaCarga,
      Value<String?> operador,
      Value<int?> kmAntes,
      Value<int?> kmDespues,
      Value<String?> metadata,
      Value<String?> syncError,
      Value<String?> syncInfo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get jy => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ooKiRPLH7 => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get miLf => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wk5CSI => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zD8eYSH => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ujZwd9VkNG => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cvN8q7BUa => $composableBuilder(
    column: $table.horaFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sZmKzLBnoNVscrxlQl => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pA9s0TEjCFTnXGjZcL => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qsti6uOZwmgktkJz => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get zUYbwIhg6GtuiJHA => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get h5DVIYL2Uv => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zvrx7jok => $composableBuilder(
    column: $table.operador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get p92W9Vc => $composableBuilder(
    column: $table.kmAntes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ec1jDXiLb => $composableBuilder(
    column: $table.kmDespues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inzwvWbc => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get o8XLV8NKv => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get e3Pyze2V => $composableBuilder(
    column: $table.syncInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get jVEMre3elDAC => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get jtPW6XOv => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get qV => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lF6VLHjKL => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get psa1 => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pJMUnR => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tDnWFhN => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vNOnFrE17B => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ja6n729G3 => $composableBuilder(
    column: $table.horaFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get p75FWUbIlfg8F6lFms => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get zScIxA5B7lr7Jq050i => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get d63KfyQVKVCGv4jJ => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cngV2JMu1D22W3nr => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gLss9qbZnL => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kLyScr6c => $composableBuilder(
    column: $table.operador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nITzAkn => $composableBuilder(
    column: $table.kmAntes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get n6UJ5fLr6 => $composableBuilder(
    column: $table.kmDespues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fF19VTLf => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get k2r8Vg4Zl => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qy53oSTM => $composableBuilder(
    column: $table.syncInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mMdjBG0nPkFZ => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hJWc45E7 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get wa =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oaA7gGyzb =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<String> get c6rc =>
      $composableBuilder(column: $table.modo, builder: (column) => column);

  GeneratedColumn<String> get hMWLlo =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get sAIOlPS =>
      $composableBuilder(column: $table.destino, builder: (column) => column);

  GeneratedColumn<String> get wnT8lgkGr9 => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nemXvlBGD =>
      $composableBuilder(column: $table.horaFinal, builder: (column) => column);

  GeneratedColumn<String> get wQVGKC2sercNQ1PKPi => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => column,
  );

  GeneratedColumn<int> get k31HwvIUmQhv5NSNTK => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sp1xuHb1qLZT6VMO => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hxtVA7E4pRMwAs6k => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lqZBmEHnOT => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lAQupHaP =>
      $composableBuilder(column: $table.operador, builder: (column) => column);

  GeneratedColumn<int> get g5DH1jK =>
      $composableBuilder(column: $table.kmAntes, builder: (column) => column);

  GeneratedColumn<int> get xkl3wMu5w =>
      $composableBuilder(column: $table.kmDespues, builder: (column) => column);

  GeneratedColumn<String> get xHFJa19R =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<String> get qW4WshIXv =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<String> get rCYClTGK =>
      $composableBuilder(column: $table.syncInfo, builder: (column) => column);

  GeneratedColumn<bool> get gfQOA5FpR9Ul => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get qQp0CTfy =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
          WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy,
          WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j,
          TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05,
          $$CombustibleRegistrosTableTableCreateCompanionBuilder,
          $$CombustibleRegistrosTableTableUpdateCompanionBuilder,
          (
            Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
            BaseReferences<
              _Dd6MZrmiYCBX,
              XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
              Tu1jStwkwzpbJHfkGU7g09MJhUwdD
            >,
          ),
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
          PrefetchHooks Function()
        > {
  Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex(
    _Dd6MZrmiYCBX db,
    XE5bck28Z2cvTleRiVdRxj76YhW5AXu table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<String> modo = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFinal = const Value.absent(),
                Value<String?> combustibleInicial = const Value.absent(),
                Value<int?> kilometrajeInicial = const Value.absent(),
                Value<String?> combustibleFinal = const Value.absent(),
                Value<int?> kilometrajeFinal = const Value.absent(),
                Value<String?> fechaCarga = const Value.absent(),
                Value<String?> operador = const Value.absent(),
                Value<int?> kmAntes = const Value.absent(),
                Value<int?> kmDespues = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<String?> syncInfo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
                kG: id,
                zP9InJmSB: usuarioId,
                piVk: modo,
                i5QUQk: nombre,
                u5GveBn: destino,
                xAMz01YkIt: horaInicio,
                ewIdFnxeO: horaFinal,
                bLRN1zQYqxM1WWlXjr: combustibleInicial,
                aYKSs386BUhF2mkPnG: kilometrajeInicial,
                ybJGZWDVbEKc4n5m: combustibleFinal,
                h0jpAs6ZpPJPw8NI: kilometrajeFinal,
                aqcX18IRuB: fechaCarga,
                ekcREChe: operador,
                dXt6KMU: kmAntes,
                ngpZB55Sc: kmDespues,
                j4QNm5oy: metadata,
                yR3qhIbzL: syncError,
                uX8ZvZgj: syncInfo,
                dJCVP37dMYlm: sincronizado,
                lYeqPFYS: creadoEn,
                tHjkb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String usuarioId,
                required String modo,
                Value<String?> nombre = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFinal = const Value.absent(),
                Value<String?> combustibleInicial = const Value.absent(),
                Value<int?> kilometrajeInicial = const Value.absent(),
                Value<String?> combustibleFinal = const Value.absent(),
                Value<int?> kilometrajeFinal = const Value.absent(),
                Value<String?> fechaCarga = const Value.absent(),
                Value<String?> operador = const Value.absent(),
                Value<int?> kmAntes = const Value.absent(),
                Value<int?> kmDespues = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<String?> syncInfo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB.insert(
                id: id,
                usuarioId: usuarioId,
                modo: modo,
                i5QUQk: nombre,
                u5GveBn: destino,
                xAMz01YkIt: horaInicio,
                ewIdFnxeO: horaFinal,
                bLRN1zQYqxM1WWlXjr: combustibleInicial,
                aYKSs386BUhF2mkPnG: kilometrajeInicial,
                ybJGZWDVbEKc4n5m: combustibleFinal,
                h0jpAs6ZpPJPw8NI: kilometrajeFinal,
                aqcX18IRuB: fechaCarga,
                ekcREChe: operador,
                dXt6KMU: kmAntes,
                ngpZB55Sc: kmDespues,
                j4QNm5oy: metadata,
                yR3qhIbzL: syncError,
                uX8ZvZgj: syncInfo,
                dJCVP37dMYlm: sincronizado,
                lYeqPFYS: creadoEn,
                tHjkb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CombustibleRegistrosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
      Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
      WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy,
      WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j,
      TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05,
      $$CombustibleRegistrosTableTableCreateCompanionBuilder,
      $$CombustibleRegistrosTableTableUpdateCompanionBuilder,
      (
        Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
        BaseReferences<
          _Dd6MZrmiYCBX,
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD
        >,
      ),
      Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableTableCreateCompanionBuilder =
    SWa7JoZtay7PsWkFUBhxewW9jpO Function({
      required String id,
      required String titulo,
      required String mensaje,
      Value<String> tipo,
      Value<bool> leida,
      Value<String?> origen,
      Value<DateTime> fecha,
      Value<int> rowid,
    });
typedef $$NotificationsTableTableUpdateCompanionBuilder =
    SWa7JoZtay7PsWkFUBhxewW9jpO Function({
      Value<String> id,
      Value<String> titulo,
      Value<String> mensaje,
      Value<String> tipo,
      Value<bool> leida,
      Value<String?> origen,
      Value<DateTime> fecha,
      Value<int> rowid,
    });

class KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ip => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get albheZ => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ph6YOEI => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xh29 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vtluP => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jxUYbQ => $composableBuilder(
    column: $table.origen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get eAXTF => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );
}

class Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get s8 => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bLU3ZG => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zaLEVMq => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iKCR => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get y6Ruo => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get y84Cc5 => $composableBuilder(
    column: $table.origen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get s7tU3 => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );
}

class HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get jU =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uAZDff =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get sjyqTD5 =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<String> get nJb3 =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<bool> get vmpPV =>
      $composableBuilder(column: $table.leida, builder: (column) => column);

  GeneratedColumn<String> get cWPsEO =>
      $composableBuilder(column: $table.origen, builder: (column) => column);

  GeneratedColumn<DateTime> get neZcd =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);
}

class XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          Gn9jkqIImNg4fnxYGw6rFKUi,
          DPidT9wqpsXGu3Kq8QK4mS,
          KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w,
          Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy,
          HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe,
          $$NotificationsTableTableCreateCompanionBuilder,
          $$NotificationsTableTableUpdateCompanionBuilder,
          (
            DPidT9wqpsXGu3Kq8QK4mS,
            BaseReferences<
              _Dd6MZrmiYCBX,
              Gn9jkqIImNg4fnxYGw6rFKUi,
              DPidT9wqpsXGu3Kq8QK4mS
            >,
          ),
          DPidT9wqpsXGu3Kq8QK4mS,
          PrefetchHooks Function()
        > {
  XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr(
    _Dd6MZrmiYCBX db,
    Gn9jkqIImNg4fnxYGw6rFKUi table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w($db: db, $table: table),
          createOrderingComposer: () =>
              Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy($db: db, $table: table),
          createComputedFieldComposer: () =>
              HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<bool> leida = const Value.absent(),
                Value<String?> origen = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SWa7JoZtay7PsWkFUBhxewW9jpO(
                aN: id,
                ljk5Nd: titulo,
                mnrOxtx: mensaje,
                jdRb: tipo,
                zZbwB: leida,
                b5yrQ9: origen,
                moLEU: fecha,
                b82qb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titulo,
                required String mensaje,
                Value<String> tipo = const Value.absent(),
                Value<bool> leida = const Value.absent(),
                Value<String?> origen = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SWa7JoZtay7PsWkFUBhxewW9jpO.insert(
                id: id,
                titulo: titulo,
                mensaje: mensaje,
                jdRb: tipo,
                zZbwB: leida,
                b5yrQ9: origen,
                moLEU: fecha,
                b82qb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationsTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      Gn9jkqIImNg4fnxYGw6rFKUi,
      DPidT9wqpsXGu3Kq8QK4mS,
      KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w,
      Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy,
      HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe,
      $$NotificationsTableTableCreateCompanionBuilder,
      $$NotificationsTableTableUpdateCompanionBuilder,
      (
        DPidT9wqpsXGu3Kq8QK4mS,
        BaseReferences<
          _Dd6MZrmiYCBX,
          Gn9jkqIImNg4fnxYGw6rFKUi,
          DPidT9wqpsXGu3Kq8QK4mS
        >,
      ),
      DPidT9wqpsXGu3Kq8QK4mS,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableTableCreateCompanionBuilder =
    SrEEFVxhxqZAGYVOYcaDbjs Function({
      Value<int> id,
      required String entidad,
      required String entidadId,
      required String accion,
      Value<Map<String, dynamic>?> payload,
      Value<bool> procesado,
      Value<DateTime> createdAt,
    });
typedef $$SyncQueueTableTableUpdateCompanionBuilder =
    SrEEFVxhxqZAGYVOYcaDbjs Function({
      Value<int> id,
      Value<String> entidad,
      Value<String> entidadId,
      Value<String> accion,
      Value<Map<String, dynamic>?> payload,
      Value<bool> procesado,
      Value<DateTime> createdAt,
    });

class H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get hn => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rAdKHgL => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tf70T7wDE => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get j7TTrp => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get oRCNDw6 => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get mOGAH3rfd => $composableBuilder(
    column: $table.procesado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get zjUkS8giB => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get oY => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get azFwhxv => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get yYthc2XHJ => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get t7QVNe => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wKFff4l => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get eiO8Y3LhQ => $composableBuilder(
    column: $table.procesado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get xg4d55GpR => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ju =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kMVt81P =>
      $composableBuilder(column: $table.entidad, builder: (column) => column);

  GeneratedColumn<String> get bMDjO0Wr1 =>
      $composableBuilder(column: $table.entidadId, builder: (column) => column);

  GeneratedColumn<String> get gWmu8j =>
      $composableBuilder(column: $table.accion, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get i5ePpmM =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<bool> get gd92sq2Ya =>
      $composableBuilder(column: $table.procesado, builder: (column) => column);

  GeneratedColumn<DateTime> get bMRigddjy =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          VoEzDvET6spVkF39b0bk,
          NArNwNTM7Tr2ljhuMP,
          H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF,
          WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH,
          DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d,
          $$SyncQueueTableTableCreateCompanionBuilder,
          $$SyncQueueTableTableUpdateCompanionBuilder,
          (
            NArNwNTM7Tr2ljhuMP,
            BaseReferences<
              _Dd6MZrmiYCBX,
              VoEzDvET6spVkF39b0bk,
              NArNwNTM7Tr2ljhuMP
            >,
          ),
          NArNwNTM7Tr2ljhuMP,
          PrefetchHooks Function()
        > {
  QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK(
    _Dd6MZrmiYCBX db,
    VoEzDvET6spVkF39b0bk table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF($db: db, $table: table),
          createOrderingComposer: () =>
              WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH($db: db, $table: table),
          createComputedFieldComposer: () =>
              DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entidad = const Value.absent(),
                Value<String> entidadId = const Value.absent(),
                Value<String> accion = const Value.absent(),
                Value<Map<String, dynamic>?> payload = const Value.absent(),
                Value<bool> procesado = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SrEEFVxhxqZAGYVOYcaDbjs(
                dy: id,
                jz6JiPB: entidad,
                g8u3OR9sY: entidadId,
                v7ws6e: accion,
                j9qrlAp: payload,
                sKt6xl9c1: procesado,
                toSavqXbg: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entidad,
                required String entidadId,
                required String accion,
                Value<Map<String, dynamic>?> payload = const Value.absent(),
                Value<bool> procesado = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SrEEFVxhxqZAGYVOYcaDbjs.insert(
                dy: id,
                entidad: entidad,
                entidadId: entidadId,
                accion: accion,
                j9qrlAp: payload,
                sKt6xl9c1: procesado,
                toSavqXbg: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      VoEzDvET6spVkF39b0bk,
      NArNwNTM7Tr2ljhuMP,
      H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF,
      WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH,
      DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d,
      $$SyncQueueTableTableCreateCompanionBuilder,
      $$SyncQueueTableTableUpdateCompanionBuilder,
      (
        NArNwNTM7Tr2ljhuMP,
        BaseReferences<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk, NArNwNTM7Tr2ljhuMP>,
      ),
      NArNwNTM7Tr2ljhuMP,
      PrefetchHooks Function()
    >;
typedef $$TareasTableTableCreateCompanionBuilder =
    OwsvOrFusdhz7tOUKhJP Function({
      required String id,
      Value<String?> remoteId,
      Value<String?> groupId,
      required String reporteId,
      required String titulo,
      Value<String> descripcion,
      Value<String?> creadoPor,
      required String asignadoA,
      required String estado,
      Value<int> rowid,
    });
typedef $$TareasTableTableUpdateCompanionBuilder =
    OwsvOrFusdhz7tOUKhJP Function({
      Value<String> id,
      Value<String?> remoteId,
      Value<String?> groupId,
      Value<String> reporteId,
      Value<String> titulo,
      Value<String> descripcion,
      Value<String?> creadoPor,
      Value<String> asignadoA,
      Value<String> estado,
      Value<int> rowid,
    });

class FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uU => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ckEuunuo => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsswyVm => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get knxoyUwgb => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kiRFZT => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cPVDSXrQkzT => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aRwHNQ6TD => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pTvYVoMqC => $composableBuilder(
    column: $table.asignadoA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bkwoWS => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );
}

class NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get eu => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pIOh1WNL => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get s9dRrYe => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kTABwHiYO => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get k4IrKX => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get c6CxxUzLRCi => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uzdiJGZHs => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get x26ZqXd1b => $composableBuilder(
    column: $table.asignadoA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bu9HKX => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );
}

class T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get me =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pfqzdN3q =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get ozyfDGd =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get pUGnHlrhx =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get lM3vvj =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get tggo0YueFx6 => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pp1Lf953H =>
      $composableBuilder(column: $table.creadoPor, builder: (column) => column);

  GeneratedColumn<String> get cMzQDsPtz =>
      $composableBuilder(column: $table.asignadoA, builder: (column) => column);

  GeneratedColumn<String> get lwFJUc =>
      $composableBuilder(column: $table.estado, builder: (column) => column);
}

class RXAwq0eA5rYKGJP6ffVlZey1j6uJGi
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          J62cINCwmlQnn32ri,
          AZne3qKStPEIrwr,
          FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD,
          NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W,
          T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY,
          $$TareasTableTableCreateCompanionBuilder,
          $$TareasTableTableUpdateCompanionBuilder,
          (
            AZne3qKStPEIrwr,
            BaseReferences<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri, AZne3qKStPEIrwr>,
          ),
          AZne3qKStPEIrwr,
          PrefetchHooks Function()
        > {
  RXAwq0eA5rYKGJP6ffVlZey1j6uJGi(_Dd6MZrmiYCBX db, J62cINCwmlQnn32ri table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD($db: db, $table: table),
          createOrderingComposer: () =>
              NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W($db: db, $table: table),
          createComputedFieldComposer: () =>
              T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String?> creadoPor = const Value.absent(),
                Value<String> asignadoA = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OwsvOrFusdhz7tOUKhJP(
                vN: id,
                rN7JO0qb: remoteId,
                kiENrzh: groupId,
                aeirywxyG: reporteId,
                ynDuUW: titulo,
                lOp8NQT26oW: descripcion,
                x542jWBgN: creadoPor,
                z9uTXhbFC: asignadoA,
                tJjuIr: estado,
                rLjxm: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> remoteId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                required String reporteId,
                required String titulo,
                Value<String> descripcion = const Value.absent(),
                Value<String?> creadoPor = const Value.absent(),
                required String asignadoA,
                required String estado,
                Value<int> rowid = const Value.absent(),
              }) => OwsvOrFusdhz7tOUKhJP.insert(
                id: id,
                rN7JO0qb: remoteId,
                kiENrzh: groupId,
                reporteId: reporteId,
                titulo: titulo,
                lOp8NQT26oW: descripcion,
                x542jWBgN: creadoPor,
                asignadoA: asignadoA,
                estado: estado,
                rLjxm: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareasTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      J62cINCwmlQnn32ri,
      AZne3qKStPEIrwr,
      FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD,
      NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W,
      T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY,
      $$TareasTableTableCreateCompanionBuilder,
      $$TareasTableTableUpdateCompanionBuilder,
      (
        AZne3qKStPEIrwr,
        BaseReferences<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri, AZne3qKStPEIrwr>,
      ),
      AZne3qKStPEIrwr,
      PrefetchHooks Function()
    >;
typedef $$TareaComentariosTableTableCreateCompanionBuilder =
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj Function({
      required String id,
      required String tareaId,
      required String autorId,
      required String mensaje,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$TareaComentariosTableTableUpdateCompanionBuilder =
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj Function({
      Value<String> id,
      Value<String> tareaId,
      Value<String> autorId,
      Value<String> mensaje,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get n5 => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rftYKGg => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get w4FqASy => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gJVpeHT => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get jVV1gn4D => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get rI => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mhERyP4 => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get a2Ji5fL => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tnrQ8c3 => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lpnLXtvQ => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get yf =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get rfu25Ff =>
      $composableBuilder(column: $table.tareaId, builder: (column) => column);

  GeneratedColumn<String> get d4f7PKc =>
      $composableBuilder(column: $table.autorId, builder: (column) => column);

  GeneratedColumn<String> get jptzjpV =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<DateTime> get rYYCfBd8 =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          H3NxUrmIatWHjGU32octXOFRSTp,
          PfsdSEuE2JF8CtLF5W1e1XWcI,
          SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19,
          LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy,
          Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4,
          $$TareaComentariosTableTableCreateCompanionBuilder,
          $$TareaComentariosTableTableUpdateCompanionBuilder,
          (
            PfsdSEuE2JF8CtLF5W1e1XWcI,
            BaseReferences<
              _Dd6MZrmiYCBX,
              H3NxUrmIatWHjGU32octXOFRSTp,
              PfsdSEuE2JF8CtLF5W1e1XWcI
            >,
          ),
          PfsdSEuE2JF8CtLF5W1e1XWcI,
          PrefetchHooks Function()
        > {
  OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip(
    _Dd6MZrmiYCBX db,
    H3NxUrmIatWHjGU32octXOFRSTp table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tareaId = const Value.absent(),
                Value<String> autorId = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
                dc: id,
                zQBZZlP: tareaId,
                t9Zc8W4: autorId,
                eYwLAmk: mensaje,
                h5ANAMwE: creadoEn,
                ea0zu: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tareaId,
                required String autorId,
                required String mensaje,
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => G4ZLuhxuHaVA2A7emAJSd9pokMajYj.insert(
                id: id,
                tareaId: tareaId,
                autorId: autorId,
                mensaje: mensaje,
                creadoEn: creadoEn,
                ea0zu: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareaComentariosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      H3NxUrmIatWHjGU32octXOFRSTp,
      PfsdSEuE2JF8CtLF5W1e1XWcI,
      SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19,
      LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy,
      Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4,
      $$TareaComentariosTableTableCreateCompanionBuilder,
      $$TareaComentariosTableTableUpdateCompanionBuilder,
      (
        PfsdSEuE2JF8CtLF5W1e1XWcI,
        BaseReferences<
          _Dd6MZrmiYCBX,
          H3NxUrmIatWHjGU32octXOFRSTp,
          PfsdSEuE2JF8CtLF5W1e1XWcI
        >,
      ),
      PfsdSEuE2JF8CtLF5W1e1XWcI,
      PrefetchHooks Function()
    >;
typedef $$TareaAdjuntosTableTableCreateCompanionBuilder =
    QlrnTCYlJIu0qdevCWFMOwRPuhb Function({
      required String id,
      required String tareaId,
      required String tipo,
      required String nombre,
      required String localPath,
      Value<String?> mimeType,
      Value<String?> remoteUrl,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$TareaAdjuntosTableTableUpdateCompanionBuilder =
    QlrnTCYlJIu0qdevCWFMOwRPuhb Function({
      Value<String> id,
      Value<String> tareaId,
      Value<String> tipo,
      Value<String> nombre,
      Value<String> localPath,
      Value<String?> mimeType,
      Value<String?> remoteUrl,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pC => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nh5iwf2 => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get g1xP => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mjg62a => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get yGGZMpbBr => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rNtl1o2T => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ndsuCX957 => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get oNASWUQg => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pn => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sWfXNBk => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wfP1 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get y2bXgL => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xeztH3Pj7 => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sLTWcJz0 => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pYMJc7TAo => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gNLhb0LN => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hj =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get e0of5hg =>
      $composableBuilder(column: $table.tareaId, builder: (column) => column);

  GeneratedColumn<String> get iGnk =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get jjiYVM =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get w2EtC1ruX =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get mCWObULq =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get vyJ5TMVWg =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get yVPDhbHi =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          TdpibLkvaSVlNdhYP94EMgY2,
          Rot0adVvP5dwb2j4cDof6l,
          CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5,
          KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6,
          DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl,
          $$TareaAdjuntosTableTableCreateCompanionBuilder,
          $$TareaAdjuntosTableTableUpdateCompanionBuilder,
          (
            Rot0adVvP5dwb2j4cDof6l,
            BaseReferences<
              _Dd6MZrmiYCBX,
              TdpibLkvaSVlNdhYP94EMgY2,
              Rot0adVvP5dwb2j4cDof6l
            >,
          ),
          Rot0adVvP5dwb2j4cDof6l,
          PrefetchHooks Function()
        > {
  JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J(
    _Dd6MZrmiYCBX db,
    TdpibLkvaSVlNdhYP94EMgY2 table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5($db: db, $table: table),
          createOrderingComposer: () =>
              KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6($db: db, $table: table),
          createComputedFieldComposer: () =>
              DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tareaId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QlrnTCYlJIu0qdevCWFMOwRPuhb(
                cC: id,
                x35Hv88: tareaId,
                hXAX: tipo,
                cSDgEc: nombre,
                tOyOIzLZx: localPath,
                wvT2cjKQ: mimeType,
                r4cZYBdDG: remoteUrl,
                kq5gx0Ow: creadoEn,
                tlaHb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tareaId,
                required String tipo,
                required String nombre,
                required String localPath,
                Value<String?> mimeType = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => QlrnTCYlJIu0qdevCWFMOwRPuhb.insert(
                id: id,
                tareaId: tareaId,
                tipo: tipo,
                nombre: nombre,
                localPath: localPath,
                wvT2cjKQ: mimeType,
                r4cZYBdDG: remoteUrl,
                creadoEn: creadoEn,
                tlaHb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareaAdjuntosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      TdpibLkvaSVlNdhYP94EMgY2,
      Rot0adVvP5dwb2j4cDof6l,
      CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5,
      KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6,
      DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl,
      $$TareaAdjuntosTableTableCreateCompanionBuilder,
      $$TareaAdjuntosTableTableUpdateCompanionBuilder,
      (
        Rot0adVvP5dwb2j4cDof6l,
        BaseReferences<
          _Dd6MZrmiYCBX,
          TdpibLkvaSVlNdhYP94EMgY2,
          Rot0adVvP5dwb2j4cDof6l
        >,
      ),
      Rot0adVvP5dwb2j4cDof6l,
      PrefetchHooks Function()
    >;
typedef $$ReportesTableTableCreateCompanionBuilder =
    HX2XOaxsqSn5sDql3bDAkn Function({
      required String id,
      required String titulo,
      required String descripcion,
      required String categoria,
      required String area,
      Value<String?> activo,
      Value<String?> ubicacion,
      required String creadoPor,
      required DateTime creadoEn,
      required String estado,
      Value<String?> glpiTicketId,
      Value<String?> metadata,
      Value<int> rowid,
    });
typedef $$ReportesTableTableUpdateCompanionBuilder =
    HX2XOaxsqSn5sDql3bDAkn Function({
      Value<String> id,
      Value<String> titulo,
      Value<String> descripcion,
      Value<String> categoria,
      Value<String> area,
      Value<String?> activo,
      Value<String?> ubicacion,
      Value<String> creadoPor,
      Value<DateTime> creadoEn,
      Value<String> estado,
      Value<String?> glpiTicketId,
      Value<String?> metadata,
      Value<int> rowid,
    });

class W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get vB => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gFs774 => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sDNY0Tnv4tQ => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vymyMEQT9 => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dVXK => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get o0JyPs => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nnMFo0a2q => $composableBuilder(
    column: $table.ubicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xprQY5ML8 => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cU4r9jx0 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get n7towl => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aOgR4hVGjwKZ => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dBOqWCFQ => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );
}

class DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get jj => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hQ5kDz => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baPZJxO13so => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xVaqEFMt9 => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cWGZ => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dpPtgW => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ilmyAjTgi => $composableBuilder(
    column: $table.ubicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ke9yIUoC4 => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get vW6KbTUs => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uAJ3fh => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hDY6thTN3iQP => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iAbK5W0S => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get qF =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ujaPYO =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get yOjPFMJbXh3 => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oHEySrhUX =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get yC1g =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get mupAoO =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  GeneratedColumn<String> get jFNjadgjT =>
      $composableBuilder(column: $table.ubicacion, builder: (column) => column);

  GeneratedColumn<String> get m8yCA6rMX =>
      $composableBuilder(column: $table.creadoPor, builder: (column) => column);

  GeneratedColumn<DateTime> get hJdjXwfu =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  GeneratedColumn<String> get eaW5Cf =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get u3bLftuQoCu5 => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get yMpdstFM =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          OZOvvqDyixK8vCrBMu7,
          S3xRBVOlVfAQliETU,
          W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa,
          DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7,
          EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7,
          $$ReportesTableTableCreateCompanionBuilder,
          $$ReportesTableTableUpdateCompanionBuilder,
          (
            S3xRBVOlVfAQliETU,
            BaseReferences<
              _Dd6MZrmiYCBX,
              OZOvvqDyixK8vCrBMu7,
              S3xRBVOlVfAQliETU
            >,
          ),
          S3xRBVOlVfAQliETU,
          PrefetchHooks Function()
        > {
  L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7(_Dd6MZrmiYCBX db, OZOvvqDyixK8vCrBMu7 table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa($db: db, $table: table),
          createOrderingComposer: () =>
              DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7($db: db, $table: table),
          createComputedFieldComposer: () =>
              EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<String?> activo = const Value.absent(),
                Value<String?> ubicacion = const Value.absent(),
                Value<String> creadoPor = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String?> glpiTicketId = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HX2XOaxsqSn5sDql3bDAkn(
                wv: id,
                fwUC6v: titulo,
                yQ3xXO7Rua8: descripcion,
                bsWB13P0F: categoria,
                pAUt: area,
                hqptn4: activo,
                v4bMkOtju: ubicacion,
                r8Zq7Nq7S: creadoPor,
                kIW1poxd: creadoEn,
                cgnYnB: estado,
                d6UYuTd488y5: glpiTicketId,
                leyqxQiP: metadata,
                cGghm: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titulo,
                required String descripcion,
                required String categoria,
                required String area,
                Value<String?> activo = const Value.absent(),
                Value<String?> ubicacion = const Value.absent(),
                required String creadoPor,
                required DateTime creadoEn,
                required String estado,
                Value<String?> glpiTicketId = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HX2XOaxsqSn5sDql3bDAkn.insert(
                id: id,
                titulo: titulo,
                descripcion: descripcion,
                categoria: categoria,
                area: area,
                hqptn4: activo,
                v4bMkOtju: ubicacion,
                creadoPor: creadoPor,
                creadoEn: creadoEn,
                estado: estado,
                d6UYuTd488y5: glpiTicketId,
                leyqxQiP: metadata,
                cGghm: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReportesTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      OZOvvqDyixK8vCrBMu7,
      S3xRBVOlVfAQliETU,
      W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa,
      DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7,
      EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7,
      $$ReportesTableTableCreateCompanionBuilder,
      $$ReportesTableTableUpdateCompanionBuilder,
      (
        S3xRBVOlVfAQliETU,
        BaseReferences<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7, S3xRBVOlVfAQliETU>,
      ),
      S3xRBVOlVfAQliETU,
      PrefetchHooks Function()
    >;
typedef $$ReporteComentariosTableTableCreateCompanionBuilder =
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB Function({
      required String id,
      required String reporteId,
      required String autorId,
      required String mensaje,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$ReporteComentariosTableTableUpdateCompanionBuilder =
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB Function({
      Value<String> id,
      Value<String> reporteId,
      Value<String> autorId,
      Value<String> mensaje,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nK => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nAO4wslFN => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posHXis => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rm92OZt => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sZCdfLux => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get aO => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rE3Znq1db => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qsn6hq7 => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oGFsIMl => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tNy7Rftk => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get iB =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ybX1DO3zL =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get hRbHbi5 =>
      $composableBuilder(column: $table.autorId, builder: (column) => column);

  GeneratedColumn<String> get pWzWJFs =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<DateTime> get xmvUV91M =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
          ARpUcXEcU4toxru8LMyBl7DV8Cd,
          AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta,
          M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7,
          YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4,
          $$ReporteComentariosTableTableCreateCompanionBuilder,
          $$ReporteComentariosTableTableUpdateCompanionBuilder,
          (
            ARpUcXEcU4toxru8LMyBl7DV8Cd,
            BaseReferences<
              _Dd6MZrmiYCBX,
              BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
              ARpUcXEcU4toxru8LMyBl7DV8Cd
            >,
          ),
          ARpUcXEcU4toxru8LMyBl7DV8Cd,
          PrefetchHooks Function()
        > {
  GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4(
    _Dd6MZrmiYCBX db,
    BoBcnkhdbLdMOgKtsin3TNgWX7CJA table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> autorId = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
                vH: id,
                fWiwTihJ5: reporteId,
                peeUJ61: autorId,
                rgBeY5W: mensaje,
                pWlpsCw4: creadoEn,
                rL8KS: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reporteId,
                required String autorId,
                required String mensaje,
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB.insert(
                id: id,
                reporteId: reporteId,
                autorId: autorId,
                mensaje: mensaje,
                creadoEn: creadoEn,
                rL8KS: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteComentariosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
      ARpUcXEcU4toxru8LMyBl7DV8Cd,
      AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta,
      M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7,
      YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4,
      $$ReporteComentariosTableTableCreateCompanionBuilder,
      $$ReporteComentariosTableTableUpdateCompanionBuilder,
      (
        ARpUcXEcU4toxru8LMyBl7DV8Cd,
        BaseReferences<
          _Dd6MZrmiYCBX,
          BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
          ARpUcXEcU4toxru8LMyBl7DV8Cd
        >,
      ),
      ARpUcXEcU4toxru8LMyBl7DV8Cd,
      PrefetchHooks Function()
    >;
typedef $$ReporteEvidenciasTableTableCreateCompanionBuilder =
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI Function({
      required String id,
      required String reporteId,
      required String tipo,
      required String nombre,
      required String localPath,
      Value<String?> remoteUrl,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$ReporteEvidenciasTableTableUpdateCompanionBuilder =
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI Function({
      Value<String> id,
      Value<String> reporteId,
      Value<String> tipo,
      Value<String> nombre,
      Value<String> localPath,
      Value<String?> remoteUrl,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hD => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dZF4DgtNd => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jer7 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xLNv7C => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get astdNDXTP => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get to2ZPqpJq => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ojfjtElf => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dp => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dUCTTMpw1 => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qRCv => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uHtfeA => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get haYgM9dmw => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get p7t3mwLTS => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get s4VUb2zc => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get jA =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get btI139wWk =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get eozo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get hryZZ6 =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get owbrbNWf7 =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get pXmqKdY1X =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get iAnfWvkz =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          YoNU9Kgod2bozlWwHlObWuuh62Da,
          MqgZIJIZuGbeC3uaGFcCBQmY7J,
          VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt,
          CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO,
          FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk,
          $$ReporteEvidenciasTableTableCreateCompanionBuilder,
          $$ReporteEvidenciasTableTableUpdateCompanionBuilder,
          (
            MqgZIJIZuGbeC3uaGFcCBQmY7J,
            BaseReferences<
              _Dd6MZrmiYCBX,
              YoNU9Kgod2bozlWwHlObWuuh62Da,
              MqgZIJIZuGbeC3uaGFcCBQmY7J
            >,
          ),
          MqgZIJIZuGbeC3uaGFcCBQmY7J,
          PrefetchHooks Function()
        > {
  Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y(
    _Dd6MZrmiYCBX db,
    YoNU9Kgod2bozlWwHlObWuuh62Da table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
                sU: id,
                bY6ZOF0uo: reporteId,
                qS2I: tipo,
                p7B4JY: nombre,
                cOvZFXOUU: localPath,
                v8hFsLNip: remoteUrl,
                wFJWeFsv: creadoEn,
                nZy2D: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reporteId,
                required String tipo,
                required String nombre,
                required String localPath,
                Value<String?> remoteUrl = const Value.absent(),
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => Klv2WHU2z0Dg16Wk503cIncsPIiGTGI.insert(
                id: id,
                reporteId: reporteId,
                tipo: tipo,
                nombre: nombre,
                localPath: localPath,
                v8hFsLNip: remoteUrl,
                creadoEn: creadoEn,
                nZy2D: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteEvidenciasTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      YoNU9Kgod2bozlWwHlObWuuh62Da,
      MqgZIJIZuGbeC3uaGFcCBQmY7J,
      VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt,
      CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO,
      FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk,
      $$ReporteEvidenciasTableTableCreateCompanionBuilder,
      $$ReporteEvidenciasTableTableUpdateCompanionBuilder,
      (
        MqgZIJIZuGbeC3uaGFcCBQmY7J,
        BaseReferences<
          _Dd6MZrmiYCBX,
          YoNU9Kgod2bozlWwHlObWuuh62Da,
          MqgZIJIZuGbeC3uaGFcCBQmY7J
        >,
      ),
      MqgZIJIZuGbeC3uaGFcCBQmY7J,
      PrefetchHooks Function()
    >;
typedef $$ReporteParticipantesTableTableCreateCompanionBuilder =
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU Function({
      required String reporteId,
      required String userId,
      required String rol,
      Value<int> rowid,
    });
typedef $$ReporteParticipantesTableTableUpdateCompanionBuilder =
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU Function({
      Value<String> reporteId,
      Value<String> userId,
      Value<String> rol,
      Value<int> rowid,
    });

class M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cyhlo0QRV => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hMzLnq => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gaG => $composableBuilder(
    column: $table.rol,
    builder: (column) => ColumnFilters(column),
  );
}

class ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get gtogRz7Vz => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wQsQPm => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iId => $composableBuilder(
    column: $table.rol,
    builder: (column) => ColumnOrderings(column),
  );
}

class NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dBcHS7WdW =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get ncindi =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get usV =>
      $composableBuilder(column: $table.rol, builder: (column) => column);
}

class BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW,
          M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy,
          ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K,
          NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5,
          $$ReporteParticipantesTableTableCreateCompanionBuilder,
          $$ReporteParticipantesTableTableUpdateCompanionBuilder,
          (
            IKHFzRDpgFzjhWij3nsPu1GdzStvW,
            BaseReferences<
              _Dd6MZrmiYCBX,
              SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
              IKHFzRDpgFzjhWij3nsPu1GdzStvW
            >,
          ),
          IKHFzRDpgFzjhWij3nsPu1GdzStvW,
          PrefetchHooks Function()
        > {
  BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq(
    _Dd6MZrmiYCBX db,
    SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> reporteId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> rol = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
                c7fchPBLA: reporteId,
                bokW9m: userId,
                mIv: rol,
                eQbrO: rowid,
              ),
          createCompanionCallback:
              ({
                required String reporteId,
                required String userId,
                required String rol,
                Value<int> rowid = const Value.absent(),
              }) => T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU.insert(
                reporteId: reporteId,
                userId: userId,
                rol: rol,
                eQbrO: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteParticipantesTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
      IKHFzRDpgFzjhWij3nsPu1GdzStvW,
      M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy,
      ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K,
      NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5,
      $$ReporteParticipantesTableTableCreateCompanionBuilder,
      $$ReporteParticipantesTableTableUpdateCompanionBuilder,
      (
        IKHFzRDpgFzjhWij3nsPu1GdzStvW,
        BaseReferences<
          _Dd6MZrmiYCBX,
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW
        >,
      ),
      IKHFzRDpgFzjhWij3nsPu1GdzStvW,
      PrefetchHooks Function()
    >;

class VAZmCx0OIEHlhQoQlgP {
  final _Dd6MZrmiYCBX _bE;
  VAZmCx0OIEHlhQoQlgP(this._bE);
  USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L get rkRGgRKJ4cIRhxd =>
      USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L(_bE, _bE.fl4K2o4z8EmVE6Q);
  Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex get pZ8sFMP6dFmxib5NOwHdAbM7B =>
      Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex(
        _bE,
        _bE.oUFGqb3kTTei6pB1c72oFuUjt,
      );
  XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr get rXoR00fmPrApVdn83D =>
      XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr(_bE, _bE.cunYqbc3Zd0Chxytm9);
  QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK get reDicVqdGcIxSq =>
      QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK(_bE, _bE.p8RGehv9uW7gdv);
  RXAwq0eA5rYKGJP6ffVlZey1j6uJGi get z8fYqPiONtq =>
      RXAwq0eA5rYKGJP6ffVlZey1j6uJGi(_bE, _bE.khGDx8OWIxU);
  OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip get nPfxa64d5WYPwAqfeIWYa =>
      OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip(_bE, _bE.jU5VEJTz8C7WwoYYJfIlQ);
  JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J get uxpx1KevFJIqd0JoGl =>
      JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J(_bE, _bE.qaBIf6ei74qAD99wRU);
  L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7 get sofplN7VZmlMe =>
      L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7(_bE, _bE.tPzD7WczXfidC);
  GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4 get uusxiwdslQntl2WA2aKEZE3 =>
      GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4(
        _bE,
        _bE.kBIHzP5TOGzWkh2wMx36lse,
      );
  Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y get eLnD6CWqOo6pdniecrefNK =>
      Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y(
        _bE,
        _bE.mE07WRLPfW2zDpFYLRNsjU,
      );
  BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq get y1MbrKFWOfR0rg6UYq6ttzeyI =>
      BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq(
        _bE,
        _bE.xjLgqdIBlhdS5VmEqfZsjcQvX,
      );
}

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

final asistenciaRepositoryProvider = Provider<AsistenciaRepository>((ref) {
  return AsistenciaRepositoryImpl(
    ref.read(appDatabaseProvider),
  );
});

final asistenciaControllerProvider =
    StateNotifierProvider<WFCAuC3v1ianMKpJAKtS, AsistenciaState>((ref) {
      return WFCAuC3v1ianMKpJAKtS(
        ref.read(asistenciaRepositoryProvider),
        ref,
      );
    });

abstract class DYtn6oB0w8RrF8 {
  Future<void> fW8qkGXTyrF(Ro5fGjn4Vu ticket, {String? entidadId});
}
