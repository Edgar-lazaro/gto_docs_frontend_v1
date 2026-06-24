import 'app_config.dart';
import 'env.dart'; // donde esté definido AppEnv

const devConfig = AppConfig(
  env: AppEnv.dev,

  // Red / LAN
  allowedIpRanges: ['192.168.0.0/16', '10.0.0.0/8', '172.16.0.0/12'],

  // Backend
  apiBaseUrl: '10.105.0.59',
  apiPort: 3000,
  useHttps: false,

  // Auth
  authEndpoint: '/auth/login',
  useJwt: true,

  // GLPI
  glpiBaseUrl: 'http://192.168.0.11:8080',
  glpiApiToken: 'LHLk42jhfjII6uejzSl9U3PDk3cvW2qU7HKxGBAL',
  glpiEntityId: 0,

  // Evidencias
  maxFileSizeMb: 100,
  allowedFileTypes: ['jpg', 'png', 'pdf'],

  // Features
  enableBiometrics: false,
  enableIA: false,
  enablePush: false,
);
