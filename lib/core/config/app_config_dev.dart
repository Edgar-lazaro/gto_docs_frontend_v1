import 'app_config.dart';
import 'env.dart'; // donde esté definido AppEnv

const devConfig = AppConfig(
  env: AppEnv.dev,

  // Red / LAN
  allowedIpRanges: ['ip_ait/16', '10.0.0.0/8', '172.16.0.0/12'],

  // Backend
  // Configurable via IT/DNS (e.g. gto-docs-server.lan) or by editing this value.
  apiBaseUrl: 'ip_ait',
  apiPort: 3000,
  useHttps: false,

  // Auth
  authEndpoint: '/auth/login',
  useJwt: true,

  // GLPI
  glpiBaseUrl: 'http://ip_ait/glpi',
  glpiApiToken: 'PENDIENTE_DE_TI',
  glpiEntityId: 0,

  // Evidencias
  maxFileSizeMb: 100,
  allowedFileTypes: ['jpg', 'png', 'pdf'],

  // Features
  enableBiometrics: false,
  enableIA: false,
  enablePush: false,
);
