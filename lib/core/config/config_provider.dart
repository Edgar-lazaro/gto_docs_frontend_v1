import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_config.dart';
import 'app_environment.dart';
import 'app_config_dev.dart';
import 'app_config_qa.dart';
import 'app_config_prod.dart';

const _currentEnv = AppEnvironment.dev;

String _readDefine(String key) {
  return String.fromEnvironment(key, defaultValue: '').trim();
}

AppConfig _applyOverrides(AppConfig base) {
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

  return AppConfig(
    env: base.env,
    allowedIpRanges: base.allowedIpRanges,
    apiBaseUrl: apiBaseUrl.isNotEmpty ? apiBaseUrl : base.apiBaseUrl,
    apiPort: apiPort ?? base.apiPort,
    useHttps: useHttps ?? base.useHttps,
    authEndpoint: base.authEndpoint,
    useJwt: base.useJwt,
    glpiBaseUrl: glpiBaseUrl.isNotEmpty ? glpiBaseUrl : base.glpiBaseUrl,
    glpiApiToken: base.glpiApiToken,
    glpiEntityId: base.glpiEntityId,
    maxFileSizeMb: base.maxFileSizeMb,
    allowedFileTypes: base.allowedFileTypes,
    enableBiometrics: base.enableBiometrics,
    enableIA: base.enableIA,
    enablePush: base.enablePush,
  );
}

final appConfigProvider = Provider<AppConfig>((ref) {
  switch (_currentEnv) {
    case AppEnvironment.dev:
      return _applyOverrides(devConfig);
    case AppEnvironment.qa:
      return _applyOverrides(qaConfig);
    case AppEnvironment.prod:
      return _applyOverrides(prodConfig);
  }
});
