import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'checklist_models.dart';
import '../../shared/ui/widgets/section_container.dart';

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
