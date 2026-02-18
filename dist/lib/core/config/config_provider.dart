import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_config.dart';
import 'app_environment.dart';
import 'app_config_dev.dart';
import 'app_config_qa.dart';
import 'app_config_prod.dart';

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
