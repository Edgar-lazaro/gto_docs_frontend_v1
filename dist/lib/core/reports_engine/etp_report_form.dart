import 'package:flutter/material.dart';

import 'etp_models.dart';
import '../../shared/ui/widgets/section_container.dart';

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
